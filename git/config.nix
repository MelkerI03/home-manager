{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Melker Isaksson";
    userEmail = "Melker.Isaksson@outlook.com";

    extraConfig = {
      init = {
        defaultBranch = "master";
      };
      push.autoSetupRemote = true;
    };

    delta = {
      enable = true;
      options = {

        navigate = true; # use n and N to move between diff sections
        dark = true; # or light = true, or omit for auto-detection
      };
    };
  };
}
