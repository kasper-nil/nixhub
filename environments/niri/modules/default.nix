{ lib, config, ... }:
let
  cfg = config.nixhub.niri;
in
{
  imports = [
    ../config/modules
  ]
  ++ lib.optionals cfg.enable [
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
