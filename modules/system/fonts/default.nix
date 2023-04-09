{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.settings.system.fonts;
in
{
	options.settings.system.fonts = with types; {
		enable = mkBoolOpt false "Whether or not to manage fonts.";
		enableNerdFonts = mkBoolOpt true "Whether or not to install nerd fonts.";

		fonts = mkOption {
			type = (listOf str);
			default = [
				noto-fonts
				noto-fonts-cjk-sans
				noto-fonts-cjk-serif
				noto-fonts-emoji
			];
			description = "Custom font packages to install.";
		};
		nerdfonts = mkOption {
			type = (listOf str);
			default = mkIf cfg.enableNerdFonts [
				"Hack"
				"Iosevka"
				"FiraCode"
				"NerdFontsSymbolsOnly"
			];
			description = "Add nerdfonts.";
		};
	};

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    environment.systemPackages = with pkgs; [ font-manager ];

    fonts.fonts = with pkgs;
      [
        (nerdfonts.override {
			fonts = [ ] ++ cfg.nerdfonts ;
		})
      ] ++ cfg.fonts;
  };
}

