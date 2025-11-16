{
  nixosModule =
    { ... }:
    {
      nixhub = {
        hyprland.enable = true;
        niri.enable = false;
      };

      nixpkgs.config.allowUnfree = true;

      services.displayManager.sddm.wayland.enable = true;

      # Essential settings to make a NixOS system buildable for tests
      # without actually trying to boot it.
      boot.loader.systemd-boot.enable = false;
      boot.loader.efi.canTouchEfiVariables = false;
      boot.loader.grub.enable = false;

      # Dummy root filesystem to satisfy NixOS assertions
      fileSystems."/" = {
        device = "/dev/disk/by-label/NIXOS_BOOT";
        fsType = "ext4";
      };

      networking.hostName = "test-nixos-system"; # Required
      system.stateVersion = "23.11"; # Important to set

      # A test user for basic setup
      users.users.testuser = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "users"
        ];
      };
    };

  homeModule =
    { ... }:
    {
      nixhub = {
        hyprland.enable = true;
        niri.enable = false;
      };

      nixpkgs.config.allowUnfree = true;

      # Essential settings for a Home Manager configuration
      home.username = "testuser";
      home.homeDirectory = "/home/testuser";
      home.stateVersion = "23.11";
    };
}
