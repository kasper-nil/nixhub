{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
in
{
  services = lib.mkIf cfg.enable {
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };
  };
}
