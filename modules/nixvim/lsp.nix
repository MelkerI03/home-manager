{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      basedpyright = {
        enable = true;
        settings.basedpyright.analysis = {
          typeCheckingMode = "standard";
        };
      };

      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;

        settings = {
          check = {
            command = "clippy";
          };
        };
      };

      hls = {
        enable = true;
        installGhc = true;
      };
      zls.enable = true;
      clangd.enable = true;
    };
  };

  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "black" ];
        javascript = [ "prettier" ];
        nix = [ "nixfmt" ];
        c = [ "clang-format" ];
        haskell = [ "stylish-haskell" ];
        rust = [ "rustfmt" ];
      };
    };
  };

  plugins.lspsaga = {
    enable = true;
    settings = {
      use_saga_diagnostic_sign = true;
      code_action.keys = {
        quit = "<Esc>";
        exec = "<CR>";
      };
      lightbulb = {
        enable = false;
      };
    };
  };
}
