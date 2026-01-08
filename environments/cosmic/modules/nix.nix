{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  nix = lib.mkIf cfg.enable {
  };
}
