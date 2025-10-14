return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally

  -- optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",

  -- use a release tag to download pre-built binaries
  version = "1.*",

  -- @module "blink.cmp"
  -- @type blink.cmp.Config
  opts = {
    -- "default" for mappings similar to built-in completion
    -- "super-tab" for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- "enter" for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = { preset = "default" },

    appearance = {
      -- Set to "mono" for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = "mono"
    },

    -- (Default) only show the documentation popup when triggered
    completion = { documentation = { auto_show = false } },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { "lsp", 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  -- allows extending the enabled_providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}
