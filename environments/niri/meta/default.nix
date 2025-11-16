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

      # Specific arguments or common modules if needed
      catppuccin.homeModules.catppuccin
      # spicetify-nix.homeManagerModules.default # Still commented out as per your original
      nixcord.homeModules.nixcord
    ];
  };

  # Arguments to pass specifically to Hyprland's Home Manager module
  homeModuleArgs = {
    # inherit spicetify-nix;
  };
}
