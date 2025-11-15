{ lib, ... }:
{
  options.nixhub.niri = {
    enabled = {
      type = with lib.types; bool;
      default = false;
      description = "Enable niri desktop environment";
    };
  };
}
