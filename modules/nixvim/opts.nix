{ ... }:
{
  opts = {
    number = true;
    relativenumber = true;
    signcolumn = "yes";

    clipboard = "unnamedplus";

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;

    scrolloff = 9999;

    mouse = "a";

    termguicolors = true;

    ignorecase = true;
    smartcase = true;
  };

  diagnostic.settings = {
    virtual_lines = true;
  };
}
