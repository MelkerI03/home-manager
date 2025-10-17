{ pkgs, config, ... }:
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

      commit = {
        verbose = true;
        template = "${config.xdg.configHome}/git/commit-template.txt";
      };

      credential.helper = "oauth";
      push = {
        default = "current";
        autoSetupRemote = true;

        followTags = true;
      };

      pull = {
        default = "current";
        rebase = true;
      };

      rebase = {
        autoStash = true;
        missingCommitsCheck = "warn";
      };

      branch = {
        sort = "-committerdate";
      };

      tag = {
        sort = "-taggerdate";
      };
    };

    delta = {
      enable = true;
      options = {
        navigate = true; # use n and N to move between diff sections
        dark = true;
      };
    };
  };
  home.file.".config/git/commit-template.txt".text = ''
    # ✅ CATEGORIES (pick one per commit):
    #
    # ✨ feat: 
    # 🐛 fix: 
    # 🧹 refactor: 
    # 🧪 test: 
    # 🧩 chore: 
    # 🎨 style: 
    # 📝 docs: 
    # 🚀 perf: 
    # 🔒 security: 
    # 🔧 config: 
    # ⏪ revert: 
    #
    # ────────────────────────────────────────────────
    #
    # 💡 STRUCTURE:
    # <type>: <short summary>
    #
    # [blank line]
    # (optional) <detailed description explaining what and why>
    #
    # ────────────────────────────────────────────────
  '';
  home.packages = with pkgs; [
    git-credential-oauth
  ];
}
