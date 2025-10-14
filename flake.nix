{
  description = "Home-Manager Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixploit.url = "github:MelkerI03/nixploit";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      home-manager,
      nixvim,
      nixploit,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
      ];

      flake.homeConfigurations = {
        viking = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = [
            ./modules/home-base.nix
            ./default.nix
            nixvim.homeModules.nixvim
            nixploit.homeManagerModules.nixploit
          ];
        };
      };
    };
}
