-- local FileUtils = require('Tyler-Barham.utils.files')

local colors = {
  black        = '#202020',
  neon         = '#DFFF00',
  white        = '#FFFFFF',
  offwhite     = '#F7F5E5',
  yellowwhite  = '#DFD0AA',
  green        = '#00D700',
  purple       = '#5F005F',
  blue         = '#00DFFF',
  darkblue     = '#00005F',
  navyblue     = '#000080',
  brightgreen  = '#9CFFD3',
  gray         = '#444444',
  darkgray     = '#3c3836',
  lightgray    = '#82756a',
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
    c = { bg = colors.yellowwhite, fg = colors.darkgray },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.darkblue, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = colors.yellowwhite, fg = colors.darkgray },
  },
  visual = {
    a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = colors.yellowwhite, fg = colors.darkgray },
  },
  replace = {
    a = { bg = colors.brightred, fg = colors.offwhite, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = colors.yellowwhite, fg = colors.darkgray },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.black, fg = colors.brightgreen },
    c = { bg = colors.offwhite, fg = colors.darkgray },
  },
  inactive = {
    a = { bg = colors.lightgray, fg = colors.offwhite, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.offwhite },
    c = { bg = colors.lightgray, fg = colors.offwhite },
  },
}

require('lualine').setup({
  options = {
    icons_enablned = true,
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

