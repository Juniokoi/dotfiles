{ options, config, lib, ... }:

with lib;
with lib.internal;
let cfg = config.settings.system.xkb;
in
{
  options.settings.system.xkb = with types; {
    enable = mkBoolOpt true "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
	services.xserver.xkbOptions = "";

    services.xserver = {
      layout = "us";
      xkbOptions = "caps:ctrl_modifier,compose:lctrl";
    };
  };
