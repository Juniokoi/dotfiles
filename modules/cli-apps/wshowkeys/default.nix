{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.cli-apps.wshowkeys;
in
{
  options.koi.cli-apps.wshowkeys = with types; {
    enable = mkBoolOpt false "Whether or not to enable wshowkeys.";
  };

  config = mkIf cfg.enable {
    koi.user.extraGroups = [ "input" ];
    environment.systemPackages = with pkgs; [ wshowkeys ];
  };
}
