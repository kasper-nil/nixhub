{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  services = lib.mkIf cfg.enable {
    easyeffects = {
      enable = true;
    };
  };
}
