{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland.hyprpanel;
  baseLayout = {
    left = [
      "workspaces"
      "windowtitle"
    ];
    middle = [ "media" ];
    right = [
      "systray"
      "hyprsunset"
      "microphone"
      "volume"
      # "cpu"
      # "cputemp"
      # "ram"
      # "netstat"
      "storage"
      "bluetooth"
      "network"
      "clock"
      "dashboard"
    ];
  };
  hideLayout = {
    left = [ ];
    middle = [ ];
    right = [ ];
  };
in
{
  programs.hyprpanel = {
    enable = true;

    # See 'https://hyprpanel.com/configuration/settings.html'.
    settings = {
      bar = {
        layouts =
          if builtins.length cfg.monitor == 0 then
            { "*" = baseLayout; }
          else
            ({ "*" = hideLayout; } // lib.genAttrs cfg.monitor (_: baseLayout));

        bluetooth.label = false;

        clock.format = "%H:%M:%S";

        customModules = {
          hypridle = {
            isActiveCommand = "systemctl --user status hypridle.service | grep -q 'Active: active (running)' && echo 'yes' || echo 'no'";
            startCommand = "systemctl --user start hypridle.service";
            stopCommand = "systemctl --user stop hypridle.service";
          };

          hyprsunset = {
            label = false;
            offIcon = "󰛨";
            onIcon = "󱩌";
            pollingInterval = 2000;
            temperature = "3500k";
          };

          ram.labelType = "used/total";
        };

        launcher.autoDetectIcon = true;

        network.label = false;

        workspaces = {
          count = 9;
          show_numbered = true;
          show_icons = false;
        };
      };

      menus = {
        clock = {
          time.military = true;
          weather.enabled = false;
        };

        dashboard = {
          directories.enabled = false;
          shortcuts.enabled = true;
        };
      };

      theme = {
        bar = {
          transparent = true;
          outer_spacing = "0.2em";
        };
      };
    };
  };
}
