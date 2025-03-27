vim.opt.background = 'light'

require('gruvbox').setup({
  transparent_mode = true,
  italic = {
    strings = false,
  },
  invert_selection = false,
})

vim.cmd('colorscheme gruvbox')

