{	description = "junio's system configuration";
	inputs = {
		nixpkgs.url  = "nixpkgs/nixos-22.11";
		unstable.url = "nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-22.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Run unpatched dynamically compiled binaries
		nix-ld = {
			url = "github:Mic92/nix-ld";
			inputs.nixpkgs.follows = "unstable";
		};

		# System Deployment
		deploy-rs.url = "github:serokell/deploy-rs";
		deploy-rs.inputs.nixpkgs.follows = "unstable";

	};

	outputs = inputs:
		let
		lib = inputs.snowfall-lib.mkLib {
			inherit inputs;
			src = ./.;
		};
	in
		lib.mkFlake {
				package-namespace = "junio";

				channels-config.allowUnfree = true;

				systems.modules = with inputs; [
					home-manager.nixosModules.home-manager
					nix-ld.nixosModules.nix-ld
				];

				deploy = lib.mkDeploy { inherit (inputs) self; };

				checks =
					builtins.mapAttrs
					(system: deploy-lib:
					 deploy-lib.deployChecks inputs.self.deploy)
					inputs.deploy-rs.lib;
			};
	}
#eol
