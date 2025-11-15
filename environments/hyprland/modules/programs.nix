{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  programs = lib.mkIf cfg.enable {
    hyprland = {
      enable = true;
    };

    thunar = {
      enable = true;
    };
  };
}
