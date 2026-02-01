{ pkgs, ... }:
{
  home.packages = with pkgs; [
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

    conda
    ollama
    nodejs
  ];
}
