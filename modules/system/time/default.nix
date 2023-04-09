{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.settings.system.time;
in
{
	options.settings.system.time = with types; {
		enable =
			mkBoolOpt false "Whether or not to configure timezone information.";

		# TODO: Add support for other timezones
		timeZone = mkOption {
			type = str;
			default = "UTC";
			description = "Timezone to use.";
		};
  };

  config = mkIf cfg.enable { time.timeZone = cfg.timeZone; };
  # config = mkIf cfg.enable { time.timeZone = "America/Sao_Paulo"; };
}

