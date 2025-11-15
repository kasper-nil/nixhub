{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
in
{
  xdg = lib.mkIf cfg.enable {
    configFile."niri/config.kdl".source = ../dotfiles/niri/config.kdl;
  };
}
