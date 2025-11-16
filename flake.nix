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
    { nixpkgs, home-manager, ... }@inputs:
    let
      testModules = import ./lib/test-modules.nix;

      nixhubModules = import ./main.nix;

      # Helper function for creating test derivations
      mkNixosModuleTest =
        {
          lib,
          system,
          module,
        }:
        (lib.nixosSystem {
          inherit system;
          modules = [
            testModules.nixosModule
            module # This is your nixhubModules
            {
              _module.args = { inherit inputs; };
              nixhub.hyprland.enable = true;
            }
          ];
        }).config.system.build.toplevel;

      mkHomeModuleTest =
        {
          pkgs,
          module,
        }:
        (home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [
            testModules.homeModule
            module
            {
              home.extraSpecialArgs = { inherit inputs; };
              nixhub.hyprland.enable = true;
            }
          ];
        }).activationPackage;
    in
    {
      nixosModules.default = nixhubModules;
      homeModules.default = nixhubModules;

      # The checks now test your combined `nixhubMainModule`
      # checks.x86_64-linux =
      #   let
      #     system = "x86_64-linux";
      #     lib = nixpkgs.lib;
      #     pkgs = nixpkgs.legacyPackages.${system};
      #     hmLib = home-manager.lib;
      #   in
      #   {
      #     nixhub-nixos-module-check = mkNixosModuleTest {
      #       inherit lib system;
      #       module = nixhubModules;
      #     };
      #     nixhub-home-module-check = mkHomeModuleTest {
      #       inherit lib pkgs hmLib;
      #       module = nixhubModules;
      #     };
      #   };
    };
}
