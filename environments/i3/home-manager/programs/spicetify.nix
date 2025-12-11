{
  nilhubInputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.nilhub.i3;
  spicePkgs = nilhubInputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = lib.mkIf cfg.enable {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
