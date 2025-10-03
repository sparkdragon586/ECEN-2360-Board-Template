{pkgs, ... }: {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  opts = {
    number = true;
    mouse = "a";
    showmode = false;
    breakindent = true;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    list = true;
    listchars = { tab = "» "; trail = "·"; nbsp = "␣"; };
    inccommand = "split";
    cursorline = true;
    scrolloff = 10;
  };
  colorschemes.gruvbox.enable = true;
  plugins = {
    which-key.enable = true;
    todo-comments.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers.clangd = {
        enable = true;
        # cmd = ["clangd" "--query"]; TODO: figure out how to specify correct path if needed
        rootMarkers = ["compile_commands.json" ".clangd"];
      };
    };
    cmp = {
      enable = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
      ];
      settings.mapping = {
        "<C-Space>" = "cmp.mapping.complete()"; # complete even without menu
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
        "<C-y>" = "cmp.mapping.confirm({ select = true })";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
      };
    };
    gitsigns.enable = true;
    fugitive.enable = true;
    sleuth.enable = true;
    telescope = {
      enable = true;
      keymaps = {
        "<leader>/" = "current_buffer_fuzzy_find";
        "<leader>ss" = "builtin";
      };
    };
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        asm
        c
        make
        ini
      ];

      settings = {
        auto_install = false;
        highlight.enable = true;
        indent.enable = true;
      };
    };
    mini = {
      enable = true;
    };
    mini-ai = {
      enable = true;
    };
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
    mini-pairs = {
      enable = true;
    };
    mini-statusline = {
      enable = true;
    };

  };
}
