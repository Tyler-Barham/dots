local opts = { silent = true, noremap = true }

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float',
  close_on_exit = true,
  hidden = true
})

function _G._lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set('n', '<leader>g', '<CMD>lua _lazygit_toggle()<CR>', opts)

