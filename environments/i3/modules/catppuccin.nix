{ config, lib, ... }:
let
  cfg = config.nilhub.i3;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };

    grub = {
      enable = true;
    };
  };
}
