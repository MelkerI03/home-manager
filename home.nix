{ pkgs, ... }:

{
  imports = [
    ./hyprland/config.nix
    ./nixvim/config.nix
    ./direnv/config.nix
    ./kitty/config.nix
    ./tmux/config.nix
    ./rofi/config.nix
    ./zsh/config.nix
    ./cli/config.nix
    ./ssh/config.nix
    ./git/config.nix
    ./nh/config.nix
  ];

  home.username = "viking";
  home.homeDirectory = "/home/viking";
  home.stateVersion = "25.05";

  #----=[ Packages ]=----#
  home.packages = with pkgs; [
    # Languages
    (python3.withPackages (
      ps: with ps; [
        requests
        pandas
        flask
        dbus-python
      ]
    ))
    (haskellPackages.ghc.withPackages (
      ps: with ps; [
        lens
        aeson
        text
        containers
        bytestring
        composition
        lens
        bytestring
      ]
    ))
    zig_0_13

    # LSPs and more
    stylua
    black
    prettier
    nixfmt
    clang-tools
    stylish-haskell

    # QoL Tools
    eza
    bat
    fzf
    ripgrep
    btop
    zip
    unzip
    fd
    feh
    wev

    xfce.thunar

    # Other
    steam
    lutris
    spotify
    vesktop
  ];

  # Enable Home-Manager
  programs.home-manager.enable = true;
}
