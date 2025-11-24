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

    flavor = "mocha";
    accent = "lavender";

    cursors = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    kvantum = {
      enable = true;
    };
  };
}
