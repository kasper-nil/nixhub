{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.i3;
in
{
  home = lib.mkIf cfg.enable {
    packages = with pkgs; [
      openvpn
      qbittorrent
      pavucontrol
      xarchiver
      vlc
      libreoffice
      gearlever
      dmenu
      i3status
      i3lock
      i3blocks
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
