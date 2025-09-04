{
  lib,
  config,
  ...
}:
let
  cfg = config.de.hyprland;
in
{
  options.desktop-environment.hyprland.enable = lib.mkEnableOption "Hyprland desktop environment suite";

  config = lib.mkIf cfg.enable {
    imports = [
      ./home-manager
      ./modules
    ];
  };
}
