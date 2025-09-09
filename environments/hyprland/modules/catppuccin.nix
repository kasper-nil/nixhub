{ catppucin, ... }:
{
  imports = [
    catppucin.nixosModules.default
  ];

  catppuccin = {
    enable = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };
  };
}
