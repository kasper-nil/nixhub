{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    sddm = {
      enable = false;
    };

    grub = {
      enable = true;
    };
  };
}
