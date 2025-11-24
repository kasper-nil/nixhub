{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
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
