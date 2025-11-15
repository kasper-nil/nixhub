{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  imports = [
    ../config/modules
  ]
  ++ lib.optionals cfg.enable [
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
