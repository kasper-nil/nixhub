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
      home-manager, # Still needed if Home Manager configurations are elsewhere and require `home-manager.lib`
      catppuccin,
      spicetify-nix,
      nixcord,
      ...
    }@inputs: # Capture all inputs into `inputs` for passing to meta files
    let
      # Define all environment metadata files
      # Each meta file is a function that expects relevant inputs.
      # We call it here, passing all available inputs from the flake.
      environmentMeta = {
        hyprland = (import ./environments/meta/hyprland.nix inputs);
        niri = (import ./environments/meta/niri.nix inputs);
        # Add more environments here as you create their meta files
        # plasma = (import ./environments/meta/plasma.nix inputs);
      };

      # Function to create NixOS modules dynamically from environmentMeta
      mkNixOSModule =
        envName: envMeta:
        { ... }:
        {
          imports = envMeta.nixosModules;
        };

      # Function to create Home Manager modules dynamically from environmentMeta
      mkHomeManagerModule =
        envName: envMeta:
        { ... }:
        {
          _module.args = envMeta.homeManagerModuleArgs; # Use specific args from meta file
          imports = envMeta.homeManagerModules;
        };

      # Generate the nixosModules and homeModules attribute sets
      # by iterating over environmentMeta
      nixosModules = builtins.mapAttrs mkNixOSModule environmentMeta;
      homeModules = builtins.mapAttrs mkHomeManagerModule environmentMeta;
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
