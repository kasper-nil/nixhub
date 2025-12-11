{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.i3;
in
{
  services = lib.mkIf cfg.enable {
    polybar = {
      enable = true;

      script = ''
        # Kill running polybar instances
        polybar-msg cmd quit || true

        # Simple single-monitor setup:
        polybar main &
      '';

      package = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
        mpdSupport = true;
      };

      settings = {
        "bar/main" = {
          monitor = "\${env:MONITOR:}";

          width = "100%";
          height = 28;
          radius = 0;

          background = "\${colors.base}";
          foreground = "\${colors.text}";

          line.size = 3;
          line.color = "\${colors.sky}";

          border.size = 0;
          border.color = "\${colors.crust}";

          padding.left = 2;
          padding.right = 2;

          module.margin.left = 1;
          module.margin.right = 1;

          font = "JetBrainsMono Nerd Font:size=10;2";

          separator.text = " | ";
          separator.foreground = "\${colors.overlay1}";

          # module positions
          modules.left = "i3";
          modules.center = "date";
          modules.right = "pulseaudio cpu memory filesystem wlan eth battery";

          cursor.click = "pointer";
          cursor.scroll = "ns-resize";

          enable-ipc = true;
          override-redirect = false;
          wm-restack = "i3";

          tray.position = "right";
          tray.maxsize = 16;
          tray.background = "\${colors.base}";
          tray.foreground = "\${colors.text}";
          tray.padding = 2;
        };

        "module/i3" = {
          type = "internal/i3";
          format = "<label-state> <label-mode>";
          index-sort = true;
          wrapping-scroll = false;
          pin-workspaces = true;

          label.mode.text = "%mode%";
          label.mode.foreground = "\${colors.base}";
          label.mode.background = "\${colors.peach}";
          label.mode.padding = 2;

          label.focused.text = "%name%";
          label.focused.foreground = "\${colors.base}";
          label.focused.background = "\${colors.sky}";
          label.focused.underline = "\${colors.sky}";
          label.focused.padding = 2;

          label.unfocused.text = "%name%";
          label.unfocused.foreground = "\${colors.subtext0}";
          label.unfocused.background = "\${colors.base}";
          label.unfocused.padding = 2;

          label.visible.text = "%name%";
          label.visible.foreground = "\${colors.blue}";
          label.visible.background = "\${colors.base}";
          label.visible.padding = 2;

          label.urgent.text = "%name%";
          label.urgent.foreground = "\${colors.base}";
          label.urgent.background = "\${colors.red}";
          label.urgent.padding = 2;
        };

        "module/date" = {
          type = "internal/date";
          interval = 1;

          date = "%Y-%m-%d";
          time = "%H:%M";

          label.text = " %date% %time%";
          label.foreground = "\${colors.lavender}";
        };

        "module/pulseaudio" = {
          type = "internal/pulseaudio";

          use-ui-max = "true";
          interval = 2;

          format.volume = "<label-volume> <bar-volume>";
          label.volume.text = " %percentage%%";
          label.volume.foreground = "\${colors.green}";

          label.muted.text = " %percentage%%";
          label.muted.foreground = "\${colors.overlay2}";

          bar.volume.width = 10;
          bar.volume.foreground = "\${colors.green}";
          bar.volume.background = "\${colors.surface0}";
          bar.volume.indicator.text = "│";
          bar.volume.fill = "─";
          bar.volume.empty.text = "─";
          bar.volume.indicator.foreground = "\${colors.green}";
          bar.volume.empty.foreground = "\${colors.overlay1}";

          click.right = "pavucontrol &";
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;

          format = "<label>";
          label.text = " %percentage%%";
          label.foreground = "\${colors.mauve}";
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 5;

          format = "<label>";
          label.text = " %percentage_used%%";
          label.foreground = "\${colors.teal}";
        };

        "module/filesystem" = {
          type = "internal/fs";
          mount-0 = "/";
          interval = 30;

          label.mount.text = " %percentage_used%%";
          label.mount.foreground = "\${colors.peach}";
        };

        "module/wlan" = {
          type = "internal/network";
          interface = "wlp3s0"; # change to your Wi‑Fi interface
          interval = 3;

          format.connected = "<label-connected>";
          format.disconnected = "<label-disconnected>";

          label.connected.text = " %essid% %signal%%%";
          label.connected.foreground = "\${colors.sky}";

          label.disconnected.text = "睊";
          label.disconnected.foreground = "\${colors.overlay1}";
        };

        "module/eth" = {
          type = "internal/network";
          interface = "enp0s25"; # change to your Ethernet interface
          interval = 3;

          format.connected = "<label-connected>";
          format.disconnected = "<label-disconnected>";

          label.connected.text = " %local_ip%";
          label.connected.foreground = "\${colors.sapphire}";

          label.disconnected.text = " down";
          label.disconnected.foreground = "\${colors.overlay1}";
        };

        "module/battery" = {
          type = "internal/battery";
          battery = "BAT0"; # adjust to your system
          adapter = "AC";
          full-at = 98;

          poll-interval = 30;

          format.charging = "<animation-charging> <label-charging>";
          format.discharging = "<ramp-capacity> <label-discharging>";
          format.full = "<label-full>";

          label.charging.text = "%percentage%%";
          label.charging.foreground = "\${colors.green}";

          label.discharging.text = "%percentage%%";
          label.discharging.foreground = "\${colors.yellow}";

          label.full.text = " %percentage%%";
          label.full.foreground = "\${colors.green}";

          ramp.capacity.text = [
            ""
            ""
            ""
            ""
            ""
          ];
          ramp.capacity.foreground = "\${colors.yellow}";

          animation.charging.text = [
            ""
            ""
            ""
            ""
            ""
          ];

          animation.charging.foreground = "\${colors.green}";
          animation.charging.frame-rate = 700;
        };
      };
    };
  };
}
