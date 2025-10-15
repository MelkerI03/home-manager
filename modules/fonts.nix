{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
