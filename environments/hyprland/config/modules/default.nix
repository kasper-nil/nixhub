{ lib, ... }:
{
  options.nixhub.hyprland = {
    enable = {
      type = lib.types.bool;
      default = false;
      description = "Enable hyprland desktop environment";
    };
  };
}
