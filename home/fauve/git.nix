# home/fauve/git.nix

{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "fauve";
        email = "patrick.m.crawford@gmail.com";
      };
      init.defaultBranch = "main";
    };

  };
}