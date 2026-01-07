{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  qt = lib.mkIf cfg.enable {
    # enable = true;
    # style.name = "kvantum";
  };
}
