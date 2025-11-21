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
  catppuccinName = "catppuccin-mocha-lavender-standard+default";
in
{
  gtk = lib.mkIf cfg.enable {
    enable = true;
    theme = {
      name = catppuccinName;
      package = catppuccinGtk;
    };
  };
}
