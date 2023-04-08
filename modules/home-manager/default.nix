{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.internal;
let cfg = config.settings.home;
in
{
  imports = with inputs; [
    home-manager.settings.home-manager
  ];

  options.settings.home = with types; {
    file = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
  };

  config = {
    settings.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.settings.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.settings.home.configFile;
    };

    home-manager = {
      useUserPackages = true;

      users.${config.settings.user.name} =
        mkAliasDefinitions options.settings.home.extraOptions;
    };
  };
}
