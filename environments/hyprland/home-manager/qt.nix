{ config, lib, ... }:
let
  cfg = config.nilhub.hyprland;
in
{
  qt = lib.mkIf cfg.enable {
    enable = true;
    style.name = "kvantum";
  };
}
