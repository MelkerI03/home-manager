{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
        ms-python.python
      ];
      # userSettings = {
      #   "keyboard.dispatch" = "keyCode";
      # };
    };

  };
}
