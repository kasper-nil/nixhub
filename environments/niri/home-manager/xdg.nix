{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
in
{
  xdg = lib.mkIf cfg.enable {
    configFile."niri/config.kdl".source = ../dotfiles/niri/config.kdl;
  };
}
