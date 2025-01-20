local c = require('gruvbox-baby.colors').config()

vim.opt.background = 'dark'
vim.g.gruvbox_baby_background_color = 'medium'
vim.g.gruvbox_baby_transparent_mode = true

vim.g.gruvbox_baby_highlights = {
  VertSplit = { fg = c.milk }
}

vim.api.nvim_set_hl(0, '@diff.plus',  { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, '@diff.minus', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, '@diff.delta', { link = 'DiffChange' })

vim.cmd('colorscheme gruvbox-baby')

