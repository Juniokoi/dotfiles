{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.archetypes.gaming;
in
{
  options.koi.archetypes.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming archetype.";
  };

  config = mkIf cfg.enable {
    koi.suites = {
      common = enabled;
      desktop = enabled;
      games = enabled;
      social = enabled;
      media = enabled;
    };
  };
}
