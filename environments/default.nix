{ lib, config, ... }:
let
  c = config.desktop-environment; # namespace "desktop-environment" — change this to your preferred prefix
  enabledList = builtins.filter (x: x) [
    (c.hyprland.enable or false)
  ];
in
{
  # Pull in all DE modules; each one gates itself on its own enable flag
  imports = [
    ./hyprland
  ];

  # Optional: allow at most one DE
  assertions = [
    {
      assertion = builtins.length enabledList <= 1;
      message = "Only one desktop environment in `desktop-environment.*.enable` may be true.";
    }
  ];
}
