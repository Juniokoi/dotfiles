{options, config, pkgs, ...}:

let cfg = config.settings.hardware.audio;
in
{
	options.settings.hardware.audio = with types; {
		enable = mkBoolOpt false "Wheter or not to enable audio";
		alsa-monitor = mkOpt attrs { }
			"Alsa configuration.";
		nodes = mkOpt (listOf attrs) [ ]
			"Audio nodes to pass to Pipewire as `context.objects`.";
		modules = mkOpt (listOf attrs) [ ];
		extra-packages = mkOpt (listOf package) [
			pkgs.qjackctl
			pkgs.easyeffects
		] "Additional packages to install.";

		bluetooth = mkBoolOpt false "Wheter or not to enable bluetooth";
	};

	config = mkIf cfg.enable {
		settings.user.extraGroups = [ "audio" ];

		services.pipewire = {
			enable = true;
			alsa.enable = true;
			pulse.enable = true;
			jack.enable = true;
		};

		hardware.bluetooth = mkIf cfg.bluetooth {
			enable = true;
			settings.General.Enable =
				"Source,Sink,Media,Socket";
		};

		services.blueman.enable = mkIf cfg.bluetooth true;
		hardware.pulseaudio.enable = mkForce false;

		environment.systemPackages = with pkgs; [
			pulsemixer
			pavucontrol
		] ++ cfg.extra-packages;
	};

}
