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
      self,
      nixpkgs,
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
              (import ./environments/hyprland/config/modules)
              (import ./environments/hyprland/modules)
            ];
          };

        niri =
          { ... }:
          {
            imports = [
              catppuccin.nixosModules.catppuccin
              (import ./environments/niri/config/modules)
              (import ./environments/niri/modules)
            ];
          };
      };

      homeModules = {
        hyprland =
          { ... }:
          {
            _module.args = {
              inherit spicetify-nix;
            };
            imports = [
              catppuccin.homeModules.catppuccin
              # spicetify-nix.homeManagerModules.default
              nixcord.homeModules.nixcord
              (import ./environments/hyprland/config/home-manager)
              (import ./environments/hyprland/home-manager)
            ];
          };

        niri =
          { ... }:
          {
            _module.args = {
              inherit spicetify-nix;
            };
            imports = [
              catppuccin.homeModules.catppuccin
              spicetify-nix.homeManagerModules.default
              nixcord.homeModules.nixcord
              (import ./environments/niri/config/home-manager)
              (import ./environments/niri/home-manager)
            ];
          };
      };
      checks.x86_64-linux =
        let
          system = "x86_64-linux";
          lib = nixpkgs.lib;
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          # Validate NixOS hyprland module (use the toplevel derivation)
          hyprlandModule =
            (lib.nixosSystem {
              inherit system;
              modules = [
                self.nixosModules.hyprland
                { users.users.test.isNormalUser = true; }
              ];
            }).config.system.build.toplevel;

          # Validate NixOS niri module
          niriModule =
            (lib.nixosSystem {
              inherit system;
              modules = [
                self.nixosModules.niri
                { users.users.test.isNormalUser = true; }
              ];
            }).config.system.build.toplevel;

          # Validate Home-Manager hyprland module (use the activation derivation)
          hyprlandHome =
            (lib.homeManagerConfiguration {
              pkgs = pkgs;
              modules = [
                self.homeModules.hyprland
                {
                  home.username = "test";
                  home.homeDirectory = "/home/test";
                }
              ];
            }).activationPackage;

          # Validate Home-Manager niri module
          niriHome =
            (lib.homeManagerConfiguration {
              pkgs = pkgs;
              modules = [
                self.homeModules.niri
                {
                  home.username = "test";
                  home.homeDirectory = "/home/test";
                }
              ];
            }).activationPackage;
        };
    };
}
