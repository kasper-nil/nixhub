{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
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

    brave.enable = true;

    cursors.enable = true;

    zsh-syntax-highlighting.enable = true;

    vesktop.enable = true;

    mangohud.enable = true;

    spotify-player.enable = true;

    starship.enable = true;

    btop.enable = true;

    ghostty.enable = true;

    yazi.enable = true;
  };
}
