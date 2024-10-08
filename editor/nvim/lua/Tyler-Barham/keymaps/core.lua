local opts = { silent = true, noremap = true }

-- Reload config
vim.keymap.set('n', '<leader>s', '<CMD>source $MYVIMRC<CR>', opts)

-- Reload buffers
vim.keymap.set('n', '<F4>', '<CMD>bufdo e<CR>', opts)

-- Remove needing ctrl for window management
vim.keymap.set('n', '<leader>w', '<C-w>', opts)

-- Movement
vim.keymap.set({'n', 'v'}, '<M-v>', '<C-d>', opts)
vim.keymap.set({'n', 'v'}, '<M-b>', '<C-u>', opts)
vim.keymap.set('n', '<Del>', 'l', opts)
