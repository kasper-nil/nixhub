{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  programs.btop = lib.mkIf cfg.enable {
    enable = true;
  };
}
