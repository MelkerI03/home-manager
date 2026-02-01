{ config, ... }:
let
  homeManagerDir = "${config.home.homeDirectory}/.config/home-manager";
  wallpaper = "${homeManagerDir}/wallpapers/dark_alley.jpg";
  # wallpaper = "${homeManagerDir}/wallpapers/redmountain.png";
  # wallpaper = "${homeManagerDir}/wallpapers/ghibli_mountain.jpg";
  # wallpaper = "${homeManagerDir}/wallpapers/moving_castle.jpg";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      ipc = true;

      preload = [
        wallpaper
      ];

      wallpaper = [
        # "eDP-1,${wallpaper}"
        # "DP-7,${wallpaper}"
        # "DP-8,${wallpaper}"
        ", ${wallpaper}"
      ];
    };
  };
}
