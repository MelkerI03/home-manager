{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    gimp
    vlc
    cheese
    firefox # Here for debugging purposes
  ];
}
