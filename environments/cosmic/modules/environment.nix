{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  environment = lib.mkIf cfg.enable {
    cosmic = {
      excludePackages = with pkgs; [
        cosmic-term
      ];
    };

    sessionVariables = {
      COSMIC_DATA_CONTROL_ENABLED = 1;
    };
  };
}
