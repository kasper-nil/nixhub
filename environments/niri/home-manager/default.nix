{ lib, config, ... }:
let
  cfg = config.nixhub.niri;
in
{
  imports = lib.optionals cfg.enabled [
    ./programs
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./xdg.nix
  ];
}
