{
  lib,
  config,
  ...
}:
let
  cfg = config.desktop-environment.hyprland or { enable = false; };
in
{
  # HM runs in its own module tree, so declare the same option here too.
  options.desktop-environment.hyprland.enable = lib.mkEnableOption "Hyprland (Home-Manager part)";

  config = lib.mkIf cfg.enable {
    imports = [
      ./catppuccin.nix
      ./gtk.nix
      ./home.nix
      ./qt.nix
      ./services.nix
      ./wayland.nix
      ./programs
    ];
  };
}
