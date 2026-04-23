{ config, ... }:
let
  homeManagerDir = "${config.home.homeDirectory}/.config/home-manager";
  wallpaperDir = "${homeManagerDir}/images/wallpapers";

  # wallpaper = "${wallpaperDir}/dark_alley.jpg";
  wallpaper = "${wallpaperDir}/norway.png";
  # wallpaper = "${wallpaperDir}/redmountain.png";
  # wallpaper = "${wallpaperDir}/ghibli_mountain.jpg";
  # wallpaper = "${wallpaperDir}/moving_castle.jpg";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      ipc = true;

      wallpaper = [
        {
          monitor = "";
          path = "${wallpaper}";
        }
      ];
    };
  };
}
