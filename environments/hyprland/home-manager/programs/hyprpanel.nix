{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland.hyprpanel;
  baseLayout = {
    left = [
      "workspaces"
      "windowtitle"
    ];
    middle = [ "clock" ];
    right = [
      "systray"
      "microphone"
      "volume"
      "cpu"
      "ram"
      "hyprsunset"
      "bluetooth"
      "network"
      "dashboard"
    ];
  };
in
{
  programs.hyprpanel = {
    enable = true;

    # See 'https://hyprpanel.com/configuration/settings.html'.
    settings = {
      bar = {
        # layouts =
        #   if builtins.length cfg.monitor == 0 then
        #     { "*" = baseLayout; }
        #   else
        #     lib.genAttrs cfg.monitor (_: baseLayout);

        layouts = {
          "DP-2" = baseLayout;
        };

        launcher = {
          autoDetectIcon = true;
        };

        workspaces = {
          show_numbered = true;
        };

        clock = {
          format = "%H:%M:%S";
        };

        bluetooth = {
          label = false;
        };

        network = {
          label = false;
        };

        customModules = {
          ram = {
            labelType = "used/total";
          };
          hyprsunset = {
            label = false;
            temperature = "3500k"; # colour when you click “On”
            pollingInterval = 2000; # ms
            onIcon = "󱩌";
            offIcon = "󰛨";
          };
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
          };

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
