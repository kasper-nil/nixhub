{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.i3;
in
{
  fonts = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
