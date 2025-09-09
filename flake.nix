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
              (import ./environments/hyprland/modules)
            ];
          };
      };

      homeModules = {
        hyprland =
          { ... }:
          {
            imports = [
              catppuccin.homeModules.catppuccin
              spicetify-nix.homeManagerModules.default
              nixcord.homeModules.nixcord
              (import ./environments/hyprland/home-manager)
            ];

            _module.args = {
              inherit spicetify-nix;
              inherit catppuccin;
            };
          };
      };
    };
}
