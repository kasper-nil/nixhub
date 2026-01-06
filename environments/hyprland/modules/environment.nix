{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.hyprland;
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
      xarchiver
      flameshot
      pavucontrol
      hyprlock
      hyprsunset
      hyprshot # or grimblast
      hyprpicker # for color picking
      grim
      slurp
      wl-clipboard
      libnotify
      swappy
    ];
  };
}
