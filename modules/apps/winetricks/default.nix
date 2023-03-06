{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.apps.winetricks;
in
{
  options.koi.apps.winetricks = with types; {
    enable = mkBoolOpt false "Whether or not to enable Winetricks.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ winetricks ]; };
}
