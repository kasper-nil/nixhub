{
  self,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
  #   wallpaper = self + "/assets/wallpaper.png";
  wallpaper = "${config.home.homeDirectory}/wallpaper.png";
in
{
  services = lib.mkIf cfg.enable {
    easyeffects = {
      enable = true;
    };

    hyprpaper = {
      enable = true;

      settings = {
        splash = false;
        ipc = true;

        preload = [
          "${wallpaper}"
        ];

        wallpaper = [
          ",${wallpaper},fill"
        ];
      };
    };
  };
}
