{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [ "/home/viking/Pictures/Wallpapers/redmountain.png" ];
      wallpaper = [ "eDP-1,/home/viking/Pictures/Wallpapers/redmountain.png" ];
    };
  };
}
