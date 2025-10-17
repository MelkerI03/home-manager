{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [ "/home/viking/.config/home-manager/wallpapers/redmountain.png" ];
      wallpaper = [ "eDP-1,/home/viking/.config/home-manager/wallpapers/redmountain.png" ];
    };
  };
}
