{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let cfg = config.koi.tools.direnv;
in
{
  options.koi.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    koi.home.extraOptions = {
      programs.direnv = {
        enable = true;
        nix-direnv = enabled;
      };
    };
  };
}
