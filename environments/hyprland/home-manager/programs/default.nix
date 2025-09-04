{ lib, ... }:
{
  imports = [
    ./hyprlock.nix
    ./hyprpanel.nix
    ./nixcord.nix
    ./rofi.nix
    ./spicetify.nix
  ];

  disabledModules = [ "./hyprpanel.nix" ];
}
