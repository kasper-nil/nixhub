{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
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
