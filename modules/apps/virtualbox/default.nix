{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.apps.virtualbox;
in
{
  options.koi.apps.virtualbox = with types; {
    enable = mkBoolOpt false "Whether or not to enable Virtualbox.";
  };

  config = mkIf cfg.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

    koi.user.extraGroups = [ "vboxusers" ];
  };
}
