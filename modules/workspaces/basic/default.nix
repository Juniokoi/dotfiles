{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;

let
cfg = config.settings.workspaces.basic;
in

{
	options.settings.workspaces.basic = with types; {
		enable = mkBoolOpt false
			"Whether or not to enable the basic workspaces module.";
	};

	config = mkIf cfg.enable {
		settings  = {
			loads = {};
			tools = {};
		};
	};
}

