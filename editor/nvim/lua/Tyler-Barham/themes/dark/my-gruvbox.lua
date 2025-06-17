local colors = require('Tyler-Barham.themes.colors')

local M = {}

function M.setup()
  vim.opt.background = 'dark'

  require('gruvbox').setup({
    transparent_mode = true,
    italic = {
      strings = false,
    },
    invert_selection = false,
    overrides = {
      CursorLine = { bg = colors.darkgray },
    },
  })

  vim.cmd('colorscheme gruvbox')
end

return M

