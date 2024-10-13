{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Keep all boot setups here
      ./boot.nix
      # Keep language and date settings here.
      ./localization.nix
      # Keep all networking settings here
      ./networking.nix
      # Want to use X windowing? Keep this file. Don't enable along with Wayland
      # ./x-server.nix
      # Want to use wayland? Include this file. Don't enable along with X.
      ./wayland.nix
      # Enable KDE by including this file
      ./kde.nix
      # Enable hyprland by including this file
      # ./hyprland.nix
      # Enable GNOME Desktop Environment by including this file
      # ./gnome.nix
      # Keep the general drivers here
      ./general-drivers.nix
      # Set shell settings here
      ./set-shell.nix
      # Keep your text editors here
      ./text-editors.nix
      # Keep the rest of your uncategorized installables here
      ./packages.nix
    ];

  # Some requisite X window configs, let's just keep them for now.
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];
  };

  # Keeping this here so there's no confusion elsewhere when I add user-level packages
  users.users.luv = {
    isNormalUser = true;
    description = "Luv";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
