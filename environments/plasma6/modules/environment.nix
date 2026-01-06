{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.plasma6;
in
{
  environment = lib.mkIf cfg.enable {
    systemPackages = with pkgs; [
      openvpn
      qbittorrent
      vlc
      libreoffice
      gearlever
      bottles
      firefox
      brave
    ];

    plasma6 = {
      excludePackages = with pkgs; [
        kdePackages.konsole
      ];
    };
  };
}
