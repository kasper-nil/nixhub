{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  programs.alacritty = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };

        bold = {
          family = "JetBrains Mono";
          style = "Bold";
        };

        italic = {
          family = "JetBrains Mono";
          style = "Italic";
        };

        bold_italic = {
          family = "JetBrains Mono";
          style = "Bold Italic";
        };

        size = 11;
      };

      window = {
        decorations = "none";
        padding = {
          x = 12;
          y = 8;
        };
      };
    };
  };
}
