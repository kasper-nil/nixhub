{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
in
{
  home = lib.mkIf cfg.enable {
    packages = with pkgs; [
      libsForQt5.qt5ct # palette/icon GUI for Qt5
      libsForQt5.qtstyleplugin-kvantum
      qt6Packages.qt6ct # palette/icon GUI for Qt6
      qt6Packages.qtstyleplugin-kvantum
      swaybg
      gcr
      xwayland-satellite
    ];

    pointerCursor = {
      gtk.enable = true; # GTK 3/4 + Flatpaks
      x11.enable = true; # XWayland / i3 / remote X
    };
  };
}
