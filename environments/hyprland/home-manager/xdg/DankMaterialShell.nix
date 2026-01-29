{
  config,
  self,
  lib,
  ...
}:
let
  cfg = config.nilhub.hyprland;
  dotfiles = self + "/dotfiles/DankMaterialShell";
  wallpaper = self + "/assets/wallpaper.png";

  settings = {
  };

  baseSettings = builtins.fromJSON (builtins.readFile (dotfiles + "/settings.json"));
  mergedSettings = lib.recursiveUpdate baseSettings settings;
in
{
  xdg.configFile = lib.mkIf cfg.enable {
    "DankMaterialShell/themes" = {
      source = dotfiles + "/themes";
      recursive = true;
    };

    "DankMaterialShell/settings.json".text = builtins.toJSON mergedSettings;
  };
}
