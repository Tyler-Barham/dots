local colors = require('Tyler-Barham.themes.colors')

local M = {}

function M.setup()
  vim.opt.background = 'light'

  require('gruvbox').setup({
    transparent_mode = true,
    italic = {
      strings = false,
    },
    invert_selection = false,
    overrides = {
      CursorLine = { bg = colors.offwhite },
    },
  })

  vim.cmd('colorscheme gruvbox')
end

return M

