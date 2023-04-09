{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let cfg = config.settings.tools.direnv;
in
{
  options.settings.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    settings.home.extraOptions = {
      programs.direnv = {
        enable = true;
        nix-direnv = enabled;
      };
    };
  };
}
