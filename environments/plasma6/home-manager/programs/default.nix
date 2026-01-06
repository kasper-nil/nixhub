{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  imports = [
    ./nixcord.nix
    ./spicetify.nix
    ./alacritty.nix
    ./yazi.nix
    ./plasma.nix
  ];

  programs = lib.mkIf cfg.enable {
    fastfetch.enable = true;
    btop.enable = true;
    htop.enable = true;
    lutris.enable = true;
    tmux.enable = true;
    ghostty.enable = true;
    yazi.enable = true;
    firefox.enable = true;
  };
}
