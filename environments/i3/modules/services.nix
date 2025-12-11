{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.i3;
in
{
  services = lib.mkIf cfg.enable {
    displayManager = {
      enable = true;

      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
      };

      defaultSession = "none+i3";
    };

    xserver = {
      enable = true;
      windowManager.i3.enable = true;
    };
  };
}
