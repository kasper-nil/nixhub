{ inputs, ... }:
let
  # List of all environment names to manage
  environmentNames = [
    "hyprland"
    # "niri"
  ];

  allConfigModules = builtins.concatLists (
    builtins.map (envName: [
      (import ./environments/${envName}/config { inherit inputs; })
    ]) environmentNames
  );

  allImplementationModules = builtins.concatLists (
    builtins.map (envName: [
      (import ./environments/${envName}/modules { inherit inputs; })
      (import ./environments/${envName}/home-manager { inherit inputs; })
    ]) environmentNames
  );
in
{
  # Import all modules that define options (e.g., nixhub.hyprland.enable)
  imports = allConfigModules ++ allImplementationModules;

  # # This makes 'inputs' (or specific inputs) available to all NixOS sub-modules
  # _module.args = {
  #   inherit inputs;
  # };

  # # Pass all flake inputs to Home Manager modules if needed
  # home.extraSpecialArgs = {
  #   inherit inputs;
  # };
}
