{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.plasma6;
in
{
  environment = lib.mkIf cfg.enable {
    plasma6 = {
      excludePackages = with pkgs; [
        kdePackages.konsole
      ];
    };
  };
}
