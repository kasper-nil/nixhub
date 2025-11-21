{ config, lib, ... }:
let
  cfg = config.nixhub.hyprland;
in
{
  programs.yazi = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      manager = {
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
  };
}
