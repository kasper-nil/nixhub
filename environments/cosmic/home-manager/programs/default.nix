{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  imports = [
    ./nixcord.nix
    ./spicetify.nix
    ./alacritty.nix
    ./yazi.nix
    ./btop.nix
  ];

  programs = lib.mkIf cfg.enable {
    firefox.enable = true;
  };
}
