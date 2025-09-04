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
          lib,
          config,
          ...
        }:
        let
          cfg = config.desktop-environment.hyprland or { enable = false; };
        in
        {
          options.desktop-environment.hyprland.enable = lib.mkEnableOption "Hyprland DE suite";

          # Only include fragments when enabled
          imports = lib.optionals cfg.enable [
            (self + /environments/hyprland/modules)
            catppuccin.nixosModules.catppuccin
          ];
        };

      homeModules.hyprland =
        {
          lib,
          config,
          ...
        }:
        let
          cfg = (config.desktop-environment.hyprland or { enable = false; });
        in
        {
          options.desktop-environment.hyprland.enable = lib.mkEnableOption "Hyprland (Home-Manager)";

          imports = lib.optionals cfg.enable [
            (self + /environments/hyprland/home-manager)
            catppuccin.homeModules.catppuccin
            spicetify-nix.homeModules.spicetify
          ];
        };
    };
}
