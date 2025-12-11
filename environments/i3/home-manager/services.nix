{ config, lib, ... }:
let
  cfg = config.nilhub.i3;
in
{
  services = lib.mkIf cfg.enable {
  };
}
