{ pkgs, ... }:
{
  displayManager = {
    enable = true;
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
    };
  };
}
