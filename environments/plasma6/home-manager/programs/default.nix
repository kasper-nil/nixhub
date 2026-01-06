{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  imports = [
    ./nixcord.nix
    ./spicetify.nix
    ./alacritty.nix
    ./yazi.nix
    ./plasma.nix
  ];

  programs = lib.mkIf cfg.enable {
  };
}
