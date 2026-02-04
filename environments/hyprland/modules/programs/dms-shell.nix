{
  config,
  lib,
  pkgs,
  nilhubInputs,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  programs.dms-shell = lib.mkIf cfg.enable {
    enable = true;

    # quickshell.package = nilhubInputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

    systemd = {
      enable = true; # Systemd service for auto-start
      target = "graphical-session.target"; # Try avoid race issues under uswm managed hyprland
    };

    enableVPN = true; # VPN management widget
    enableDynamicTheming = false; # Wallpaper-based theming (matugen)
    enableClipboardPaste = true; # System monitoring widgets (dgop)
    enableCalendarEvents = true; # System monitoring widgets (dgop)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableSystemMonitoring = true; # Audio visualizer (cava)
  };
}
