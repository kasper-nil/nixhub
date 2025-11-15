{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  programs = {
    hyprland = {
      enable = true;
    };

    thunar = {
      enable = true;
    };
  };
}
