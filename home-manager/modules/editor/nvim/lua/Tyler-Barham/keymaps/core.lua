local opts = { silent = true, noremap = true }

-- Reload config
vim.keymap.set('n', '<leader>s', function() vim.cmd('source $MYVIMRC') end, opts)

-- Reload buffers
vim.keymap.set('n', '<F4>', function() vim.cmd('bufdo e') end, opts)

-- Remove needing ctrl for window management
vim.keymap.set('n', '<leader>w', '<C-w>', opts)

-- Movement
vim.keymap.set({'n', 'v'}, '<M-v>', '<C-d>zz', opts)
vim.keymap.set({'n', 'v'}, '<M-b>', '<C-u>zz', opts)
vim.keymap.set('n', '<Del>', 'l', opts)

-- Move vis selection
vim.keymap.set('v', 'H', ':<<CR>gv', opts)
vim.keymap.set('v', 'L', ':><CR>gv', opts)
vim.keymap.set('v', 'J', ':m\'>+1<CR>gv=gv', opts)
vim.keymap.set('v', 'K', ':m\'<-2<CR>gv=gv', opts)

