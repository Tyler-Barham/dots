local M = {}
local wezterm = require('wezterm')

function M.set_colors(config)
  config.color_scheme = 'Gruvbox Dark (Gogh)'
  config.colors = {
    background = 'black',
  }
  config.window_background_opacity = 0.9
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

return M
