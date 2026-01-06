{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  environment = lib.mkIf cfg.enable {
    systemPackages = with pkgs; [

    ];
  };
}
