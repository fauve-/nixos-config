{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./shell.nix
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
  ];

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}