local _border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

-- Turn off diagnostic text as we'll use keymaps
vim.diagnostic.config({
  virtual_text = false,
  float={border=_border}
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d',       vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d',       vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

