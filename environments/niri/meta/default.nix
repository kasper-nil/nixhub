{
  catppuccin,
  nixcord,
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

    moduleArgs = {
    };
  };
}
