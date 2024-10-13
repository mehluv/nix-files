{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch
  ];
  programs.bash.interactiveShellInit = ''
  neofetch;
  '';
}