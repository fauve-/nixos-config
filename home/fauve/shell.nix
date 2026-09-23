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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [
      "gruvbox-rainbow"
    ];
  };
}
