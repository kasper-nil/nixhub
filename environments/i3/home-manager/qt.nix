{ config, lib, ... }:
let
  cfg = config.nilhub.i3;
in
{
  qt = lib.mkIf cfg.enable {
    enable = true;
    style.name = "kvantum";
  };
}
