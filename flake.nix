
{
  description = "junio's system configuration";

  inputs = rec {
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

		flake-compat = {
		  url = "./misc/flake-compat";
		  flake = false;
		};

		systems = {
			url = "./systems";
			flake = false;
		};
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      systems,
      ...
    }:

    with builtins;

	let
		lib = import [ ./lib ];
		localpkgs = import ./pkgs;
		extralib = self: super: import ./lib/extrafn.nix { pkgs = super; };
		allPkgs = lib.mkPkgs {
			inherit nixpkgs;
			overlays = [ localpkgs extralib ];
		};
		user = "junio";
    in
    {
      devShell = lib.withDefaultSystems (sys:
        let
          pkgs = allPkgs."${sys}";
        in
	  import ./shell.nix { inherit pkgs; });

	  # mkFlake { inherit inputs, src = ./. }

	  packages = lib.mkSearchablePackages allPkgs;
	  overlays = [
		(final: prev: {
		  nixosConfigurations = prev.nixosConfigurations // {};

		  # Função para criar os perfis `nix develop` para cada sistema
		  systemsProfiles =
			systems.inputs // {} // import systems.url { inherit systems; };

		  # Função para obter o caminho completo do perfil `nix develop`
		  profilePath = system: profile: {
			localPath = "${./systems}/${system}/${profile}";
			absolutePath = builtins.toPath localPath;
		  };
		})
	  ];

  };
}
#eol
