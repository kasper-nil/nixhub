{ config, lib, ... }:
let
  cfg = config.nilhub.plasma6;
in
{
  programs.yazi = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      manager = {
        show_hidden = true;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
  };
}
