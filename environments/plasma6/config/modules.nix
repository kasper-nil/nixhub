{ lib, ... }:
{
  options.nilhub.plasma6 = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable KDE Plasma 6 desktop environment";
    };
  };
}
