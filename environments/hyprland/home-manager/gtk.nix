{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;

  catppuccinName = "Catppuccin-Mocha-Standard-Lavender-Dark";

  catppuccinPackage = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "mocha";
  };
in
{
  gtk = lib.mkIf cfg.enable {
    enable = true;
    theme = {
      name = catppuccinName;
      package = catppuccinPackage;
    };
  };
}
