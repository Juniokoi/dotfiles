# systems.nix

{ system ? builtins.currentSystem }:

let
  # Função auxiliar para gerar o nome do perfil a partir do caminho do arquivo
  getProfileName = path: builtins.replaceStrings ./. [""] path;
in
rec {
  # Função para criar o perfil `nix develop` para um determinado sistema e perfil
  createProfile = { system, profileName }:
    let
      # Caminho completo para o perfil
      profilePath = "./${system}/${profileName}";
    in
    {
      inherit system profileName;
      program = "nix";
      args = ["develop", "--profile", profilePath];
      message = "Entering profile ${profileName} for ${system}...";
    };

  # Função para criar o perfil `nix develop` para um perfil sem especificar o sistema
  createProfileWithoutSystem = profileName:
    createProfile { system = system; profileName = profileName; };

  # Função para criar perfis `nix develop` para todos os arquivos encontrados na pasta `./systems`
  createProfiles = let
      # Lista de todos os arquivos encontrados na pasta `./systems/`
      files = builtins.readDir ./.;
      # Função para criar o perfil `nix develop` e retornar o caminho completo para o perfil
      getProfilePath = profileName: "./${system}/${profileName}";
    in
    builtins.listToAttrs (builtins.map (profileName:
      {
        "${getProfileName profileName}" = createProfile { system = system; profileName = profileName; };
        "${getProfilePath profileName}" = profileName;
      }
    ) files);
}
