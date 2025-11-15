{ lib, config, ... }:
let
  cfg = config.nixhub.niri;
in
{
  imports = lib.optionals cfg.enabled [
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
