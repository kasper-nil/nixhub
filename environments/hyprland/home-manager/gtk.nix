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
      name = "catppuccin-macchiato-maroon-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "maroon" ];
        variant = "macchiato";
      };
    };
  };
}
