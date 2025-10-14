return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    local languages = {
      'lua_ls',
      'ts_ls',
      'pyright',
      'vimls',
      'jsonls',
      'html',
      'cssls',
      'dockerls',
      'graphql',
      'rust_analyzer',
      'sqlls',
      'ast_grep'
    }

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = languages,
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    for i = 1, #languages do
      vim.lsp.config(languages[i], { capabilities = capabilities })
    end

    -- Keymaps for LSP
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, 'Goto Definition')
        map('gr', vim.lsp.buf.references, 'Goto References')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
      end,
    })
  end,
}
