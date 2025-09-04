{
  lib,
  config,
  ...
}:
let
  cfg = config.desktop-environment.hyprland;
in
{
  options.desktop-environment.hyprland.enable = lib.mkEnableOption "Hyprland desktop environment suite";

  imports = lib.optionals cfg.enable [
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
