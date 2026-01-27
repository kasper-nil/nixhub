{
  self,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  systemd = lib.mkIf cfg.enable {
    user.services = {
    };
  };
}
