{ config, pkgs, ... }:

{
  imports =
	[ # Include the results of the hardware scan.
		./hardware-configuration.nix
	];

  # Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.efi.efiSysMountPoint = "/boot/efi";
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  programs.sway = {
	enable = true;
	extraOptions = [ "--verbose" ];
	extraSessionCommands = ''
		export SDL_VIDEODRIVER=wayland
		export QT_QPA_PLATFORM=wayland-egl
		export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
		export _JAVA_AWT_WM_NONREPARENTING=1
	'';
	extraPackages = with pkgs; [
		wlr-randr
		wl-clipboard
		clipman
		wlsunset
		wf-recorder
		showmethekey
		kanshi
		wofi
		dunst
	];
  };

# Configure keymap in X11
  services.xserver = {
	displayManager = {
		sddm.enable = true;
		defaultSession = "sway";
	};
	desktopManager.gnome.enable = true;
	layout = "us";
	xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.junio.shell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

 fonts.fonts = with pkgs; [
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	fira-code
	(nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" "FiraCode" ]; })
  ];

  users.users.junio = {
	isNormalUser = true;
	description = "junio";
	initialPassword = "123";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [
git
		gcc
		zoxide
		nodejs
		python3
		starship
		zip
		unzip
		fzf
		fd
		ripgrep
		lua
		luajit
		gnumake
		stow
		cmake
		gnupg
		direnv
		htop
	  ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "junio";

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

  nixpkgs.overlays = [
	(self: super: {
		discord = super.discord.overrideAttrs (
		_: { src = builtins.fetchTarball {
				url = "https://discord.com/api/download?platform=linux&format=tar.gz";
				sha256 = "000000000000000000000000000000000000000000000000000";
			}; }
		);
	})
  ];

  system.stateVersion = "22.11"; # Change only if necessary
}
