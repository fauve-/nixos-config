# home/YOURUSER/shell.nix

{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
    };
  };
}