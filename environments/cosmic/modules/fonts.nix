{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  fonts = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
