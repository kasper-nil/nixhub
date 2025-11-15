{ lib, ... }:
{
  options.nixhub.niri = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable niri desktop environment";
    };
  };
}
