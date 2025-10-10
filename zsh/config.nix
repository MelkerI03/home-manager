{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -liah";
      update = "nh os switch /home/viking/.config/nixos/";
      home = "nh home switch /home/viking/.config/home-manager/";
      svim = "sudo -E nvim";
      vim = "nvim";
      vi = "nvim";
      cd = "z";
      ":q" = "exit";
    };

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "frontcube"; # Really nice theme
    };
  };
}
