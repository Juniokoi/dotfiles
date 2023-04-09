{	description = "junio's system configuration";
	inputs = {
	  	nixpkgs.url  = "nixpkgs/nixos-22.11";
	  	unstable.url = "nixpkgs/nixos-unstable";

	  	home-manager = {
	  		url = "github:nix-community/home-manager/release-22.11";
	  		inputs.nixpkgs.follows = "nixpkgs";
	  	};

	  	# Run unpatched dynamically compiled binaries
	  	nix-ld = {
	  		url = "github:Mic92/nix-ld";
	  		inputs.nixpkgs.follows = "unstable";
	  	};

	  	flake-compact = {
	  	  url = "./misc/flake-compact.nix";
	  	  flake = false;
	  	};

	  	systems = {
	  		url = "./systems/default.nix";
	  		flake = false;
	  	};
	};

	outputs = inputs@{ self, nixpkgs, systems, ... }:
	let
		core-inputs =
			inputs // { src = ./.; };

		mkLib = import ./lib core-inputs;

		mkFlake = flake-and-lib-options@{ inputs, src, ... }:
			let
				lib = mkLib {
					inherit inputs src;
				};
				flake-options =
					builtins.removeAttrs flake-and-lib-options [ "inputs" "src" ];
			in
				lib.mkFlake flake-options;
    in
    {
		inherit mkLib mkFlake;

		mkLib { inherit inputs; src = ./.; }
		mkFlake {
			package-namespace = "settings";

			systems.modules = with inputs; [
				home-manager.nixosModules.home-manager
				nix-ld.nixosModules.nix-ld
			];
		};
	};
}
#eol
