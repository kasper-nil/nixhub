{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  xdg = lib.mkIf cfg.enable {
    configFile."niri/config.kdl".source = ../dotfiles/niri/config.kdl;
  };
}
