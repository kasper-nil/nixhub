{ lib, ... }:
{
  options.nixhub.niri = {
    enable = {
      type = lib.types.bool;
      default = false;
      description = "Enable niri desktop environment";
    };
  };
}
