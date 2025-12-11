{ config, lib, ... }:
let
  cfg = config.nilhub.i3;
in
{
  programs = lib.mkIf cfg.enable {
    thunar.enable = true;
    dconf.enable = true;
  };
}
