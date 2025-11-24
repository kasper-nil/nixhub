{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    # cache = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };

    grub = {
      enable = true;
    };
  };
}
