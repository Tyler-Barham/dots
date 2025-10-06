local opts = { silent = true, noremap = true }

-- Terminal mode
-- vim.keymap.set('t', '<leader>q', '<C-\\><C-n>', opts)

-- Trouble
local trouble_toggle = require('trouble').toggle
vim.keymap.set('n', '<leader>xt', function() trouble_toggle('telescope') end,                              opts)
vim.keymap.set('n', '<leader>xx', function() trouble_toggle('diagnostics') end,                            opts)
vim.keymap.set('n', '<leader>xb', function() trouble_toggle({ mode='diagnostics', filter={ buf=0 } }) end, opts)

-- NeoTree
-- Need different positions to show at the same time (regardless of edgy positions)
local neotree_cmd = require('neo-tree.command')
vim.keymap.set('n', '<leader>nf', function() neotree_cmd.execute({ toggle=true, source='filesystem', position='left'  }) end, opts)
vim.keymap.set('n', '<leader>ng', function() neotree_cmd.execute({ toggle=true, source='git_status', position='right' }) end, opts)
vim.keymap.set('n', '<leader>nb', function() neotree_cmd.execute({ toggle=true, source='buffers',    position='right' }) end, opts)

-- To update the guessed indent (don't use <leader>gi, or lazygit will delay)
vim.keymap.set('n', '<leader>i', function() require('guess-indent').set_from_buffer() end, opts)

-- Hide notification
vim.keymap.set('n', '<leader><leader>', function() require('notify').dismiss() end, opts)

