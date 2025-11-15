{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
in
{
  fonts = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
