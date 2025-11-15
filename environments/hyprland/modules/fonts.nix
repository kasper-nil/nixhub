{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
