local Snacks = require('snacks')

Snacks.setup({
  notifier = { enabled = true },
})

local opts = { silent = true, noremap = true }

vim.keymap.set('n', '<leader>g', Snacks.lazygit.open, opts)
