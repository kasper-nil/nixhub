{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  imports = [
    ./gtk-4.0.nix
    ./DankMaterialShell.nix
  ];

  xdg = lib.mkIf cfg.enable {
  };
}
