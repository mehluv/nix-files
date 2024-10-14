{ pkgs, ... }:
{
  # Enable the KDE Plasma Desktop Environment.
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font  = "Inclusive Sans";
      fontSize = "10";
      background = "${./wallpaper.jpg}";
      loginBackground = true;
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    theme = "catppuccin-mocha";
  };

  services.desktopManager.plasma6.enable = true;
}