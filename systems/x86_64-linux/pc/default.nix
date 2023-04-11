{config, pkgs, lib, channel, ... }:

with lib;
with lib.internal;
{
	imports = [ ./hardware.nix ];

	settings = {

		tools.utils.enable;
	}

}
