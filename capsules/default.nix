let
  # List of available desktop environments
  capsules = [
    "vscode"
  ];

  # Generate module lists for each environment
  mkEnvironmentModules = envName: {
    nixos = {
      implementation = ./${envName}/modules;
    };
    home = {
      implementation = ./${envName}/home-manager;
    };
  };

  # Collect all modules
  allEnvironments = map mkEnvironmentModules capsules;
in
{
  # All NixOS modules (options + implementations)
  nixosModules = builtins.concatLists (
    map (env: [
      env.nixos.implementation
    ]) allEnvironments
  );

  # All Home Manager modules (options + implementations)
  homeModules = builtins.concatLists (
    map (env: [
      env.home.implementation
    ]) allEnvironments
  );
}
