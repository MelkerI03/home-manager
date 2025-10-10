{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "nh os switch /home/viking/.config/nixos/";
      home = "nh home switch /home/viking/.config/home-manager/";

      vi = "nvim";
      vim = "nvim";
      svim = "sudo -E nvim";

      cd = "z";
      ":q" = "exit";
      ls = "exa -lih";

      diff = "batdiff";
      grep = "batgrep";
      rg = "batgrep";
    };

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "frontcube"; # Really nice theme
    };
  };
}
