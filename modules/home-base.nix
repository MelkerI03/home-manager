{ ... }:
{
  home.username = "viking";
  home.homeDirectory = "/home/viking";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  xdg.userDirs.enable = true;

  services.blueman-applet.enable = true;
  services.udiskie.enable = true;

  programs.home-manager.enable = true;
}
