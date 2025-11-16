{
  description = "Desktop Environment suites as NixOS/Home-Manager modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";

    catppuccin.url = "github:catppuccin/nix";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      # Import our module collection logic
      nixhubModules = import ./main.nix;

      testModules = import ./lib/test-modules.nix;

      # Helper to create NixOS test
      mkNixosModuleTest =
        { lib, system }:
        (lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            testModules.nixosModule
            self.nixosModules.default
          ];
        }).config.system.build.toplevel;

      # Helper to create Home Manager test
      mkHomeModuleTest =
        { pkgs, homeLib }:
        (homeLib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            testModules.homeModule
            self.homeModules.default
          ];
        }).activationPackage;
    in
    {
      nixosModules.default =
        { ... }:
        {
          imports = [
            inputs.catppuccin.nixosModules.catppuccin
          ]
          ++ nixhubModules.nixosModules;
        };

      homeModules.default =
        { ... }:
        {
          imports = [
            inputs.catppuccin.homeModules.catppuccin
            inputs.nixcord.homeModules.nixcord
            inputs.spicetify-nix.homeManagerModules.spicetify
          ]
          ++ nixhubModules.homeModules;
        };

      checks.x86_64-linux =
        let
          system = "x86_64-linux";
          lib = nixpkgs.lib;
          pkgs = nixpkgs.legacyPackages.${system};
          homeLib = home-manager.lib;
        in
        {
          nixhub-nixos-module-check = mkNixosModuleTest { inherit lib system; };
          nixhub-home-module-check = mkHomeModuleTest { inherit pkgs homeLib; };
        };

      # formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
