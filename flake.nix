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

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };
  };
  outputs =
    {
      self,
      catppuccin,
      spicetify-nix,
      ...
    }:
    {
      nixosModules = {
        hyprland =
          {
            ...
          }:
          import (self + /environments/hyprland/modules/default.nix) { inherit catppuccin; };

      };
      homeModules.hyprland =
        {
          ...
        }:
        import (self + /environments/hyprland/home-manager/default.nix) {
          inherit catppuccin spicetify-nix;
        };
    };
}
