{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    lutris
    spotify

    vesktop
    signal-desktop
  ];
}
