{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
in
{
  gtk = lib.mkIf cfg.enable {
    enable = true;
  };
}
