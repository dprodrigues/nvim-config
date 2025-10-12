return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme vscode]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "typescript", "python" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",

    opts = {
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  }
}
