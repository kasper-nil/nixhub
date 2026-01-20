{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  services = lib.mkIf cfg.enable {
    easyeffects = {
      enable = true;
    };

    # hyprpaper = {
    #   enable = true;
    #   settings = {
    #     ipc = "on";
    #     splash = false;
    #     preload = [
    #       "/etc/nixos/assets/wallpaper.png"
    #     ];

    #     wallpaper = [
    #       ", /etc/nixos/assets/wallpaper.png"
    #     ];
    #   };
    # };

    # hypridle = {
    #   enable = false;
    # };

    # hyprsunset = {
    #   enable = true;
    # };
  };
}
