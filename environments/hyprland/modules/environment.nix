{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  environment = lib.mkIf cfg.enable {

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
