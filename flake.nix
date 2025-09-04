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
      nixosModules.hyprland =
        {
          ...
        }@args:
        import (self + /environments/hyprland/modules/default.nix) (args // { inherit catppuccin; });

      homeModules.hyprland =
        {
          ...
        }@args:
        import (self + /environments/hyprland/home-manager/default.nix) (
          args // { inherit catppuccin spicetify-nix; }
        );
    };
}
