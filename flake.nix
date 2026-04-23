{
  description = "Home-Manager Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixploit.url = "github:MelkerI03/nixploit";
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      home-manager,
      nixvim,
      nixploit,
      nix-index-database,
      catppuccin,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      flake.homeConfigurations = {
        viking = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          extraSpecialArgs = {
            inherit (inputs) noctalia;
          };

          modules = [
            ./modules/home-base.nix
            ./modules/direnv.nix
            ./modules/nix-index.nix
            ./modules/fonts.nix
            ./modules/nh.nix

            ./modules/nixvim/nixvim.nix
            ./modules/librewolf.nix
            ./modules/hyprland.nix
            ./modules/noctalia.nix
            ./modules/zathura.nix
            ./modules/kitty.nix
            ./modules/tmux.nix
            ./modules/cli.nix
            ./modules/git.nix
            ./modules/ssh.nix
            ./modules/zsh.nix

            ./modules/packages/productivity.nix
            ./modules/packages/development.nix
            ./modules/packages/misc.nix
            ./modules/packages/QoL.nix

            nixvim.homeModules.nixvim
            nix-index-database.homeModules.default
            nixploit.homeModules.nixploit
            catppuccin.homeModules.catppuccin
          ];
        };
      };
    };
}
