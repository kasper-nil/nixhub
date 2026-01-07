{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  services = lib.mkIf cfg.enable {
  };
}
