{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    flavor = "mocha";
    accent = "lavender";

    kvantum = {
      enable = true;
      apply = true;
    };

    gtk = {
      icon = {
        enable = true;
      };
    };

    cursors = {
      enable = true;
    };

    firefox = {
      enable = true;
      force = true;
    };

    hyprland = {
      enable = true;
    };

    hyprlock = {
      enable = true;
    };

    vesktop = {
      enable = true;
    };

    mangohud = {
      enable = true;
    };

    spotify-player = {
      enable = true;
    };

    starship = {
      enable = true;
    };
  };
}
