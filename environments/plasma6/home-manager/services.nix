{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  services = lib.mkIf cfg.enable {
  };
}
