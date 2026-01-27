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
      gnome-text-editor
      networkmanagerapplet
    ];

    pointerCursor = {
      enable = true;
      size = 46;

      hyprcursor = {
        enable = false;
        size = 46;
      };

      gtk.enable = true;
      x11.enable = true;
    };
  };
}
