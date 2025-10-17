{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eza
    fzf
    tree
    ripgrep
    btop
    tealdeer
    fd
    feh
    wev
    xfce.thunar
    btop
    blueman
    pywal
    bc
    eva
    fastfetch
    pipes-rs
  ];
}
