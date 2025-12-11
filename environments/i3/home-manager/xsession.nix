{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.nilhub.i3;
  mod = "Mod4";
in
{
  xsession = lib.mkIf cfg.enable {
    enable = true;

    windowManager.i3 = {
      enable = true;

      extraConfig = ''
        set $mod ${mod}

        exec_always --no-startup-id xrandr \
        --output DP-1 --primary --mode 2560x1440 --rate 165 --pos 0x0 --rotate normal \
        --output DP-3 --mode 2560x1440 --rate 165 --pos -1440x-480 --rotate right

        # start a terminal
        bindsym $mod+t exec --no-startup-id alacritty

        # start dmenu (a program launcher)
        bindsym $mod+d exec --no-startup-id rofi -show drun

        bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

        bar {
          status_command i3status
        }

        font pango:JetBrains Mono 10

        # Use Mouse+$mod to drag floating windows to their wanted position
        floating_modifier $mod

        workspace "1" output DP-1
        workspace "2" output DP-1
        workspace "3" output DP-1
        workspace "4" output DP-1
        workspace "5" output DP-1
        workspace "6" output DP-1
        workspace "7" output DP-1
        workspace "8" output DP-1
        workspace "9" output DP-2

        # kill focused window
        bindsym $mod+q kill

        # alternatively, you can use the cursor keys:
        bindsym $mod+Left focus left
        bindsym $mod+Down focus down
        bindsym $mod+Up focus up
        bindsym $mod+Right focus right

        # alternatively, you can use the cursor keys:
        bindsym $mod+Shift+Left move left
        bindsym $mod+Shift+Down move down
        bindsym $mod+Shift+Up move up
        bindsym $mod+Shift+Right move right

        # enter fullscreen mode for the focused container
        bindsym $mod+f fullscreen

        # toggle tiling / floating
        bindsym $mod+Shift+v floating toggle

        # switch to workspace
        bindsym $mod+1 workspace 1
        bindsym $mod+2 workspace 2
        bindsym $mod+3 workspace 3
        bindsym $mod+4 workspace 4
        bindsym $mod+5 workspace 5
        bindsym $mod+6 workspace 6
        bindsym $mod+7 workspace 7
        bindsym $mod+8 workspace 8
        bindsym $mod+9 workspace 9
        bindsym $mod+0 workspace 10

        # move focused container to workspace
        bindsym $mod+Shift+1 move container to workspace 1
        bindsym $mod+Shift+2 move container to workspace 2
        bindsym $mod+Shift+3 move container to workspace 3
        bindsym $mod+Shift+4 move container to workspace 4
        bindsym $mod+Shift+5 move container to workspace 5
        bindsym $mod+Shift+6 move container to workspace 6
        bindsym $mod+Shift+7 move container to workspace 7
        bindsym $mod+Shift+8 move container to workspace 8
        bindsym $mod+Shift+9 move container to workspace 9
        bindsym $mod+Shift+0 move container to workspace 10

        # reload the configuration file
        bindsym $mod+r reload
        # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        bindsym $mod+Shift+r restart
        # exit i3 (logs you out of your X session)
      '';
    };
  };
}
