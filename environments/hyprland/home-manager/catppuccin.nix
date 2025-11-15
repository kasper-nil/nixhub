{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    flavor = "mocha";
    accent = "lavender";

    cursors = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    hyprland = {
      enable = true;
    };

    # gtk = {
    #   enable = true;
    #   gnomeShellTheme = true;
    #   icon.enable = true;
    # };

    kvantum = {
      enable = true;
    };
  };
}
