{
  catppuccin,
  nixcord,
  spicetify-nix,
  ...
}:
{
  description = "Hyprland desktop environment configuration.";

  nixosModules = {
    imports = [
      ../config/modules
      ../modules

      catppuccin.nixosModules.catppuccin
    ];
  };

  homeModules = {
    imports = [
      ../config/home-manager.nix
      ../home-manager

      catppuccin.homeModules.catppuccin
      nixcord.homeModules.nixcord
      spicetify-nix.homeManagerModules.default
    ];

    _module.args = {
      inherit spicetify-nix;
    };
  };
}
