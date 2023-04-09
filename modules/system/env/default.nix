{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.settings.system.env;
in
{
  options.settings.system.env = with types;
    mkOption {
      type = attrsOf (oneOf [ str path (listOf (either str path)) ]);
      apply = mapAttrs (n: v:
        if isList v then
          concatMapStringsSep ":" (x: toString x) v
        else
          (toString v));
      default = {
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_BIN_HOME = "$HOME/.local/bin";
        # To prevent firefox from creating ~/Desktop.
        XDG_DESKTOP_DIR = "$HOME";
        LESSHISTFILE = "$XDG_CACHE_HOME/less.history";
        WGETRC = "$XDG_CONFIG_HOME/wgetrc";
	  };
      description = "A set of environment variables to set.";
    };

	config = {
		environment = {
			pathsToLink = [ "/libexec" ];
			extraInit = concatStringsSep "\n"
				(mapAttrsToList (n: v: ''export ${n}="${v}"'') cfg);
		};
	};
}
