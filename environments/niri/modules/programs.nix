{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
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
