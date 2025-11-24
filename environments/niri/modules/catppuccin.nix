{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
in
{
  catppuccin = lib.mkIf cfg.enable {
    enable = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };
  };
}
