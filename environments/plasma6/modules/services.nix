{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.plasma6;
in
{
  services = lib.mkIf cfg.enable {
    desktopManager = {
      plasma6.enable = true;
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
