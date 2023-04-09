{ core-inputs
, user-inputs
, flake-libs
}:

let
  inherit (core-inputs.nixpkgs.lib) assertMsg fix fold filterAttrs;

  core-inputs-libs = flake-libs.flake.get-libs (snowfall-lib.flake.without-self core-inputs);
  user-inputs-libs = flake-libs.flake.get-libs (snowfall-lib.flake.without-self user-inputs);

  snowfall-top-level-lib = filterAttrs (name: value: !builtins.isAttrs value) flake-libs;

  base-lib = flake-libs.attrs.merge-shallow [
    core-inputs.nixpkgs.lib
    core-inputs-libs
    user-inputs-libs
    snowfall-top-level-lib
    { snowfall = flake-libs; }
  ];

  user-lib-root = flake-libs.fs.get-file "lib";
  user-lib-modules = flake-libs.fs.get-default-nix-files-recursive user-lib-root;

  user-lib = fix (user-lib:
    let
      attrs = {
        inputs = flake-libs.flake.without-snowfall-inputs user-inputs;
        snowfall-inputs = core-inputs;
        lib = flake-libs.attrs.merge-shallow [ base-lib user-lib ];
      };
      libs = builtins.map
        (path: import path attrs)
        user-lib-modules;
    in
    flake-libs.attrs.merge-deep libs
  );

  system-lib = flake-libs.attrs.merge-shallow [
    base-lib
    user-lib
  ];
in
{
  internal = {
    inherit system-lib user-lib;
  };
}
