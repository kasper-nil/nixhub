{
  pkgs,
  config,
  lib,
  nilhubInputs,
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
        configHome = "/home/kasper";
        # quickshell.package = nilhubInputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
      };
    };

    blueman = {
      enable = true;
    };
  };
}
