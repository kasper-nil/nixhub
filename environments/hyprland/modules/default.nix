{
  lib,
  config,
  catppuccin,
  ...
}:
let
  cfg = config.desktop-environment.hyprland;
in
{
  imports = lib.optionals cfg.enable [
    catppuccin.nixosModules.catppuccin
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
