local dap = require('dap')
local dapui = require('dapui')

-- DAP generic
vim.keymap.set('n', '<F5>',      dap.continue)
vim.keymap.set('n', '<F6>',      dap.pause)
vim.keymap.set('n', '<F7>',      dap.restart)
vim.keymap.set('n', '<F8>',      dap.terminate)
vim.keymap.set('n', '<F9>',      dapui.eval)
vim.keymap.set('n', '<F10>',     dap.step_over)
vim.keymap.set('n', '<F11>',     dap.step_into)
vim.keymap.set('n', '<F12>',     dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

-- DAP specific
vim.keymap.set('n', '<leader>dl', function() require('osv').launch({port = 8086}) end)

