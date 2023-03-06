{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
cfg = config.koi.suites.games;
apps = {
	steam = enabled;
	prismlauncher = enabled;
	lutris = enabled;
	winetricks = enabled;
	protontricks = enabled;
	doukutsu-rs = enabled;
	bottles = enabled;
	yuzu = enabled;
	pcsx2 = enabled;
	dolphin = enabled;
};
cli-apps = {
	wine = enabled;
	proton = enabled;
};
in
{
	options.koi.suites.games = with types; {
		enable =
			mkBoolOpt false "Whether or not to enable common games configuration.";
	};

  config = mkIf cfg.enable { koi = { inherit apps cli-apps; }; };
}
