{ lib, ... }:
{
  options.nilhub.cosmic = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable COSMIC desktop environment";
    };
  };
}
