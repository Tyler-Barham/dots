local colors = require('Tyler-Barham.themes.colors')

local custom_lualine = {
  normal = {
    a = { bg = colors.black, fg = colors.neon, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.brightgreen },
    c = { bg = colors.darkgray, fg = colors.offwhite },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.darkblue, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.brightgreen },
    c = { bg = colors.darkgray, fg = colors.offwhite },
  },
  visual = {
    a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.brightgreen },
    c = { bg = colors.darkgray, fg = colors.offwhite },
  },
  replace = {
    a = { bg = colors.brightred, fg = colors.offwhite, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.brightgreen },
    c = { bg = colors.darkgray, fg = colors.offwhite },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.brightgreen },
    c = { bg = colors.darkgray, fg = colors.offwhite },
  },
  inactive = {
    a = { bg = colors.lightgray, fg = colors.offwhite, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.offwhite },
    c = { bg = colors.lightgray, fg = colors.offwhite },
  },
}

return custom_lualine

