require('modicator').setup({
  show_warnings = false,
})

-- Modicator can use FG or BG. We use BG(default) for all except normal mode - we want FG
local lualine_theme = require('Tyler-Barham.themes.theme-selector').get_lualine_theme()
vim.api.nvim_set_hl(0, 'NormalMode', { fg=lualine_theme.normal.a.fg })

