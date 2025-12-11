{ ... }:
{
  imports = [
    ./catppuccin.nix
    ./fonts.nix
    ./programs.nix
    ./services.nix
    ./security.nix
    ../../../shell/nil-shell/modules
  ];
}
