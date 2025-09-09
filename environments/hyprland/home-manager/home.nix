{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hyprsunset
      hyprshot # or grimblast
      hyprpicker # for color picking
      grim
      slurp
      wl-clipboard
      libnotify
      swappy

      libsForQt5.qt5ct # palette/icon GUI for Qt5
      libsForQt5.qtstyleplugin-kvantum
      qt6ct # palette/icon GUI for Qt6
      qt6Packages.qtstyleplugin-kvantum
    ];

    pointerCursor = {
      gtk.enable = true; # GTK 3/4 + Flatpaks
      x11.enable = true; # XWayland / i3 / remote X
      hyprcursor = {
        enable = true; # sets HYPRCURSOR_THEME & writes Hyprland stanza
      };
    };
  };
}
