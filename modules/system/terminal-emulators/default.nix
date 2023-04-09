{ config, pkgs, ...}:
let cfg = config.settings.system.terminal-emulators; in
{
	options.settings.system.terminal-emulators = with types; {
		enabled = mkBoolOpt true
			"Whether or not to enable the terminal emulator module";";
		}
## shell = fish, zsh, ... ?

	};
}
