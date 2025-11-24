{
  pkgs,
  spicetify-nix,
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.niri;
in
{
  programs.spicetify = lib.mkIf cfg.enable {
    enable = true;
    theme = spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
  };
}
