{
  config,
  inputs,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nixcord.homeModules.nixcord
    inputs.spicetify-nix.homeManagerModules.default

    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs

  ];
}
