{ pkgs, config, ... }:
let
  catppuccinGtk = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "mocha";
  };

  catppuccinName = "catppuccin-mocha-lavender-standard+default";
in
{
  # Symlink gtk-4.0 assets from the theme package into ~/.config/gtk-4.0
  xdg.configFile = {
    "gtk-4.0/assets".source = "${catppuccinGtk}/share/themes/${catppuccinName}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${catppuccinGtk}/share/themes/${catppuccinName}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${catppuccinGtk}/share/themes/${catppuccinName}/gtk-4.0/gtk-dark.css";
  };
}
