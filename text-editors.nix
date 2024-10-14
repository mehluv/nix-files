{ config, pkgs, ... }:
{
  users.users.luv.packages = with pkgs; [
    vscode
  ];
  environment.systemPackages = with pkgs; [
    emacs
  ];
  programs.vim.enable = true;
  programs.vim.defaultEditor = true;

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
    SUDO_EDITOR = "vim";
  };
}