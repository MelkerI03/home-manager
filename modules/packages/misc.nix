{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    heroic
    prismlauncher
    lutris
    spotify

    vesktop
    signal-desktop
    popcorntime

    pwvucontrol
  ];
}
