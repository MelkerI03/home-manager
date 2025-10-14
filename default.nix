{ pkgs, ... }:

{
  imports = [
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

    ./vscode/config.nix
  ];

  #----=[ Packages ]=----#
  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    fira-code
    fira-code-symbols
    proggyfonts
    liberation_ttf
    adwaita-icon-theme
    noto-fonts-emoji
    noto-fonts-cjk-sans
    font-awesome

    # Languages
    (python3.withPackages (
      ps: with ps; [
        requests
        pandas
        flask
        dbus-python
        matplotlib
        scipy
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
      ]
    ))
    zig_0_13
    gcc
    cmake
    ninja

    rustc
    cargo
    go
    lua
    jq

    # LSPs and more
    stylua
    black
    nixfmt
    clang-tools
    stylish-haskell
    haskell-language-server
    cabal2nix
    hlint
    vale
    rust-analyzer
    rustfmt
    clippy

    # QoL Tools
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
    wayclip
    bc
    eva
    fastfetch

    # Productivity
    libreoffice
    gimp

    # Other
    steam
    lutris
    spotify
    vesktop
    signal-desktop

    # TEMPORARY PACKAGES
    vlc
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Liberation Serif" ];
        monospace = [
          "Fira Code Nerd Font Mono"
          "JetBrainsMono Nerd Font Mono"
        ];
      };
    };
  };
}
