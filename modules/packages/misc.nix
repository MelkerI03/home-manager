{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    spotify

    vesktop
    signal-desktop
    popcorntime
  ];
}
