local M = {}

function M.setup(lualine_theme)
  require('lualine').setup({
    options = {
      icons_enablned = true,
      -- theme = 'auto',
      theme = lualine_theme,
      component_separators = { left = '►', right = '◄'},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false, -- Will only show a single status bar
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'searchcount'},
      lualine_y = {'filetype'},
      lualine_z = {'progress', 'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'progress', 'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
      'lazy',
      'mason',
      'neo-tree',
      'nvim-dap-ui',
      'quickfix',
      'toggleterm',
      'trouble',
    }
  })
end

return M

