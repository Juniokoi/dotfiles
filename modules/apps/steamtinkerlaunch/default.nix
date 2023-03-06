{ lib, pkgs, config, ... }:

let
  cfg = config.koi.apps.steamtinkerlaunch;

  inherit (lib) mkIf mkEnableOption;
in
{
  options.koi.apps.steamtinkerlaunch = {
    enable = mkEnableOption "Steam Tinker Launch";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      steamtinkerlaunch
    ];
  };
}
