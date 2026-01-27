{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  imports = [
    ./hyprland.nix
    ./dms-shell.nix
  ];

  programs = lib.mkIf cfg.enable {
  };
}
