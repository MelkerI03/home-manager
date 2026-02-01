{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    gimp
    pinta
    vlc
    cheese
    firefox # Here for debugging purposes
    tailscale
    kicad
  ];
}
