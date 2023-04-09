{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.settings.system.file-manager;
in
{
	options.settings.system.file-manager = with types; {
		enable = mkBoolOpt false "Whether or not to manage fonts.";
		thunar = mkBoolOpt false "Whether or not to load thunar.";
	};

	config = mkIf cfg.enable {
		programs.thunar = mkIf cfg.thunar  {
			plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
			enable = true;
		};
	};
}

