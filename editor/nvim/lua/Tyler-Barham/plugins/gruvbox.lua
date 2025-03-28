vim.opt.background = 'light'

require('gruvbox').setup({
  transparent_mode = true,
  italic = {
    strings = false,
  },
  invert_selection = false,
  overrides = {
    CursorLine = { bg = '#F7F5E5' },
  },
})

vim.cmd('colorscheme gruvbox')

