let
  # List of available desktop environments
  environments = [
    "hyprland"
    "plasma6"
    "cosmic"
    "niri"
    # "i3"
  ];

  # Generate module lists for each environment
  mkEnvironmentModules = envName: {
    nixos = {
      options = ./${envName}/config/modules.nix;
      implementation = ./${envName}/modules;
    };
    home = {
      options = ./${envName}/config/home-manager.nix;
      implementation = ./${envName}/home-manager;
    };
  };

  # Collect all modules
  allEnvironments = map mkEnvironmentModules environments;
in
{
  # All NixOS modules (options + implementations)
  nixosModules = builtins.concatLists (
    map (env: [
      env.nixos.options
      env.nixos.implementation
    ]) allEnvironments
  );

  # All Home Manager modules (options + implementations)
  homeModules = builtins.concatLists (
    map (env: [
      env.home.options
      env.home.implementation
    ]) allEnvironments
  );
}
