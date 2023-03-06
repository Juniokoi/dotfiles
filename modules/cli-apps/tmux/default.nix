{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
cfg = config.koi.cli-apps.tmux;
configFiles = lib.snowfall.fs.get-files ./config;
#TODO: Move tmux settings to here
in {
	options.koi.cli-apps.tmux = with types; {
		enable = mkBoolOpt false "Whether or not to enable tmux.";
	};
	config = mkIf cfg.enable {
		koi.home.extraOptions = {
		programs.tmux = {
		enable = true;
		terminal = "xterm-256color";
		clock24 = true;
		historyLimit = 2000;
		keyMode = "vi";
		newSession = true;
		extraConfig = builtins.concatStringsSep "\n"
		(builtins.map lib.strings.fileContents configFiles);
      };
    };
  };
}
