local opts = { silent = true, noremap = true }

-- Terminal mode
-- vim.keymap.set('t', '<leader>q', '<C-\\><C-n>', opts)

-- Trouble
vim.keymap.set('n', '<leader>xt', '<CMD>Trouble telescope toggle<CR>',                opts)
vim.keymap.set('n', '<leader>xx', '<CMD>Trouble diagnostics toggle<CR>',              opts)
vim.keymap.set('n', '<leader>xb', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', opts)

-- NeoTree
-- Need different positions to show at the same time (regardless of edgy positions)
vim.keymap.set('n', '<leader>nf', '<CMD>Neotree position=left  toggle filesystem <CR>', opts)
vim.keymap.set('n', '<leader>ng', '<CMD>Neotree position=right toggle git_status <CR>', opts)
vim.keymap.set('n', '<leader>nb', '<CMD>Neotree position=right toggle buffers    <CR>', opts)

-- To update the guessed indent (don't use <leader>gi, or lazygit will delay)
vim.keymap.set('n', '<leader>i', '<CMD>GuessIndent<CR>', opts)

-- Move vis selection
vim.keymap.set('v', 'H', ':<<CR>gv', opts)
vim.keymap.set('v', 'L', ':><CR>gv', opts)
vim.keymap.set('v', 'J', ':m\'>+1<CR>gv=gv', opts)
vim.keymap.set('v', 'K', ':m\'<-2<CR>gv=gv', opts)

-- Hide notification
vim.keymap.set('n', '<leader><leader>', function() require('notify').dismiss() end, opts)

