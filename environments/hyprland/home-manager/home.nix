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
      hyprlock
      hyprsunset
      hyprshot # or grimblast
      hyprpicker # for color picking
      grim
      slurp
      wl-clipboard
      libnotify
      swappy
      openvpn
      qbittorrent
      pavucontrol
      xarchiver
      vlc
      libreoffice
      gearlever
      flameshot
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
