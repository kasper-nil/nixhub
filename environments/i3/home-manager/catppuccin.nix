{ config, lib, ... }:
let
  cfg = config.nilhub.i3;
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

    firefox = {
      enable = true;
      force = true;
    };

    zsh-syntax-highlighting.enable = true;

    cursors.enable = true;

    vesktop.enable = true;

    mangohud.enable = true;

    spotify-player.enable = true;

    starship.enable = true;

    btop.enable = true;

    ghostty.enable = true;

    yazi.enable = true;
  };
}
