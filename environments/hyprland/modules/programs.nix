{
  config,
  pkgs,
  nilhubInputs,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  programs = lib.mkIf cfg.enable {
    hyprland = {
      enable = true;
    };

    dms-shell = {
      enable = true;

      quickshell.package = nilhubInputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

      systemd = {
        enable = true; # Systemd service for auto-start
        restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
      };

      enableSystemMonitoring = false; # System monitoring widgets (dgop)
      enableVPN = true; # VPN management widget
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
    };
  };
}
