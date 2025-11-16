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
  };
  outputs =
    { nixpkgs, ... }@inputs:
    let
      # Define all environment metadata files
      environmentMeta = {
        hyprland = (import ./environments/hyprland/meta inputs);
        niri = (import ./environments/niri/meta inputs);
      };

      testModule = import ./lib/testModule.nix;

      # Function to create NixOS modules dynamically from environmentMeta
      mkNixosModule =
        envName: envMeta:
        { ... }:
        {
          imports = envMeta.nixosModules.imports;
        };

      # Function to create Home Manager modules dynamically from environmentMeta
      mkHomeModule =
        envName: envMeta:
        { ... }:
        {
          _module.args = envMeta.homeModules.moduleArgs; # Use specific args from meta file
          imports = envMeta.homeModules.imports;
        };

      # Generate the nixosModules and homeModules attribute sets by iterating over environmentMeta
      nixosModules = builtins.mapAttrs mkNixosModule environmentMeta;
      homeModules = builtins.mapAttrs mkHomeModule environmentMeta;

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
            testModule.nixosTestModule
            module
          ];
        }).config.system.build.toplevel;

      mkHomeModuleTest =
        {
          lib,
          pkgs,
          module,
        }:
        (lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [
            testModule.homeManagerTestModule # Import the standardized test module here
            module
          ];
        }).activationPackage;
    in
    {
      inherit nixosModules homeModules;

      checks.x86_64-linux =
        let
          system = "x86_64-linux";
          lib = nixpkgs.lib;
          pkgs = nixpkgs.legacyPackages.${system};
        in
        builtins.listToAttrs (
          builtins.map (envName: {
            name = "${envName}-nixos-module";
            value = mkNixosModuleTest {
              inherit lib system;
              module = nixosModules.${envName};
            };
          }) (builtins.attrNames environmentMeta)
        )
        // builtins.listToAttrs (
          builtins.map (envName: {
            name = "${envName}-home-module";
            value = mkHomeModuleTest {
              inherit lib pkgs;
              module = homeModules.${envName};
            };
          }) (builtins.attrNames environmentMeta)
        );
    };
}
