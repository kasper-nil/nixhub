{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  programs = lib.mkIf cfg.enable {
    firefox.preferences = {
      # disable libadwaita theming for Firefox
      "widget.gtk.libadwaita-colors.enabled" = false;
    };
  };
}
