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

      enableVPN = true; # VPN management widget
      enableDynamicTheming = false; # Wallpaper-based theming (matugen)
      enableClipboardPaste = true; # System monitoring widgets (dgop)
      enableCalendarEvents = true; # System monitoring widgets (dgop)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableSystemMonitoring = true; # Audio visualizer (cava)
    };
  };
}
