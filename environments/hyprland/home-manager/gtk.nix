{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  gtk = lib.mkIf cfg.enable {
    enable = true;
  };
}
