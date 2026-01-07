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
      firefox
      brave
      fastfetch
      btop
      htop
      lutris
      tmux
      yazi
    ];
  };
}
