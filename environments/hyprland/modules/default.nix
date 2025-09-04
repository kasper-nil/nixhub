{
  lib,
  config,
  ...
}:
let
  cfg = config.desktop-environment.hyprland;
in
{
  options.desktop-environment.hyprland.enable = lib.mkEnableOption "Hyprland desktop environment suite";

  config = lib.mkIf cfg.enable {
    imports = [
      ./catppuccin.nix
      ./fonts.nix
      ./programs.nix
      ./services.nix
    ];
  };
}
