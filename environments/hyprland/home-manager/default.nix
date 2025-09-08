{
  catppuccin,
  ...
}:
{
  imports = [
    catppuccin.homeModules.catppuccin
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];
}
