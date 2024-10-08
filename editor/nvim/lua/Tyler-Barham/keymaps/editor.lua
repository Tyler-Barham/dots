local opts = { silent = true, noremap = true }

-- Terminal mode
-- vim.keymap.set('t', '<leader>q', '<C-\\><C-n>', opts)

-- Trouble
vim.keymap.set('n', '<leader>xx', '<CMD>TroubleToggle<CR>',                       opts)
vim.keymap.set('n', '<leader>xt', '<CMD>TroubleToggle telescope<CR>',             opts)
vim.keymap.set('n', '<leader>xw', '<CMD>TroubleToggle workspace_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>xd', '<CMD>TroubleToggle document_diagnostics<CR>',  opts)

-- NeoTree
-- Need different positions to show at the same time (regardless of edgy positions)
vim.keymap.set('n', '<leader>nf', '<CMD>Neotree position=left  toggle filesystem <CR>', opts)
vim.keymap.set('n', '<leader>ng', '<CMD>Neotree position=right toggle git_status <CR>', opts)
vim.keymap.set('n', '<leader>nb', '<CMD>Neotree position=right toggle buffers    <CR>', opts)

-- To update the guessed indent (don't use <leader>gi, or lazygit will delay)
vim.keymap.set('n', '<leader>i', '<CMD>GuessIndent<CR>', opts)

