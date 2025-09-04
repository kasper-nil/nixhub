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
      catppuccin,
      ...
    }:
    {
      # NixOS modules your hosts can import
      nixosModules = {
        hyprland = import ./environments/hyprland/modules { inherit catppuccin; };
      };

      # Optional: Home-Manager modules you can add via sharedModules
      homeModules = {
        hyprland = import ./environments/hyprland/home-manager { inherit catppuccin; };
      };
    };
}
