{ options, config, lib, ... }:

with lib;
with lib.internal;
let cfg = config.koi.system.xkb;
in
{
  options.koi.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      layout = "us";
      xkbOptions = "caps:escape";
    };
  };
}
