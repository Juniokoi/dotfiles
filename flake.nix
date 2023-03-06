{
	description = "Koi";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixos-hardware.url = "github:nixos/nixos-hardware";

		nixos-generators.url = "github:nix-community/nixos-generators";
		nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

		comma.url = "github:nix-community/comma";
		comma.inputs.nixpkgs.follows = "unstable";

		# System Deployment
		deploy-rs.url = "github:serokell/deploy-rs";
		deploy-rs.inputs.nixpkgs.follows = "unstable";

		# Run unpatched dynamically compiled binaries
		nix-ld.url = "github:Mic92/nix-ld";
		nix-ld.inputs.nixpkgs.follows = "unstable";

        #
        # Libs
		flake.url = "github:snowfallorg/flake";
		flake.inputs.nixpkgs.follows = "unstable";

		flake-utils.url = "github:numtide/flake-utils";

		snowfall-lib.url = "github:snowfallorg/lib/dev";
		snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";
	};
	outputs = inputs: 
	let
		lib = inputs.snowfall-lib.mkLib {
			inherit inputs;
			src = ./.;
		};
	in
		lib.mkFlake {
		package-namespace = "koi";

		channels-config.allowUnfree = true;

		overlays = with inputs; [
			flake.overlay
		];

		systems.modules = with inputs; [
			home-manager.nixosModules.home-manager
			nix-ld.nixosModules.nix-ld
		];

	};
} #eol
