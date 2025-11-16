{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.nixhub.hyprland;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = lib.mkIf cfg.enable {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
