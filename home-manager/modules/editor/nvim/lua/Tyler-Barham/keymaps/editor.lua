local opts = { silent = true, noremap = true }

-- Terminal mode
-- vim.keymap.set('t', '<leader>q', '<C-\\><C-n>', opts)

-- Trouble
local trouble_toggle = require('trouble').toggle
vim.keymap.set('n', '<leader>xs', function() trouble_toggle('snacks') end,                              opts)
vim.keymap.set('n', '<leader>xx', function() trouble_toggle('diagnostics') end,                            opts)
vim.keymap.set('n', '<leader>xb', function() trouble_toggle({ mode='diagnostics', filter={ buf=0 } }) end, opts)

-- To update the guessed indent (don't use <leader>gi, or lazygit will delay)
vim.keymap.set('n', '<leader>i', function() require('guess-indent').set_from_buffer() end, opts)

