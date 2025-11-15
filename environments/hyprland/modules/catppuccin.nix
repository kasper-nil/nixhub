{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  catppuccin = {
    enable = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };
  };
}
