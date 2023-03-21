{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

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

# Enable CUPS to print documents.
	services = {
		printing.enable = true;
		emacs = {
			enable = true;
			install = true;
			package = pkgs.emacsUnstable;
		};
	};

	nixpkgs.overlays = [
		(import (builtins.fetchTarball {
			url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
			sha256 = "0yikij7r12kspfhp3rqr8lnfw49bzl9jsv021kyimffg518y8ncv";
		}))
	];

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

	programs.fish.enable = true;
	users.defaultUserShell = pkgs.fish;
	users.users.junio.shell = pkgs.fish;
	environment.shells = with pkgs; [ fish ];

	fonts.fonts = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		fira-code
		(nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" "FiraCode" ]; })
	];

	programs.thunar = {
		plugins = with pkgs.xfce; [
			thunar-archive-plugin
			thunar-volman
		];
		enable = true;
	};

	users.users.junio = {
		isNormalUser = true;
		description = "junio";
		initialPassword = "123";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			git
			zlib
			libtool
			libffi
			libyaml
			patch
			openssl
			joshuto
			neofetch
			statix
			alejandra
			gcc
			zoxide
			nodejs

			obs-studio
			xdg-desktop-portal
			xdg-desktop-portal-wlr
			vscode

			jetbrains.idea-ultimate
			jetbrains.ruby-mine
			solargraph

			asdf-vm

      # Ruby
			ruby_3_1
			rubyPackages_3_1.rspec-core
			rubyPackages_3_1.openssl
			bundix

			notion-app-enhanced
			libreoffice-qt
			gimp
			opentabletdriver
			python3
			starship
			zip
			unzip
			fzf
			fd

			authy

			ripgrep
			pavucontrol
			lua
			luajit
			sway-contrib.grimshot
			waybar
			gnumake
			stow
			cmake
			gnupg
			direnv
			hwatch
			spotify
			discord
			htop
		];
	};

	services.xserver = {
		enable = true;
		layout = "us";
		xkbVariant = "";
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
# Enable automatic login for the user.

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
	  (wrapOBS {
			plugins = with pkgs.obs-studio-plugins; [
			  wlrobs
			];
		})
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

	boot.extraModulePackages = with config.boot.kernelPackages; [
		v4l2loopback
	];
}
