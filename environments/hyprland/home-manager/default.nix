{ lib, config, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  imports = [
    ../config/home-manager
  ]
  ++ lib.optionals cfg.enable [
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];
}
