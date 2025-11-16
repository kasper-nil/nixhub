{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin

    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
  ];
}
