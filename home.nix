{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "junio";
  home.homeDirectory = "/home/junio";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
	  authy
	  fd
	  sd
	  exa
	  bat
	  ripgrep
	  wiki-tui
	  skim
	  broot
	  sway-contrib.grimshot
	  alacritty
	  hyperfine
	  neovim
	  brave
	  lazygit
	  rustc
	  cargo
	  rust-analyzer
	  rustfmt
	  go
	  tmux
	  sumneko-lua-language-server
	  alacritty
	  bitwarden-cli
  ];
}
