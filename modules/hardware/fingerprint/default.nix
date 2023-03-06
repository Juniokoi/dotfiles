{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.koi.hardware.fingerprint;
in
{
  options.koi.hardware.fingerprint = with types; {
    enable = mkBoolOpt false "Whether or not to enable fingerprint support.";
  };

  config = mkIf cfg.enable { services.fprintd.enable = true; };
}
