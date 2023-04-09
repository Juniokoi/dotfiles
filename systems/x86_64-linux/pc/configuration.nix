{ config, pkgs, ... }:

{
  networking.
  imports = [ ./hardware-configuration.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";

  # Enable networking
  networking.networkmanager.enable = true;
  services.teamviewer.enable = true;

  # Configure keymap in X11

  # Enable CUPS to print documents.
  services = {
    printing.enable = true;
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.junio.shell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Unstable Packages
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  services.emacs = {
    enable= true;
  };

  # haskell
  services.hoogle.enable = true;

  users.users.junio = {
    isNormalUser = true;

    initialPassword = "123";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      bluez
      bluez-tools
      bluez-alsa
      git
      gcc
      zlib
      libtool
      libffi
      libyaml
      patch
      nodejs
      openssl
      redshift
      neofetch
      microsoft-edge

      pkgconfig

      # linters
      shfmt
      shellcheck
      html-tidy
      nodePackages.stylelint
      nodePackages.js-beautify
      editorconfig-core-c
      mu
      gopls
      sqlite
      stylua
      statix
      nixfmt
      offlineimap
      imagemagick
      emacsPackages.markdown-preview-mode
      haskell-language-server
      cabal-install

      # libs
      jq
      zip
      unzip
      gnugrep
      grip-search
      fzf


      obs-studio
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-utils
      unstable.vscode
      ubuntu_font_family

      libxcrypt
      # unstable.jetbrains.idea-ultimate
      # unstable.jetbrains.clion
      unstable.jetbrains-toolbox
      neovide

      alacritty
      neovim
      go
      lazygit
      tmux
      sumneko-lua-language-server
      alacritty
      bitwarden
      trilium-desktop
      unstable.helix

      unstable.rustup

      vulkan-tools
      vulkan-headers
      amdvlk
      driversi686Linux.amdvlk

      notion-app-enhanced
      gimp
      opentabletdriver
      python3
      starship

      ## Software
      calibre
      obsidian
      libreoffice-qt

      authy

      #Utilities for graphic card
      xdotool
      lshw
      mesa
      pciutils
      toybox

      lua
      luajit
      sumneko-lua-language-server
      sway-contrib.grimshot
      waybar
      gnumake
      stow
      cmake
      gnupg
      direnv
      spotify
      stremio
      discord

# Oxidized tools
      ];
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    digimend.enable = true; # Set Huion, XP-Pen, etc. tablets
      desktopManager = {
        gnome.enable = true;
      };
    displayManager = {
      autoLogin = {
        enable = true;
        user = "junio";
      };
      sddm.enable = true;
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
          i3lock
          i3blocks
          xcolor
          feh
          rofi
          dunst
          xorg.xmodmap
          xorg.xwininfo
          xidlehook
          xclip
          flameshot
          lxappearance
      ];
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
    fade = false;
    settings = {
      wintypes = {
# normal = { fade = true; focus = true; shadow = true; };
        tooltip = { fade = true; shadow = true; opacity = 1; focus = true; full-shadow = false; };
        dock = { shadow = false; clip-shadow-above = true; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 0.8; };
        dropdown_menu = { opacity = 0.8; };
      };
    };
  };

# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services.trilium-server = {
    enable= true;
    noAuthentication = true;
    port = 5454;
  };

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget

  environment.systemPackages = with pkgs; [
    vim
      wget
      firefox
      (wrapOBS { plugins = with pkgs.obs-studio-plugins; [ wlrobs ]; })
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

## OBS packages
    boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

## Graphic card
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
      rocm-opencl-runtime
  ];
  environment.variables.VK_ICD_FILENAMES =
    "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
}
