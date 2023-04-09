{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.settings.desktop;
in
{
  options.settings.desktop = with types; {
    sddm = mkBoolOpt true "Whether or not to enable sddm.";
    gdm = mkBoolOpt false "Whether or not to enable sddm.";
  };

  config = mkIf (cfg.sddm || cfg.gdm) {
	  services.xserver.displayManager = mkIf cfg.sddm {
		  sddm.enable = true;
	  };
	  services.xserver.displayManager = mkIf cfg.gdm {
		  gdm.enable = true;
	  };
  };
