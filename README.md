# home-manager — personal flake (MelkerI03)

This repository is a home-manager flake containing the personal user configuration for the user "viking". It is designed to be used on x86_64 Linux systems and is pinned to NixOS/nixpkgs: nixos-unstable via the flake inputs.

Quick facts
- Flake-enabled home-manager configuration
- Canonical branch: `master`
- Implemented user: `viking` (home.username = "viking")
- Nixpkgs: `nixos-unstable`
- Target system(s): `x86_64-linux`
- Major components: Hyprland (Wayland), hyprpaper, hyprlock, waybar, kitty, zsh/oh-my-zsh, nixvim, VS Code support, rofi, tmux, many CLI/dev packages
- Extra inputs: `nixvim`, `nixploit` (see flake.nix)

What this flake includes
- flake.nix which composes:
  - modules/home-base.nix (user and basic XDG setup)
  - modules/nh.nix (nh support)
  - modules/fonts.nix
  - modules/direnv.nix
  - Hyprland stack: modules/hyprland/* (hyprland, hyprpaper, hyprlock, waybar)
  - Terminal: kitty (modules/kitty.nix)
  - Shell: zsh + oh-my-zsh (modules/zsh.nix)
  - Editor integration: nixvim (modules/nixvim/nixvim.nix)
  - VS Code config (modules/vscode.nix)
  - rofi, tmux, git, ssh, direnv, many CLI tools
  - package groups: modules/packages/{productivity,development,misc,QoL}.nix
  - Extra home modules from inputs: nixvim.homeModules.nixvim, nixploit.homeModules.nixploit

- Note: SSH keys are not managed by this repo; place your keys in `~/.ssh` as usual.

Prerequisites
- A Linux machine (x86_64). This README covers:
  - activation on a freshly installed NixOS machine (user-level activation via home-manager flake)
  - activation on a non-NixOS Linux machine (single-user or multi-user Nix install)
- Nix installed
- Flakes support enabled (see below)
- The repo should be cloned locally (see commands)
- Ensure `~/.ssh` contains your SSH keys if you want SSH-based flows (keys are not auto-created)

Enable flakes (required)
- Recommended: enable flakes globally on the machine.
  - For multi-user Nix (system-wide) or for NixOS machines, add to `/etc/nix/nix.conf`:
    ```
    experimental-features = nix-command flakes
    ```
  - For single-user installs, create or edit `~/.config/nix/nix.conf` and add:
    ```
    experimental-features = nix-command flakes
    ```
- If you cannot enable flakes permanently, use the `--extra-experimental-features 'nix-command flakes'` flag on `nix` invocations shown below.

Note about Nix installation
- NixOS: Nix is already installed. Ensure flakes are enabled as above.
- Non-NixOS (Linux): If Nix is not installed, install it with:
  ```
  sh <(curl -L https://nixos.org/nix/install)
  ```
  After installing, enable flakes as described above (either globally or in the user config path).

Quickstart — clone the repo
```
git clone --branch master https://github.com/MelkerI03/home-manager.git ~/.config/home-manager
cd ~/.config/home-manager
```

Activate on a freshly installed NixOS machine (user-level)
1. Ensure flakes enabled in `/etc/nix/nix.conf`:
   - Add the line:
     ```
     experimental-features = nix-command flakes
     ```
2. As the user `viking` (or change ownership/paths if you use another username), clone the repo (see above) into the user's home.
3. From the repository root run (preferred):
   ```
   # from ~/.config/home-manager
   nix run --extra-experimental-features 'nix-command flakes' github:nix-community/home-manager -- switch --flake .#viking
   ```
   - If flakes are enabled globally you can omit `--extra-experimental-features`:
   ```
   nix run github:nix-community/home-manager -- switch --flake .#viking
   ```
   - Alternatively (flake build activation):
   ```
   nix build --extra-experimental-features 'nix-command flakes' .#homeConfigurations.viking.activationPackage
   ./result/activate
   ```
4. After activation:
   - The user's dotfiles and services configured via home-manager should be established.
   - If you use Hyprland, ensure proper GPU drivers and permissions are set (NVIDIA/AMD vs Intel details are outside this README).

Activate on a non-NixOS Linux machine (single-user or multi-user)
1. Install Nix (if necessary) and enable flakes (see previous sections).
2. Clone this repo as your local user:
   ```
   git clone --branch master https://github.com/MelkerI03/home-manager.git ~/.config/home-manager
   cd ~/.config/home-manager
   ```
3. Run home-manager via the flake (this downloads and runs the home-manager flake, then applies the `viking` configuration):
   ```
   nix run --extra-experimental-features 'nix-command flakes' github:nix-community/home-manager -- switch --flake .#viking
   ```
   - If flakes are enabled in your nix.conf, omit the extra-features flag:
   ```
   nix run github:nix-community/home-manager -- switch --flake .#viking
   ```
4. Alternative (build activation):
   ```
   nix build --extra-experimental-features 'nix-command flakes' .#homeConfigurations.viking.activationPackage
   ./result/activate
   ```
5. If you installed Nix in single-user mode and encounter permission issues, follow the Nix installer guidance or consider reinstalling in multi-user mode if needed.

Rolling back
- List home-manager generations:
  ```
  home-manager generations
  ```
- To switch to a previous generation (replace <N> with the generation number from the list):
  ```
  home-manager switch --generation <N>
  ```
- You can also inspect `/nix/var/nix/profiles/per-user/viking/profile` and use standard Nix profile tooling to inspect/rollback, but the `home-manager` CLI is the simplest.

Troubleshooting notes
- If flakes are not enabled, using `nix run` with `--extra-experimental-features 'nix-command flakes'` works as a one-off.
- If `home-manager` commands fail because the CLI is not installed, the `nix run github:nix-community/home-manager -- switch --flake .#viking` approach avoids a separate install: the flake will be downloaded and executed.
- If Wayland/Hyprland does not start:
  - Ensure GPU drivers for your hardware are installed on the host (NixOS or system packages).
  - Check logs (journalctl --user -b) and `~/.local/state/hyprland` or service outputs.
- If something fails after pulling new config: check `home-manager generations` and roll back to a previous working generation.

Files of interest in this repository
- flake.nix — flake root and the `viking` homeConfiguration
- modules/home-base.nix — base settings (username, home directory, xdg)
- modules/hyprland/* — Hyprland + waybar + related configs
- modules/kitty.nix — kitty terminal config
- modules/zsh.nix — zsh + oh-my-zsh configuration
- modules/nixvim/nixvim.nix — nixvim integration
- modules/packages/* — grouped package lists (development, productivity, QoL, misc)
- modules/nh.nix — `nh` program configuration

Security & secrets
- This repo does not manage private SSH keys — ensure your `~/.ssh` is present and has the keys you need.
- Do not commit private secrets to the repo. If you need to include secrets in Nix-managed state, use a secure secret manager or encrypted local-only files.
