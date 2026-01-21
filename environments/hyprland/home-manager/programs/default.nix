{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  imports = [
    ./spicetify.nix
    ./alacritty.nix
    ./yazi.nix
    ./nixcord.nix
  ];

  programs = lib.mkIf cfg.enable {
    fastfetch.enable = true;
    btop.enable = true;
    lutris.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    firefox.enable = true;
    brave.enable = true;
  };
}
