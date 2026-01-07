{ config, lib, ... }:
let
  cfg = config.nilhub.cosmic;
in
{
  programs.alacritty = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      font = {
        size = 11;
      };

      window = {
        padding = {
          x = 12;
          y = 8;
        };
      };
    };
  };
}
