{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    gimp
    vlc

    cheese
  ];
}
