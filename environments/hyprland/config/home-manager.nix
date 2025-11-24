{ lib, ... }:
{
  options.nilhub.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable hyprland desktop environment";
    };

    monitor = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      description = "List of monitors to use. Refer to the hyprland wiki.";
      example = [
        "DP-2,2560x1440@165,0x0,1"
        "DP-3,2560x1440@165,2560x0,1"
      ];
    };

    workspace = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      description = "Workspace to use. Refer to the hyprland wiki.";
      example = "[ workspace=1, monitor:DP-2 ]";
    };

    hyprpanel = {
      monitor = lib.mkOption {
        type = with lib.types; listOf str;
        default = [ ];
        description = "List of monitors hyprpanel should be displayed on";
        example = [
          "DP-2"
          "DP-3"
        ];
      };
    };
  };
}
