{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let cfg = config.koi.tools.misc;
in
{
  options.koi.tools.misc = with types; {
    enable = mkBoolOpt false "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    koi.home.configFile."wgetrc".text = "";
## TODO: Add my things here
    environment.systemPackages = with pkgs; [
      fzf
      killall
      unzip
      file
      jq
      clac
      wget
    ];
  };
}
