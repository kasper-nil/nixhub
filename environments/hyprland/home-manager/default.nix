{ ... }:
{
  imports = [
    ../config/home-manager

    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];
}
