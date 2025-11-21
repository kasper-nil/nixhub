{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    flavor = "macchiato";
    accent = "maroon";

    kvantum = {
      enable = true;
      apply = true;
    };

    gtk = {
      icon = {
        enable = true;
      };
    };

    firefox = {
      enable = true;
      force = true;
    };

    cursors.enable = true;

    hyprland.enable = true;

    hyprlock.enable = true;

    vesktop.enable = true;

    mangohud.enable = true;

    spotify-player.enable = true;

    starship.enable = true;

    btop.enable = true;

    ghostty.enable = true;

    yazi.enable = true;
  };
}
