-- Turn off diagnostic text as we'll use keymaps
vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = 'rounded',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰌵 ",
    },
  },
  severity_sort = true,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d',       function() vim.diagnostic.jump({count=-1, float=true}) end)
vim.keymap.set('n', ']d',       function() vim.diagnostic.jump({count=1, float=true}) end)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

