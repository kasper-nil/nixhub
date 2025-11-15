{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  fonts = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
