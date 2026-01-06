{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.plasma6;
in
{
  home = lib.mkIf cfg.enable {
    packages = with pkgs; [
      openvpn
      qbittorrent
      pavucontrol
      vlc
      libreoffice
      gearlever
    ];
  };
}
