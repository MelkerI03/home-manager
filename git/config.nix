{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Melker Isaksson";
    userEmail = "Melker.Isaksson@outlook.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      push.autoSetupRemote = true;
    };
  };
}
