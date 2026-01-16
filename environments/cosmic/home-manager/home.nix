{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
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
      fastfetch
      lutris
      tmux
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
