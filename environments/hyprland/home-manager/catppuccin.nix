{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    flavor = "mocha";
    accent = "lavender";

    cursors = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    firefox = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
      force = true;
    };

    hyprland = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    hyprlock = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    vesktop = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    mangohud = {
      enable = true;
      flavor = "mocha";
    };

    spotify-player = {
      enable = true;
      flavor = "mocha";
    };

    starship = {
      enable = true;
      flavor = "mocha";
    };

    # gtk = {
    #   icon = {
    #     enable = true;
    #     accent = "lavender";
    #     flavor = "mocha";
    #   };
    # };

    kvantum = {
      enable = true;
    };
  };
}
