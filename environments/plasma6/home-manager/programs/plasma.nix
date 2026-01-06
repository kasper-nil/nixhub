{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.plasma6;
  wallpaper = ../../../assets/wallpaper.png;
in
{
  programs.plasma = lib.mkIf cfg.enable {
    enable = true;

    # fonts = {
    #   general = {
    #     family = "JetBrains Mono";
    #     pointSize = 10;
    #   };
    # };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "breeze_cursors";
        size = 32;
      };
      iconTheme = "breeze-dark";
      wallpaper = wallpaper;
    };

    krunner = {
      shortcuts = {
        launch = "Meta+D";
      };
      position = "center";
      activateWhenTypingOnDesktop = true;
    };

    shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+Ctrl+Alt+L"
        ];
      };

      kwin = {
        "Window Close" = "Meta+Q";
        "Window Fullscreen" = "Meta+F";

        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";

        "Window to Desktop 1" = "Meta+Ctrl+1";
        "Window to Desktop 2" = "Meta+Ctrl+2";
        "Window to Desktop 3" = "Meta+Ctrl+3";
        "Window to Desktop 4" = "Meta+Ctrl+4";
        "Window to Desktop 5" = "Meta+Ctrl+5";

        # Unbind
        "Show Desktop" = "none";
        "Edit Tiles" = "none";
      };

      plasmashell = {
        "manage activities" = "none";
        "activate application launcher" = "none";
      };

      "services/org.kde.krunner.desktop"."_launch" = "Meta+D";
      "services/Alacritty.desktop"."_launch" = "Meta+T";
    };

    kwin = {
      virtualDesktops = {
        rows = 1;
        names = [
          "1"
          "2"
          "3"
          "4"
          "5"
        ];
        number = 5;
      };

      tiling = {
        padding = 8;
      };
    };

    panels = [
      {
        location = "top";
        screen = "all";
        widgets = [
          {
            pager = {
              general = {
                showWindowOutlines = true;
                showApplicationIconsOnWindowOutlines = true;
                showOnlyCurrentScreen = false;
                navigationWrapsAround = false;
              };
            };
          }
          "org.kde.plasma.panelspacer"
          {
            iconTasks = {
              launchers = [
              ];
            };
          }
          # If no configuration is needed, specifying only the name of the
          # widget will add them with the default configuration.
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
        ];
      }
    ];
  };
}
