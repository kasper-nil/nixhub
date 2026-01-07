{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  gtk = lib.mkIf cfg.enable {
    # enable = true;
  };
}
