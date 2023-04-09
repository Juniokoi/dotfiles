{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.settings.desktop.i3;
  term = config.settings.system.terminal-emulator;
  substitutedConfig = pkgs.substituteAll {
    src = ./config;
    term = term.pkg.pname or term.pkg.name;
  };
in
{
  options.settings.desktop.i3 = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
    wallpaper = mkOpt (nullOr package) null "The wallpaper to display.";
    extraConfig =
      mkOpt str "" "Additional configuration for the i3 config file.";
  };

  config = mkIf cfg.enable {
    # Desktop additions
    settings.desktop.addons = {
      gtk = enabled;
      foot = enabled;
      mako = enabled;
      rofi = enabled;
      wofi = enabled;
      swappy = enabled;
      kanshi = enabled;
      waybar = enabled;
      keyring = enabled;
      xdg-portal = enabled;
      electron-support = enabled;
    };

    settings.home.configFile."i3/config".text =
      fileWithText substitutedConfig ''
        #############################
        #░░░░░░░░░░░░░░░░░░░░░░░░░░░#
        #░░█▀▀░█░█░█▀▀░▀█▀░█▀▀░█▄█░░#
        #░░▀▀█░░█░░▀▀█░░█░░█▀▀░█░█░░#
        #░░▀▀▀░░▀░░▀▀▀░░▀░░▀▀▀░▀░▀░░#
        #░░░░░░░░░░░░░░░░░░░░░░░░░░░#
        #############################

        # Launch services waiting for the systemd target sway-session.target
        exec "systemctl --user import-environment; systemctl --user start sway-session.target"

        # Start a user session dbus (required for things like starting
        # applications through wofi).
        exec dbus-daemon --session --address=unix:path=$XDG_RUNTIME_DIR/bus

        ${optionalString (cfg.wallpaper != null) ''
          output * {
            bg ${cfg.wallpaper.gnomeFilePath or cfg.wallpaper} fill
          }
        ''}

        ${cfg.extraConfig}
      '';

    programs.sway = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        swaylock
        swayidle
        xwayland
        sway-contrib.grimshot
        swaylock-fancy
        wl-clipboard
        wf-recorder
        libinput
        playerctl
        brightnessctl
        glib # for gsettings
        gtk3.out # for gtk-launch
        gnome.gnome-control-center
      ];

      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
        export XDG_SESSION_TYPE=wayland
        export XDG_SESSION_DESKTOP=sway
        export XDG_CURRENT_DESKTOP=sway
      '';
    };

    environment.systemPackages = with pkgs;
      [
        (pkgs.writeTextFile {
          name = "starti3";
          destination = "/bin/starti3";
          executable = true;
          text = ''
            #! ${pkgs.bash}/bin/bash

            # Import environment variables from the login manager
            systemctl --user import-environment

            # Start i3
            exec systemctl --user start i3.service
          '';
        })
      ];

	  services.xserver = {
		  enable = true;
		  libinput.enable = true;
		  displayManager.defaultSession = "none+i3";
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
  }
