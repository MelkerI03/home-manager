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

  xdg.userDirs.enable = true;

  services.blueman-applet.enable = true;

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

    # CTF tools
    burpsuite
    ghidra
    wordlists
    wine
    gobuster
    hydra
    nikto
    wireshark-qt
    sqlmap
    payloadsallthethings
    ffuf
    fuzzdb
    cyberchef
    hashcat
    enum4linux-ng
    smbclient-ng
    smbmap
    smbscan
    dig
    steghide
    stegseek
    stegsolve
    binwalk
    exiftool
    ltrace
    foremost
    zsteg
    nmap
    tcpflow
    tcpdump
    whois
    ipcalc
    checksec
    ropgadget
    ropr
    gdb
    apktool

    # Create an FHS environment using the command `fhs`, enabling the execution of non-NixOS packages in NixOS!
    (
      let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
      pkgs.buildFHSEnv (
        base
        // {
          name = "fhs";
          targetPkgs =
            pkgs:
            # pkgs.buildFHSEnv provides only a minimal FHS environment,
            # lacking many basic packages needed by most software.
            # Therefore, we need to add them manually.
            #
            # pkgs.appimageTools provides basic packages required by most software.
            (base.targetPkgs pkgs)
            ++ (with pkgs; [
              pkg-config
              ncurses
              # Feel free to add more packages here if needed.
            ]);
          profile = "export FHS=1";
          runScript = "bash";
          extraOutputsToInstall = [ "dev" ];
        }
      )
    )

    # Productivity
    libreoffice
    gimp

    # Other
    steam
    lutris
    spotify
    vesktop

    # TEMPORARY PACKAGES
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

  # Enable Home-Manager
  programs.home-manager.enable = true;
}
