{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  qt = lib.mkIf cfg.enable {
    # enable = true;
    # style.name = "kvantum";
  };
}
