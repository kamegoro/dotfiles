return {
  'neovim/nvim-lspconfig',  -- LSPプラグイン
  config = function()
    require('lspconfig').tsserver.setup {}

    local cmp = require('cmp')
    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
      }
    }

    vim.o.updatetime = 250
    vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
  end
}

