{
  catppuccin,
  nixcord,
  spicetify-nix,
  ...
}:
{
  description = "Niri desktop environment configuration.";

  nixosModules = {
    imports = [
      ../config/modules
      ../modules

      catppuccin.nixosModules.catppuccin
    ];
  };

  homeModules = {
    imports = [
      ../config/home-manager
      ../home-manager

      catppuccin.homeModules.catppuccin
      nixcord.homeModules.nixcord
    ];

    _module.args = {
      inherit spicetify-nix;
    };
  };
}
