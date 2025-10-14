return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "typescript",
        "python",
        "rust",
        "go",
        "html",
        "javascript",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
