{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.koi.tools.comma;
in
{
  options.koi.tools.comma = with types; {
    enable = mkBoolOpt false "Whether or not to enable comma.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      comma
      koi.nix-update-index
    ];

    koi.home.extraOptions = { programs.nix-index.enable = true; };
  };
}
