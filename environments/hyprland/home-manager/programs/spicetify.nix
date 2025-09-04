{
  pkgs,
  spicetify-nix,
  ...
}:
{
  imports = [ spicetify-nix.homeManagerModules.spicetify ];

  programs.spicetify = {
    enable = true;
    theme = spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
  };
}
