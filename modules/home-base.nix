{ config, ... }:
{
  home.username = "viking";
  home.homeDirectory = "/home/viking";
  home.stateVersion = "25.05";

  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  xdg.userDirs.extraConfig = {
    XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/screenshots";
  };

  services.blueman-applet.enable = true;
  services.udiskie.enable = true;

  programs.home-manager.enable = true;
}
