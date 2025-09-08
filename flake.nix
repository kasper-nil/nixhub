{
  description = "Desktop Environment suites as NixOS/Home-Manager modules";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };
  };
  outputs =
    {
      catppuccin,
      spicetify-nix,
      nixcord,
      ...
    }:
    {
      nixosModules = {
        hyprland =
          { ... }:
          {
            imports = [
              catppuccin.nixosModules.catppuccin
              nixcord.nixosModules.nixcord
              (import ./environments/hyprland/modules) # no args
            ];
          };
      };

      homeModules = {
        hyprland =
          { ... }:
          {
            imports = [
              # Catppuccin renamed this to `homeModules` (compat layer warns if you use the old name).
              catppuccin.homeModules.catppuccin
              spicetify-nix.homeModules.spicetify
              (import ./environments/hyprland/home-manager) # no args
            ];
          };
      };
    };
}
