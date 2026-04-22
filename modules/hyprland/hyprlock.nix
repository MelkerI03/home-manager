{ config, ... }:
let
  homeManagerDir = "${config.home.homeDirectory}/.config/home-manager";
  wallpaper = "${homeManagerDir}/wallpapers/dark_alley.jpg";
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "${wallpaper}";
          blur_passes = 2;
          blur_size = 8;
        }
      ];
    };
  };
}
