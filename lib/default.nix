# This file is built on top of Snowfall-lib (https://github.com/snowfallorg/lib)
# A project by Jake Hamilton (https://github.com/jakehamilton/)

core-inputs: user-options:

let
  user-inputs = user-options.inputs // { src = user-options.src; };

  inherit (core-inputs.nixpkgs.lib)
    assertMsg fix filterAttrs mergeAttrs fold recursiveUpdate;

  # Recursively merge a list of attribute sets.
  # Type: [Attrs] -> Attrs
  # Usage: merge-deep [{ x = 1; } { x = 2; }]
  #   result: { x = 2; }
  merge-deep = fold recursiveUpdate { };

  # Merge the root of a list of attribute sets.
  # Type: [Attrs] -> Attrs
  # Usage: merge-shallow [{ x = 1; } { x = 2; }]
  #   result: { x = 2; }
  merge-shallow = fold mergeAttrs { };

  # Transform an attribute set of inputs into an attribute set where
  # the values are the inputs' `lib` attribute. Entries without a `lib`
  # attribute are removed.
  # Type: Attrs -> Attrs
  # Usage: get-libs{ x = nixpkgs; y = {}; }
  #   result: { x = nixpkgs.lib; }
  get-libs = attrs:
    let
      # @PERF(jakehamilton): Replace filter+map with a fold.
      attrs-with-libs =
        filterAttrs (name: value: builtins.isAttrs (value.lib or null)) attrs;
      libs = builtins.mapAttrs (name: input: input.lib) attrs-with-libs;
    in libs;

  # Remove the `self` attribute from an attribute set.
  # Type: Attrs -> Attrs
  # Usage: without-self { self = {}; x = true; }
  #   result: { x = true; }
  without-self = attrs: builtins.removeAttrs attrs [ "self" ];

  core-inputs-libs = get-libs (without-self core-inputs);
  user-inputs-libs = get-libs (without-self user-inputs);

	flake-libs-root = "${core-inputs.src}/lib/flake-libs";
	flake-libs-dirs =
		let
			files = builtins.readDir flake-libs-root;
			dirs  = filterAttrs (name: kind: kind == "directory") files;
			names = builtins.attrNames dirs;
		in names;

	flake-libs = fix (flake-libs:
		let
      attrs = { inherit flake-libs core-inputs user-inputs; };
      libs = builtins.map (dir: import "${flake-libs-root}/${dir}" attrs)
        flake-libs-dirs;
    in merge-deep libs);

  flake-top-level-libs=
    filterAttrs (name: value: !builtins.isAttrs value) flake-libs

  base-libs= merge-shallow [
    core-inputs.nixpkgs.lib
    core-inputs-libs
    user-inputs-libs
    flake-top-level-lib
    { flake = snowfall-libs }
  ];

  user-libs-root = "${user-inputs.src}/lib";
  user-libs-modules =
		flake-libs.get-default-nix-files-recursive user-lib-root;

  user-libs = fix (user-libs:
    let
      attrs = {
        inherit (user-options) inputs;
        flake-inputs = core-inputs;
        lib = merge-shallow [ base-libs-user-lib ];
      };
      libs = builtins.map (path: import path attrs) user-libs-modules;
    in merge-deep libs);

  lib = merge-deep [ base-libs-user-lib ];

  user-inputs-has-self = builtins.elem "self" (builtins.attrNames user-inputs);
  user-inputs-has-src = builtins.elem "src" (builtins.attrNames user-inputs);
in assert (assertMsg (user-inputs-has-self)
  "Missing attribute `self` for mkLib.");
assert (assertMsg (user-inputs-has-src) "Missing attribute `src` for mkLib.");
lib
