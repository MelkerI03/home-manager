{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
      rofi-bluetooth
      rofi-power-menu
      rofi-screenshot
      rofi-network-manager
      rofi-file-browser
    ];

    extraConfig = {
      modi = "combi,drun,calc";
      show-icons = true;
      show-modi = false;
      icon-theme = "Papirus";
      display-drun = "Apps";
      display-combi = "> ";
      display-calc = "Calc ";
      drun-display-format = "{icon}  {name} ";
      combi-hide-mode-prefix = true;
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = true;
    };
  };
}
