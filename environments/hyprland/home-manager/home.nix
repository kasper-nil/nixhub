{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
  catppuccinGtk = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "mocha";
  };
in
{
  home = lib.mkIf cfg.enable {
    packages = with pkgs; [
      hyprsunset
      hyprshot # or grimblast
      hyprpicker # for color picking
      grim
      slurp
      wl-clipboard
      libnotify
      swappy
      catppuccinGtk

      libsForQt5.qt5ct # palette/icon GUI for Qt5
      libsForQt5.qtstyleplugin-kvantum
      qt6Packages.qt6ct # palette/icon GUI for Qt6
      qt6Packages.qtstyleplugin-kvantum
    ];

    # sessionVariables = {
    #   GTK_THEME = "catppuccin-mocha-lavender-standard+default";
    # };

    # file.".themes/catppuccin-mocha-lavender-standard+default".source =
    #   "${pkgs.catppuccin-gtk}/share/themes/catppuccin-mocha-lavender-standard+default";

    pointerCursor = {
      gtk.enable = true; # GTK 3/4 + Flatpaks
      x11.enable = true; # XWayland / i3 / remote X
      hyprcursor = {
        enable = true; # sets HYPRCURSOR_THEME & writes Hyprland stanza
      };
    };
  };
}
