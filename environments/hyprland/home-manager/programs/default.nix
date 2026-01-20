{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  imports = [
    # ./hyprpanel.nix
    ./nixcord.nix
    ./rofi.nix
    ./spicetify.nix
    ./alacritty.nix
    ./yazi.nix
    # ./dms-shell.nix
  ];

  programs = lib.mkIf cfg.enable {
    fastfetch.enable = true;
    btop.enable = true;
    lutris.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    firefox.enable = true;
    brave.enable = true;
    hyprlock.enable = true;
    hyprshot.enable = true;
  };
}
