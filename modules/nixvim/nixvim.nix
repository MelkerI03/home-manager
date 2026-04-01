{ pkgs, ... }:
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
      treesitter-context.enable = true; # Show function at top
      oil.enable = true; # File manager
      lualine.enable = true; # Bottom status line
      which-key.enable = true; # Displays which keys are mapped
      bufferline.enable = true; # Displays open buffers
      lsp-lines.enable = true; # Inline LSP diagnostics
      comment.enable = true; # Smart comments
      sleuth.enable = true; # Smart shiftwidth
      vimtex = {
        enable = true;
        texlivePackage = pkgs.texlive.combined.scheme-full;
        settings = {
          view_method = "zathura_simple";
          compiler_latexmk = {
            out_dir = "build";
            options = [
              "-pdf"
              "-interaction=nonstopmode"
              "-synctex=1"
            ];
          };

          quickfix_mode = 0;
        };
      };
      cmp-vimtex.enable = true;
      friendly-snippets.enable = true;

      # Suggestions & more
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "vimtex"; }
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];

          mapping = {
            "<Tab>" = ''
              function(fallback)
                if require("cmp").visible() then
                  require("cmp").select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  require("luasnip").expand_or_jump()
                else
                  fallback()
                end
              end
            '';

            "<S-Tab>" = ''
              function(fallback)
                if require("cmp").visible() then
                  require("cmp").select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  require("luasnip").jump(-1)
                else
                  fallback()
                end
              end
            '';

            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };

      luasnip.enable = true; # Snippet provider
      markdown-preview.enable = true; # Markdown compiler
    };
  };
}
