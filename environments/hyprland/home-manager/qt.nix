{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  qt = lib.mkIf cfg.enable {
    enable = true;
    style.name = "kvantum";
  };
}
