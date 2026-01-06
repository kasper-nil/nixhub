{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  programs = lib.mkIf cfg.enable {
  };
}
