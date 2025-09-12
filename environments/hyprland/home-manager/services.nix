{ ... }:
{
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        preload = [
          "/etc/nixos/assets/wallpaper.png"
        ];

        wallpaper = [
          ", /etc/nixos/assets/wallpaper.png"
        ];
      };
    };

    # Fix for hyprpanel quitting after screen wake
    hypridle = {
      enable = false;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          after_sleep_cmd = "hyprctl dispatch dpms on; hyprctl hyprpaper reload ,\"/etc/nixos/assets/wallpaper.png\"";
        };
        listener = [
          {
            timeout = 600;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on; hyprctl hyprpaper reload ,\"/etc/nixos/assets/wallpaper.png\"";
          }
        ];
      };
    };
  };
}
