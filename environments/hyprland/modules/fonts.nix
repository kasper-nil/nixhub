{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  fonts = lib.mkIf cfg.enable {
    # fontconfig.enable = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
