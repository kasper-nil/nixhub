{ lib, ... }:
{
  options.nixhub.niri = lib.mkOption {
    enable = {
      type = lib.types.bool;
      default = false;
      description = "Enable niri desktop environment";
    };
  };
}
