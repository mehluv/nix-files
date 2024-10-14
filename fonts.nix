{ pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
    ubuntu_font_family
    google-fonts
  ];
}