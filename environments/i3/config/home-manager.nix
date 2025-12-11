{ lib, ... }:
{
  options.nilhub.i3 = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable i3 home manager module";
    };
  };
}
