{
  catppuccin,
  nixcord,
  spicetify-nix,
  ...
}:
{
  description = "Hyprland desktop environment configuration.";

  nixos = {
    imports = [
      ../config/modules
      ../modules

      catppuccin.nixosModules.catppuccin
    ];
  };

  homeManager = {
    imports = [
      ../config/home-manager
      ../home-manager

      # Specific arguments or common modules if needed
      catppuccin.homeModules.catppuccin
      # spicetify-nix.homeManagerModules.default # Still commented out as per your original
      nixcord.homeModules.nixcord
    ];
  };

  # Arguments to pass specifically to Hyprland's Home Manager module
  homeManagerModuleArgs = {
    # inherit spicetify-nix;
  };

  # Any other metadata or specific configs for hyprland
  extraHomeManagerModules = [ ]; # spicetify-nix for example
}
