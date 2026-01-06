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

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      hyprcursor = {
        enable = true;
      };
    };
  };
}
