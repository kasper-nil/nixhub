{ lib, config, ... }:
let
  cfg = config.nixhub.niri;
in
{
  imports = [
    ../config/home-manager
  ]
  ++ lib.optionals cfg.enable [
    ./programs
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./xdg.nix
  ];
}
