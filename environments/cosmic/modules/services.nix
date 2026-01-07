{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  services = lib.mkIf cfg.enable {
    desktopManager = {
      cosmic.enable = true;
    };

    displayManager = {
      cosmic-greeter.enable = true;
    };

    system76-scheduler.enable = true;
  };
}
