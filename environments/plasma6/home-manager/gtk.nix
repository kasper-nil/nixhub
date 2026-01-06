{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.plasma6;
in
{
  gtk = lib.mkIf cfg.enable {
    # enable = true;
  };
}
