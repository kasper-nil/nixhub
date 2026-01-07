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
  ];

  programs = lib.mkIf cfg.enable {
    btop.enable = true;
    firefox.enable = true;
  };
}
