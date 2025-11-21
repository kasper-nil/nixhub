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
  gtk = lib.mkIf cfg.enable {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
  };
}
