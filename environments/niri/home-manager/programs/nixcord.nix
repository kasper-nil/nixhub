{
  config,
  lib,
  ...
}:
let
  cfg = config.nixhub.niri;
in
{
  programs.nixcord = lib.mkIf cfg.enable {
    enable = true; # Enable Nixcord (It also installs Discord)
    vesktop.enable = true; # Vesktop
    # dorion.enable = true; # Dorion
    config = {
      useQuickCss = true; # use out quickCSS
      themeLinks = [
        # or use an online theme
        "https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/mocha.theme.css"
      ];
      frameless = true; # Set some Vencord options
    };
  };
}
