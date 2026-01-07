{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  gtk = lib.mkIf cfg.enable {
    enable = true;
    theme = {
      name = "catppuccin-mocha-lavender-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        variant = "mocha";
      };
    };
  };
}
