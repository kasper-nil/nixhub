{
  config,
  lib,
  nilhubInputs,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  services = lib.mkIf cfg.enable {
    displayManager = {
      enable = true;

      dms-greeter = {
        enable = true;
        compositor.name = "hyprland";
        quickshell.package = nilhubInputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
      };
    };
  };
}
