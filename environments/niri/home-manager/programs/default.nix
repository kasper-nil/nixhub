{ ... }:
{
  imports = [
    ./nixcord.nix
    ./rofi.nix
    ./spicetify.nix
  ];

  programs = {
    niri.enable = true;

    # Default terminal
    alacritty.enable = true;

    # Default app launcher
    fuzzel.enable = true;

    # Default screen locker
    swaylock.enable = true;

    # Default bar
    waybar.enable = true;
  };
}
