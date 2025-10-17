{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "nh os switch /home/viking/.config/nixos/";
      test = "nh os test /home/viking/.config/nixos/";
      home = "nh home switch /home/viking/.config/home-manager/";

      vi = "nvim";
      vim = "nvim";
      svim = "sudo -E nvim";

      cd = "z";
      ":q" = "exit";
      ls = "exa -lih";

      cat = "bat";
      diff = "batdiff";
      grep = "batgrep";
      rg = "batgrep";

      "devenv init" = "nix flake init --template github:cachix/devenv#flake-parts";
    };

    history.size = 10000;

    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      VISUAL = "nvim";
      GIT_EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      DIRENV_LOG_FORMAT = "";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "frontcube"; # Really nice theme
    };
  };
}
