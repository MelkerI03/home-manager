{ ... }:
{
  programs.zathura = {
    enable = true;

    options = {
      synctex = true;
      guioptions = "sv"; # show: Statusbar, vertical scroll
    };
  };
}
