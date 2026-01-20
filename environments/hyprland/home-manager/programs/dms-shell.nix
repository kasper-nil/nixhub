{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  programs.dms-shell = lib.mkIf cfg.enable {
    enable = true;
  };
}
