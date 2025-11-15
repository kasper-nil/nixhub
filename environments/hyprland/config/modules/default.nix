{ lib, ... }:
{
  options.nixhub.hyprland = {
    enable = {
      type = with lib.types; bool;
      default = false;
      description = "Enable hyprland desktop environment";
    };
  };
}
