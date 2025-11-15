{ ... }:
{
  imports = [
    ../config/home-manager

    ./programs
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./xdg.nix
  ];
}
