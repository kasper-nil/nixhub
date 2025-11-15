{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  programs = lib.mkIf cfg.enable {
    thunar = {
      enable = true;
    };

    niri = {
      enable = true;
    };
  };
}
