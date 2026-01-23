{
  self,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
  wallpaper = self + "/assets/wallpaper.png";
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
    #     preload = [ "${wallpaper}" ];
    #     wallpaper = [ ",${wallpaper}" ];
    #   };
    # };
  };
}
