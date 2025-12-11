{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.i3;
in
{
  security = lib.mkIf cfg.enable {
    pam.services.i3lock.enable = true;
  };
}
