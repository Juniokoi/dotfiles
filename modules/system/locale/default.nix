{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.settings.system.locale;
in
{
	options.settings.system.locale = with types; {
		enable = mkBoolOpt false "Whether or not to manage locale settings.";
		defaultLocale = mkOption {
			type = str;
			default = "en_US.UTF-8";
			description = "Set default locale formatting .";
		};
		extraLocale = mkOption {
			type = str;
			default = "en_US.UTF-8";
			description = "Set extra locale formatting.";
		};
	};

	config = mkIf cfg.enable {
		i18n.defaultLocale = cfg.defaultLocale;

		i18n.extraLocaleSettings = with cfg; {
			LC_NAME = cfg.extraLocale;
			LC_TIME = cfg.extraLocale;
			LC_PAPER = cfg.extraLocale;
			LC_NUMERIC = cfg.extraLocale;
			LC_ADDRESS = cfg.extraLocale;
			LC_MONETARY = cfg.extraLocale;
			LC_TELEPHONE = cfg.extraLocale;
			LC_MEASUREMENT = cfg.extraLocale;
			LC_IDENTIFICATION = cfg.extraLocale;
		};

		console = { keyMap = mkForce "us"; };
	};
}
