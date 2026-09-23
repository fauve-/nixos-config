{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./shell.nix
    ./emacs.nix
  ];

  home.username = "fauve";
  home.homeDirectory = "/home/fauve";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
    htop
    vscode
    clang
    signal-desktop
    codex
    nixfmt
  ];

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
