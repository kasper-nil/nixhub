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
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];
}
