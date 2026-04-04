{ config, ... }:
{
  home.username = "viking";
  home.homeDirectory = "/home/viking";
  home.stateVersion = "25.05";

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
      extraConfig = {
        SCREENSHOTS = "${config.home.homeDirectory}/Pictures/screenshots";
      };
    };

    configFile."mimeapps.list".force = true;
    mime.enable = true;
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "text/html" = [ "firefox.desktop" ];

      "x-scheme-handler/discord" = [ "vesktop.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];

      "application/pdf" = [ "firefox.desktop" ];
      "application/x-extension-htm" = [ "firefox.desktop" ];
      "application/x-extension-html" = [ "firefox.desktop" ];
      "application/x-extension-shtml" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "application/x-extension-xhtml" = [ "firefox.desktop" ];
      "application/x-extension-xht" = [ "firefox.desktop" ];

      "image/png" = [ "pix.desktop" ];
      "image/jpg" = [ "pix.desktop" ];
      "image/webp" = [ "pix.desktop" ];
      "image/svg+xml" = [ "pix.desktop" ];
      "image/jpeg" = [ "pix.desktop" ];
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
