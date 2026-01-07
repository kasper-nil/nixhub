{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  environment = lib.mkIf cfg.enable {
  };
}
