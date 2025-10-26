{ config, ... }:
let
  homeManagerDir = "${config.home.homeDirectory}/.config/home-manager";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "${homeManagerDir}/wallpapers/redmountain.png"
        "${homeManagerDir}/wallpapers/ghibli_mountain.jpg"
        "${homeManagerDir}/wallpapers/moving_castle.jpg"
      ];

      wallpaper = [
        "eDP-1, ${homeManagerDir}/wallpapers/moving_castle.jpg"
      ];
    };
  };
}
