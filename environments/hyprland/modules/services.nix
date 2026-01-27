{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  services = lib.mkIf cfg.enable {
    displayManager = {
      enable = true;

      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
