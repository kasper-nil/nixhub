{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    grub = {
      enable = true;
    };
  };
}
