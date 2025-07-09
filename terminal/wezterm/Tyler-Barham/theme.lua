local config_path = os.getenv('HOME') .. '/.config'
local file_utils = dofile(config_path .. '/common/file-utils.lua')
local wezterm = require('wezterm')

local M = {}

local theme_file = '~/.local/state/.theme'

function M.set_colors(config)
  local theme_text = file_utils.read_file(theme_file) or ''
  if theme_text == '' then
    file_utils.write_file(theme_file, 'light')
    theme_text = 'light'
  end

  if string.match(theme_text, 'light') then
    config.color_scheme = 'Gruvbox (Gogh)'
    config.colors = {
      background = '#fdf9e7',
    }
  elseif string.match(theme_text, 'dark') then
    config.color_scheme = 'Gruvbox Dark (Gogh)'
    config.colors = {
      background = 'black',
    }
  end

  config.window_background_opacity = 0.8

  -- config.window_background_image = wezterm.config_dir .. '/Tyler-Barham/assets/background.gif'
  -- config.window_background_image_hsb = {
  --   brightness = 0.05,
  --   hue = 1.0,
  --   saturation = 1.0,
  -- }
end

function M.set_font(config)
  config.font = wezterm.font_with_fallback {
    { family = 'SauceCodePro Nerd Font Propo', weight = 'Medium' },
    'JetBrains Mono',
    'Noto Color Emoji',
  }
end

function M.toggle_theme()
  local theme_text = file_utils.read_file(theme_file) or ''
  if theme_text == '' then
    file_utils.write_file(theme_file, 'light')
    theme_text = 'light'
    return
  end

  if string.match(theme_text, 'light') then
    file_utils.write_file(theme_file, 'dark')
  elseif string.match(theme_text, 'dark') then
    file_utils.write_file(theme_file, 'light')
  end
end

return M
