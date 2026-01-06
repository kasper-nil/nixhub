{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.plasma6;
in
{
  fonts = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
