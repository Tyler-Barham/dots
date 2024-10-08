local FileUtils = require('Tyler-Barham.utils.files')

local colors = {
  black        = '#202020',
  neon         = '#DFFF00',
  white        = '#FFFFFF',
  offwhite     = '#E7D7AD',
  green        = '#00D700',
  purple       = '#5F005F',
  blue         = '#00DFFF',
  darkblue     = '#00005F',
  navyblue     = '#000080',
  brightgreen  = '#9CFFD3',
  gray         = '#444444',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
  orange       = '#FFAF00',
  red          = '#5F0000',
  brightorange = '#C08A20',
  brightred    = '#AF0000',
  cyan         = '#00DFFF',
}
local custom_lualine = {
  normal = {
    a = { bg = colors.neon, fg = colors.black, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = nil, fg = colors.offwhite },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.darkblue, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = nil, fg = colors.offwhite },
  },
  visual = {
    a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = nil, fg = colors.offwhite },
  },
  replace = {
    a = { bg = colors.brightred, fg = colors.offwhite, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = nil, fg = colors.offwhite },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = nil, fg = colors.offwhite },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.gray },
    c = { bg = colors.lightgray, fg = colors.offwhite },
  },
}

require('lualine').setup({
  options = {
    icons_enabled = true,
    -- theme = 'auto',
    theme = custom_lualine,
    component_separators = { left = '►', right = '◄'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true, -- Will only show a single status bar, but adds horiz borders to windows
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {FileUtils.get_buildproject, FileUtils.get_buildtype},
    lualine_y = {'filetype'},
    lualine_z = {'progress', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
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

