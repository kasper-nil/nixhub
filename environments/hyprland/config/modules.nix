{ lib, ... }:
{
  options.nixhub.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable hyprland desktop environment";
    };
  };
}
