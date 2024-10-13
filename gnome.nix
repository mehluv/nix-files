{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];
}
