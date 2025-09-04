{ ... }:
{
  #imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
  #  lib.filesystem.listFilesRecursive ./.
  #);

  imports = [
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];
}
