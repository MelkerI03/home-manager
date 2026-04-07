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

      wallpaper = [
        {
          monitor = "";
          path = "${wallpaper}";
        }
      ];
    };
  };
}
