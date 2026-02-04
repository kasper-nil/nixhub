{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  imports = [
    ./gtk-4.0.nix
    ./DankMaterialShell.nix
  ];

  xdg = lib.mkIf cfg.enable {
    portal = {
      enable = true;

      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
