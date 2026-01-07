{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  programs = lib.mkIf cfg.enable {
  };
}
