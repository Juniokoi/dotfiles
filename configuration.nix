{ config, pkgs, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  imports = [ ./hardware-configuration.nix ];

  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  services.teamviewer.enable = true;

  # Configure keymap in X11
  environment.pathsToLink = [ "/libexec" ];
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";
	XCURSOR_SIZE = "16";

	PATH = [
		"\${HOME}/.bin"
	];
  };

  # Enable CUPS to print documents.
  services = {
    printing.enable = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   #jack.enable = true;
  # };

  #Bluetooth
 hardware.pulseaudio = {
     enable = true;
     package = pkgs.pulseaudioFull;
   };
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.blueman.enable = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.junio.shell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "FiraCode" ]; })
  ];

  programs.thunar = {
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
    enable = true;
  };
  # Unstable Packages
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

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

      stylua

      statix
      nixfmt

      obs-studio
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-utils
      vscode
      ubuntu_font_family

      libxcrypt
      # unstable.jetbrains.idea-ultimate
      # unstable.jetbrains.clion
      unstable.jetbrains-toolbox

      # Ruby
      bundix
      ruby_3_1
      solargraph
      rubyPackages_3_1.openssl
      rubyPackages_3_1.rspec-core

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
      zip
      unzip
      fzf
      obsidian
      libreoffice-qt

      authy

      #Utilities for graphic card
      xdotool
      lshw
      mesa
      pciutils
      toybox

      pavucontrol
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
      discord
      htop

      # Oxidized tools
      hwatch  # watch
      unstable.joshuto # ranger
      unstable.zoxide  # autoload, z
      unstable.fd      # find
      unstable.ripgrep # grep
      gitui   # lazygit
      bottom  # htop
      zellij  # tmux
      delta   # diff
      du-dust # du
    ];
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    digimend.enable = true; # Set Huion, XP-Pen, etc. tablets
    desktopManager = {
      xterm.enable = false;
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

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  networking = {
    defaultGateway = "192.168.0.1";
    nameservers = [ "1.1.1.1" ];
    # firewall = {
    # allowedTCPPorts = [ ... ];
    # allowedUDPPorts = [ ... ];
    # enable = false;
    # }
  };

  #nixpkgs.overlays = [
  #(self: super: {
  #discord = super.discord.overrideAttrs (
  #_: { src = builtins.fetchTarball {
  #url = "https://discord.com/api/download?platform=linux&format=tar.gz";
  #sha256 = "0000000000000000000000000000000000000000000000000";
  #}; }
  #);
  #})
  #];

  system.stateVersion = "22.11"; # Change only if necessary

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
