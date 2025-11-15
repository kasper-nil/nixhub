{ lib, ... }:
{
  options.nixhub.niri = {
    enable = {
      type = with lib.types; bool;
      default = false;
      description = "Enable niri desktop environment";
    };
  };
}
