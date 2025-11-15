{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
in
{
  gtk = lib.mkIf cfg.enable {
    enable = true;
  };
}
