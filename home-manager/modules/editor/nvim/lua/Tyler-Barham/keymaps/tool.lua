local opts = { silent = true, noremap = true }

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float',
  close_on_exit = true,
  hidden = true
})

local function lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set('n', '<leader>g', lazygit_toggle, opts)

