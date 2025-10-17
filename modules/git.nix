{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "MelkerI03";
    userEmail = "Melker.Isaksson@outlook.com";

    extraConfig = {
      init = {
        defaultBranch = "master";
      };

      core = {
        compression = 9;
        whitespace = "error";
        preload = true;
      };

      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };

      url = {
        "git@github.com:MelkerI03/" = {
          insteadOf = [
            "mi:"
            "MelkerI03:"
          ];
        };

        "git@github.com:" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };

      interactive = {
        singleKey = true;
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      credential.helper = "oauth";
      push.autoSetupRemote = true;

      pull.rebase = true;
    };

    delta = {
      enable = true;
      options = {
        navigate = true; # use n and N to move between diff sections
        dark = true;
      };
    };
  };
  home.packages = with pkgs; [
    git-credential-oauth
  ];
}
