{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let cfg = config.koi.desktop.addons.waybar;
in
{
  options.koi.desktop.addons.waybar = with types; {
    enable =
      mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ waybar ];

    koi.home.configFile."waybar/config".source = ./config;
    koi.home.configFile."waybar/style.css".source = ./style.css;
  };
}
