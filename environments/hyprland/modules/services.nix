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
        # TODO: Get the user name instead of hardcoding
        # configHome = "/home/kasper";
        quickshell.package = nilhubInputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
      };

      #   sddm = {
      #     enable = true;
      #     package = pkgs.kdePackages.sddm;
      #     wayland.enable = true;
      #   };
    };

    blueman = {
      enable = true;
    };
  };
}
