{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  programs.hyprland = lib.mkIf cfg.enable {
    enable = true;

    # Manage hyprland completely from the nixos modules by using the upstream version
    # TODO: ensure this does not cause any issues, fallback to the wayland display manager implementation
    withUWSM = false;

    xwayland.enable = true;
  };
}
