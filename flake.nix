{
  description = "Home-Manager Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixploit.url = "github:MelkerI03/nixploit";
    # ragenix.url = "github:yaxitech/ragenix";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      home-manager,
      nixvim,
      nixploit,
      # ragenix,
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
            # ragenix.homeManagerModules
            ./modules/home-base.nix
            ./modules/direnv.nix
            ./modules/fonts.nix
            ./modules/nh.nix

            ./modules/hyprland/hyprland.nix
            ./modules/nixvim/nixvim.nix
            # ./modules/qbittorrent.nix
            ./modules/librewolf.nix
            ./modules/zathura.nix
            ./modules/vscode.nix
            ./modules/fuzzel.nix
            ./modules/kitty.nix
            ./modules/nemo.nix
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
            nixploit.homeModules.nixploit
          ];
        };
      };
    };
}
