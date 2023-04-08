{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let cfg = config.settings.tools.utils;
in
{
  options.settings.tools.misc = with types; {
    enable = mkBoolOpt false
      "Whether or not to enable common utilities.";
    rusty = mkBoolOpt false
      "Whether or not to enable rust substitutes utilities.";
  };

  config = mkIf cfg.enable {
    settings.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      htop
      fzf
      killall
      unzip
      file
      jq
      clac
      wget
      ] ++ mkIf cfg.rusty [
      sd
      exa
      bat
      wiki-tui
      skim
      broot
      hyperfine
      hwatch
      joshuto # ranger
      zoxide  # autoload, z
      fd      # find
      ripgrep # grep
      bottom  # htop
      delta   # diff
      du-dust # du
    ];
  };
}
