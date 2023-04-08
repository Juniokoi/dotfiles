
{
  description = "junio's system configuration";

  inputs = {
    unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs.url  = "nixpkgs/nixos-22.11";

    systems.url = "file://./systems";
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
      lib = import ./lib;
      localpkgs = import ./pkgs;
      extralib = self: super: import ./lib/extrafn.nix { pkgs = super; };

      allPkgs = lib.mkPkgs {
        inherit nixpkgs;
        cfg = { allowUnfree = true; };
        overlays = [ localpkgs extralib ];
      };
    in

    {
      devShell = lib.withDefaultSystems (sys:
        let
          pkgs = allPkgs."${sys}";
        in
          import ./shell.nix { inherit pkgs; });

      packages = lib.mkSearchablePackages allPkgs;

      overlays = [
        (final: prev: {
          nixosConfigurations = prev.nixosConfigurations // {};

          # Função para criar os perfis `nix develop` para cada sistema
          systemsProfiles =
            systems.inputs // {} // import systems.url { inherit systems; };
          nixosConfigurations.${systemName} =
            systemsProfiles.${systemName} // {};

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
