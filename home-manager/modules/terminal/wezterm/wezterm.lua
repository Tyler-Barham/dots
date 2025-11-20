local window = require('Tyler-Barham.window')
local theme = require('Tyler-Barham.theme')
local keymaps = require('Tyler-Barham.keymaps')
local launch_menu = require('Tyler-Barham.launch-menu')

require('Tyler-Barham.events')

local config = {}

window.set_window_config(config)
theme.set_colors(config)
theme.set_font(config)
keymaps.set_keymaps(config)
launch_menu.set_launch_menu(config)

config.audible_bell = 'Disabled'

return config
