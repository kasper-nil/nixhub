{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  programs.spicetify = lib.mkIf cfg.enable {
    enable = true;
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
  };
}
