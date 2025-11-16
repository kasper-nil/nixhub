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
      # Define all environment metadata files
      environmentMeta = {
        hyprland = (import ./environments/hyprland/meta inputs);
        niri = (import ./environments/niri/meta inputs);
      };

      testModules = import ./lib/test-modules.nix;

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
          _module.args = envMeta.homeModules._module.args; # Use specific args from meta file
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
            testModules.nixosModule
            module
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
        # Nixos module test
        builtins.listToAttrs (
          builtins.map (envName: {
            name = "${envName}-nixos-module";
            value = mkNixosModuleTest {
              inherit lib system;
              module = nixosModules.${envName};
            };
          }) (builtins.attrNames environmentMeta)
        )
        # Home module test
        // builtins.listToAttrs (
          builtins.map (envName: {
            name = "${envName}-home-module";
            value = mkHomeModuleTest {
              inherit pkgs;
              module = homeModules.${envName};
            };
          }) (builtins.attrNames environmentMeta)
        );
    };
}
