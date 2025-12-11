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
      i3lock
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
