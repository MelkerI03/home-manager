{ config, ... }:
{
  home.username = "viking";
  home.homeDirectory = "/home/viking";
  home.stateVersion = "25.05";

  xdg = {
    userDirs.enable = true;
    userDirs.createDirectories = true;
    userDirs.extraConfig = {
      XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/screenshots";
    };

    configFile."mimeapps.list".force = true;
    mime.enable = true;
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/discord" = [ "vesktop.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];
      "x-scheme-handler/about" = [ "librewolf.desktop" ];
      "x-scheme-handler/unknown" = [ "librewolf.desktop" ];
      "application/x-extension-htm" = [ "librewolf.desktop" ];
      "application/x-extension-html" = [ "librewolf.desktop" ];
      "application/x-extension-shtml" = [ "librewolf.desktop" ];
      "application/xhtml+xml" = [ "librewolf.desktop" ];
      "application/x-extension-xhtml" = [ "librewolf.desktop" ];
      "application/x-extension-xht" = [ "librewolf.desktop" ];

      "images/png" = [ "pix.desktop" ];
      "images/jpg" = [ "pix.desktop" ];
      "images/webp" = [ "pix.desktop" ];
      "images/svg+xml" = [ "pix.desktop" ];
      "images/jpeg" = [ "pix.desktop" ];
    };
  };

  services.blueman-applet.enable = true;
  services.udiskie.enable = true;

  # HDR support
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      profile = "gpu-hq";
      hwdec = "nvdec";
      gpu-api = "vulkan";
      gpu-context = "waylandvk";
      target-colorspace-hint = "auto";
    };
  };

  programs.home-manager.enable = true;

}
