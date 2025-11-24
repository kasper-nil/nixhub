{
  nilhubInputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
  spicePkgs = nilhubInputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = lib.mkIf cfg.enable {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
  };
}
