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
    { ... }@inputs:
    let
      # Define all environment metadata files
      environmentMeta = {
        hyprland = (import ./environments/hyprland/meta inputs);
        niri = (import ./environments/niri/meta inputs);
      };

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
    in
    {
      inherit nixosModules homeModules;
      # checks.x86_64-linux =
      #   let
      #     system = "x86_64-linux";
      #     lib = nixpkgs.lib;
      #     pkgs = nixpkgs.legacyPackages.${system};
      #   in
      #   {
      #     # Validate NixOS hyprland module (use the toplevel derivation)
      #     hyprlandModule =
      #       (lib.nixosSystem {
      #         inherit system;
      #         modules = [
      #           self.nixosModules.hyprland
      #           { users.users.test.isNormalUser = true; }
      #         ];
      #       }).config.system.build.toplevel;

      #     # Validate NixOS niri module
      #     niriModule =
      #       (lib.nixosSystem {
      #         inherit system;
      #         modules = [
      #           self.nixosModules.niri
      #           { users.users.test.isNormalUser = true; }
      #         ];
      #       }).config.system.build.toplevel;

      #     # Validate Home-Manager hyprland module (use the activation derivation)
      #     hyprlandHome =
      #       (lib.homeManagerConfiguration {
      #         pkgs = pkgs;
      #         modules = [
      #           self.homeModules.hyprland
      #           {
      #             home.username = "test";
      #             home.homeDirectory = "/home/test";
      #           }
      #         ];
      #       }).activationPackage;

      #     # Validate Home-Manager niri module
      #     niriHome =
      #       (lib.homeManagerConfiguration {
      #         pkgs = pkgs;
      #         modules = [
      #           self.homeModules.niri
      #           {
      #             home.username = "test";
      #             home.homeDirectory = "/home/test";
      #           }
      #         ];
      #       }).activationPackage;
      #   };
    };
}
