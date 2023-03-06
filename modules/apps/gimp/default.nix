{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.apps.gimp;
in
{
  options.koi.apps.gimp = with types; {
    enable = mkBoolOpt false "Whether or not to enable Gimp.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ gimp ]; };
}
