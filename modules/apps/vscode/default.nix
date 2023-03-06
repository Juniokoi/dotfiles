{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let cfg = config.koi.apps.vscode;
in
{
  options.koi.apps.vscode = with types; {
    enable = mkBoolOpt false "Whether or not to enable vscode.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ vscode ]; };
}
