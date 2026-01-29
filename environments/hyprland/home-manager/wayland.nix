{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
in
{
  wayland = lib.mkIf cfg.enable {
    windowManager = {
      hyprland = {
        enable = true;

        systemd = {
          enable = false;
          variables = [ "all" ];
        };

        settings = {
          "$mod" = "SUPER";

          monitor = cfg.monitor;
          workspace = cfg.workspace;

          exec-once = [
            "dbus-update-activation-environment --systemd --all"
            "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
          ];

          bind = [
            "$mod, D, exec, dms ipc call spotlight toggle"
            "$mod, L, exec, dms ipc call lock lock"
            "$mod, W, exec, dms ipc call hypr toggleOverview"
            "$mod, T, exec, alacritty"
            "$mod, B, exec, brave"
            "$mod SHIFT, s, exec, hyprshot -m region --clipboard-only"
            "$mod SHIFT, c, exec, hyprpicker"

            "$mod, Q, killactive,"
            "$mod, V, togglefloating,"

            "$mod, F, fullscreen"
            "$mod, Tab, cyclenext,"
            "$mod, Tab, bringactivetotop,"
            "$mod SHIFT, P, exec, hyprctl dispatch pin"

            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"

            "$mod, mouse_up, layoutmsg, move +col"
            "$mod, mouse_down, layoutmsg, move -col"
          ]
          ++ (builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod CTRL, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 9
          ));

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

          bindel = [
            ",XF86AudioRaiseVolume, exec, dms ipc call audio increment 1"
            ",XF86AudioLowerVolume, exec, dms ipc call audio decrement 1"
            ",XF86AudioMute, exec, dms ipc call audio mute"
            ",XF86AudioMicMute, exec, dms ipc call audio micmute"
            '',XF86MonBrightnessUp, exec, ipc call brightness increment 10 ""''
            '',XF86MonBrightnessDown, exec, ipc call brightness decrement 10 ""''
            ", XF86AudioPrev, exec, dms ipc call mpris previous"
            ", XF86AudioNext, exec, dms ipc call mpris next"
            ", XF86AudioPause, exec, dms ipc call mpris pause"
            ", XF86AudioPlay, exec, dms ipc call mpris play"
          ];

          general = {
            gaps_in = 5;
            gaps_out = 10;
            layout = "dwindle";
          };

          decoration = {
            rounding = 10;
            rounding_power = 2;

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };

            blur = {
              enabled = true;
              size = 3;
              passes = 2;
              vibrancy = 0.1696;
            };
          };

          animations = {
            enabled = true;

            bezier = [
              "easeOutQuint,0.23,1,0.32,1"
              "easeInOutCubic,0.65,0.05,0.36,1"
              "linear,0,0,1,1"
              "almostLinear,0.5,0.5,0.75,1.0"
              "quick,0.15,0,0.1,1"
            ];

            animation = [
              "global, 1, 10, default"
              "border, 1, 5.39, easeOutQuint"
              "windows, 1, 4.79, easeOutQuint"
              "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
              "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
              "windowsOut, 1, 1.49, linear, popin 87%"
              "fadeIn, 1, 1.73, almostLinear"
              "fadeOut, 1, 1.46, almostLinear"
              "fade, 1, 3.03, quick"
              "layers, 1, 3.81, easeOutQuint"
              "layersIn, 1, 4, easeOutQuint, fade"
              "layersOut, 1, 1.5, linear, fade"
              "fadeLayersIn, 1, 1.79, almostLinear"
              "fadeLayersOut, 1, 1.39, almostLinear"
              "workspaces, 1, 1.94, almostLinear, fade"
              "workspacesIn, 1, 1.21, almostLinear, fade"
              "workspacesOut, 1, 1.94, almostLinear, fade"
            ];
          };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = true;
          };

          input = {
            kb_layout = "no";
            kb_variant = "nodeadkeys";

            follow_mouse = 1;

            sensitivity = -0.5;

            touchpad = {
              natural_scroll = false;
            };
          };
        };
      };
    };
  };
}
