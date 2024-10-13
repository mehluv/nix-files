{ pkgs, ... }:
{
  # Enable hyprland, the ricer's Wayland compositor
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
  ];
}