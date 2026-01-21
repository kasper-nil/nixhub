{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
  wallpaper = "${inputs.self}/assets/wallpaper.png";
in
{
  services = lib.mkIf cfg.enable {
    easyeffects = {
      enable = true;
    };

    hyprpaper = {
      enable = true;
      settings = {
        preload = [ wallpaper ];
        wallpaper = [ wallpaper ];
      };
    };
  };
}
