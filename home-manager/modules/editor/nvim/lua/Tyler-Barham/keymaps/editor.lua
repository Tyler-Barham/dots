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

local function tmux_popup(w, h)
  local pwd = vim.fn.getcwd()
  local session_name = "popup-" .. vim.fn.fnamemodify(pwd, ":t")

  require('snacks').terminal.toggle('tmux new -A -s ' .. session_name, {
    cwd = pwd,
    win = {
      style = 'terminal',
      relative = 'editor',
      position = 'float',
      width = w,
      height = h,
      border = 'rounded',
      title = session_name,
      title_pos = 'left'
    },
  })
end

vim.keymap.set('n', '<C-t>', function() tmux_popup(0.9, 0.9) end, { desc = 'Toggle tmux session based on cwd' })

