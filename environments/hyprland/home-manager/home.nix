{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
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
      #   libsForQt5.qt5ct
      #   libsForQt5.qtstyleplugin-kvantum
      #   qt6Packages.qt6ct
      #   qt6Packages.qtstyleplugin-kvantum
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
