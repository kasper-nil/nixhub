{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  home = lib.mkIf cfg.enable {
    packages = with pkgs; [
      openvpn
      qbittorrent
      vlc
      libreoffice
      gearlever
      bottles
      pavucontrol
      hyprpicker
      nautilus
      file-roller
      gnome-calendar
      networkmanagerapplet
    ];

    pointerCursor = {
      enable = true;
      hyprcursor.enable = true;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
