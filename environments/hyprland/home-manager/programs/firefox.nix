{ pkgs, nixhubInputs, ... }:
{
  programs.firefox = {
    enable = true;
    package = nixhubInputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
  };
}
