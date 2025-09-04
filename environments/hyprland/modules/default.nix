{
  lib,
  config,
  ...
}:
let
  cfg = config.desktop-environment.hyprland;
in
{
  imports = lib.optionals cfg.enable [
    (./catppuccin.nix)
    (./fonts.nix)
    (./programs.nix)
    (./services.nix)
  ];
}
