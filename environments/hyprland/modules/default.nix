{ lib, config, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  imports = lib.optionals cfg.enabled [
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
