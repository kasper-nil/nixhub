{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  imports = [
    ./hyprpanel.nix
    ./nixcord.nix
    ./rofi.nix
    ./spicetify.nix
    ./alacritty.nix
    ./firefox.nix
  ];

  programs = lib.mkIf cfg.enable {
    hyprlock.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    htop.enable = true;
    lutris.enable = true;
    tmux.enable = true;
    ghostty.enable = true;
    yazi.enable = true;
  };
}
