{ pkgs, ... }:
{
  programs.zathura = {
    enable = true;

    package = pkgs.zathura.override {
      useMupdf = true;
    };

    options = {
      synctex = true;
      guioptions = "sv"; # show: Statusbar, vertical scroll

      selection-clipboard = "clipboard";

      page-cache-size = 1000;
      render-all = true;
      incremental-search = true;
    };
  };
}
