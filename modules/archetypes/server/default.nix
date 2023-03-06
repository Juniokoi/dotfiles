{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.archetypes.server;
in
{
  options.koi.archetypes.server = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable the server archetype.";
  };

  config = mkIf cfg.enable {
    koi = {
      suites = {
        common-slim = enabled;
      };

      cli-apps = {
        neovim = enabled;
        tmux = enabled;
      };
    };
  };
}
