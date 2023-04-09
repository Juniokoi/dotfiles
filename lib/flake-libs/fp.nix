# This file is built on top of flake-libs (https://github.com/snowfallorg/lib)
# A project by Jake Hamilton (https://github.com/jakehamilton/)

{ core-inputs
, user-inputs
, flake-libs
}:

let
  inherit (builtins) baseNameOf dirOf;
  inherit (core-inputs.nixpkgs.lib) id foldr flip;
in
{
  fp = rec {
    # Compose two functions.
    # Type: (b -> c) -> (a -> b) -> a -> c
    # Usage: compose add-two add-one
    #   result: (x: add-two (add-one x))
    compose = f: g: x: f (g x);

    # Compose many functions.
    # Type: [(x -> y)] -> a -> b
    # Usage: compose-all [ add-two add-one ]
    #   result: (x: add-two (add-one x))
    compose-all = foldr compose id;

    # Call a function with an argument.
    # Type: (a -> b) -> a -> b
    # Usage: call (x: x + 1) 0
    #   result: 1
    call = f: x: f x;

    # Apply an argument to a function.
    # Type: a -> (a -> b) -> b
    # Usage: call (x: x + 1) 0
    #   result: 1
    apply = flip call;
  };
}
