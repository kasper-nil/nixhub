{
  config,
  lib,
  ...
}:
let
  cfg = config.nilhub.cosmic;
in
{
  nixpkgs = lib.mkIf cfg.enable {
    overlays = [
      (final: prev: {
        cosmic-comp = prev.cosmic-comp.overrideAttrs (
          old:
          let
            rev = "4adb07443a4ba472bfa3ffebdb719949c72fa644"; # full commit
            newSrc = prev.fetchFromGitHub {
              owner = "pop-os";
              repo = "cosmic-comp";
              rev = rev;
              hash = "sha256-ZDer2a1qYFmIEDbH8eZ18AFyvPoG/g6eLvKCpSZ4Wkc=";
            };
          in
          {
            src = newSrc;
            version = "git-${builtins.substring 0 8 rev}";

            # This is the crucial part: make cargoDeps correspond to the new src
            cargoDeps = prev.rustPlatform.fetchCargoVendor {
              src = newSrc;
              # empty => Nix will print the correct hash to paste back
              hash = "sha256-1NwI2vQpfQ8y/cVJGA+vYkiB+bAsVgZCb114A0yfWho=";
            };

            # Some packages use cargoDeps + dont need cargoHash at all,
            # but setting it doesn't hurt if the derivation reads it:
            cargoHash = "";
          }
        );
      })
    ];
  };
}
