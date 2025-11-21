{
  config,
  lib,
  pkgs,
  nixhubInputs,
  ...
}:
let
  cfg = config.nixhub.hyprland;
in
{
  programs.firefox = lib.mkIf cfg.enable {
    enable = true;
    package = nixhubInputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
  };
}
