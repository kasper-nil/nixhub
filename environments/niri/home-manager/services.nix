{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
in
{
  services = lib.mkIf cfg.enable {
    mako = {
      enable = true;
    };

    swayidle = {
      enable = true;
    };

    polkit-gnome = {
      enable = true;
    };
  };
}
