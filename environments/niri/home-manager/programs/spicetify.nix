{
  pkgs,
  spicetify-nix,
  ...
}:
{
  programs.spicetify = {
    enable = true;
    theme = spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
  };
}
