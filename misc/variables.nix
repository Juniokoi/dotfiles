{ config, ... }:

let
	cfg = config.settings.variables;
	user = config.user.user.name
in

{
	options.dotnix = with types; {
		variables = mkOpts (listOf anything) [ ];
	};

	config.dotnix.variables = rec [
		{ home = ./home/ };

	] ++ cfg.variables;
}
