{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  systemd = lib.mkIf cfg.enable {
    # user.targets."hyprland-session" = {
    #   description = "Hyprland Session Target";
    #   requires = [ "graphical-session.target" ];
    #   after = [ "graphical-session.target" ];
    # };
  };
}
