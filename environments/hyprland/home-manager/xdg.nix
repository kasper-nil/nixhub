{
  pkgs,
  lib,
  config,
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

  catppuccinName = "catppuccin-mocha-lavender-standard+default";
in
{
  # Explicit GTK4 config, bypassing HM’s generated hm_gtk4.0gtk.css
  xdg.configFile = lib.mkIf cfg.enable {
    "gtk-4.0/gtk.css".text = ''
      @import url("file://${catppuccinGtk}/share/themes/${catppuccinName}/gtk-4.0/gtk.css");
    '';

    "gtk-4.0/gtk-dark.css".text = ''
      @import url("file://${catppuccinGtk}/share/themes/${catppuccinName}/gtk-4.0/gtk-dark.css");
    '';

    "gtk-4.0/assets" = {
      recursive = true;
      source = "${catppuccinGtk}/share/themes/${catppuccinName}/gtk-4.0/assets";
    };
  };
}
