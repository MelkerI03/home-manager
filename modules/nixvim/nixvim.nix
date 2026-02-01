{ ... }:
{
  programs.nixvim = {
    enable = true;

    imports = [
      ./lsp.nix
      ./keymaps.nix
      ./opts.nix
    ];

    colorscheme = "monokai-pro";
    colorschemes.monokai-pro.enable = true;

    plugins = {
      web-devicons.enable = true; # Nerd Font additions
      nvim-autopairs.enable = true; # Autopairing
      tmux-navigator.enable = true; # Nice tmux bind integration
      telescope.enable = true; # Fuzzyfinder
      treesitter.enable = true; # Basic linting
      oil.enable = true; # File manager
      lualine.enable = true; # Bottom status line
      which-key.enable = true; # Displays which keys are mapped
      bufferline.enable = true; # Displays open buffers
      lsp-lines.enable = true; # Inline LSP diagnostics
      comment.enable = true; # Smart comments
      sleuth.enable = true; # Smart shiftwidth

      # Suggestions & more
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };

      luasnip.enable = true;
      markdown-preview.enable = true;
    };

    clipboard.register = "unnamedplus";
  };
}
