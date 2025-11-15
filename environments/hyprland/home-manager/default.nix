{ lib, config, ... }:
let
  cfg = config.nixhub.hyprland;
in
{

  imports = lib.optionals cfg.enabled [
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];
}
