{ config, lib, ... }:
let
  cfg = config.nilhub.i3;
in
{
  services = lib.mkIf cfg.enable {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
    };

    displayManager.defaultSession = "none+i3";
  };
}
