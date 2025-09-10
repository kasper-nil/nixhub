{ lib, ... }:
{
  imports = [
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
    ./programs
  ];

  options.nixhub.hyprland.monitor = lib.mkOption {
    type = with lib.types; listOf str;
    default = [ ];
    description = "List of monitors to use. Refer to the hyprland wiki.";
    example = [
      "DP-2,2560x1440@165,0x0,1"
      "DP-3,2560x1440@165,2560x0,1"
    ];
  };

  options.nixhub.hyprland.workspace = lib.mkOption {
    type = with lib.types; listOf str;
    default = [ ];
    description = "Workspace to use. Refer to the hyprland wiki.";
    example = "[ workspace=1, monitor:DP-2 ]";
  };
}
