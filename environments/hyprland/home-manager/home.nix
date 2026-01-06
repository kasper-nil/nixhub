{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  home = lib.mkIf cfg.enable {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      hyprcursor = {
        enable = true;
      };
    };
  };
}
