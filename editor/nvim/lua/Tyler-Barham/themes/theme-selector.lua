local config_path = os.getenv('HOME') .. '/.config'
local file_utils = dofile(config_path .. '/common/file-utils.lua')

local ThemeSelector = {}
local theme_file = '~/.local/state/.theme'

local function load_light()
  require('Tyler-Barham.themes.light.my-gruvbox').setup()
  local lualine_theme = require('Tyler-Barham.themes.light.lualine-colors')
  require('Tyler-Barham.themes.lualine').setup(lualine_theme)
end

local function load_dark()
  require('Tyler-Barham.themes.dark.my-gruvbox').setup()
  local lualine_theme = require('Tyler-Barham.themes.dark.lualine-colors')
  require('Tyler-Barham.themes.lualine').setup(lualine_theme)
end

function ThemeSelector.get_lualine_theme()
  local theme_text = file_utils.read_file(theme_file) or ''
  if string.match(theme_text, 'light') then
    return require('Tyler-Barham.themes.light.lualine-colors')
  elseif string.match(theme_text, 'dark') then
    return require('Tyler-Barham.themes.dark.lualine-colors')
  end
end

function ThemeSelector.init_theme()
  local theme_text = file_utils.read_file(theme_file) or ''
  if theme_text == '' then
    file_utils.write_file(theme_file, 'light')
    theme_text = 'light'
  end

  if string.match(theme_text, 'light') then
    load_light()
  elseif string.match(theme_text, 'dark') then
    load_dark()
  end
end

return ThemeSelector

