{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    cache = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };

    grub = {
      enable = true;
      flavor = "mocha";
    };
  };
}
