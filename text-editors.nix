{ config, pkgs, ... }:
{
  users.users.luv.packages = with pkgs; [
      vscode
  ];
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    emacs
  ];

  programs.vim.defaultEditor = true;

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
    SUDO_EDITOR = "vim";
  };
}