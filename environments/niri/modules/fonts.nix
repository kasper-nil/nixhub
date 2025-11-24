{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
in
{
  fonts = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
