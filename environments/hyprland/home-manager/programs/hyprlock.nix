{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  programs.hyprlock = lib.mkIf cfg.enable {
    enable = true;
  };
}
