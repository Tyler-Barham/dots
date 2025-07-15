local M = {}
local wezterm = require('wezterm')
local theme = require('Tyler-Barham.theme')

local toggle_theme_action = wezterm.action_callback(
  function(window, pane)
    -- Toggles the theme we'll load
    theme.toggle_theme()

    -- Reload to pull new theme
    window:perform_action(wezterm.action.ReloadConfiguration, pane)
  end
)

function M.set_keymaps(config)
  config.keys = {
    { key = 'Backspace',  mods = 'ALT',         action = wezterm.action.CloseCurrentPane { confirm = false } },
    { key = 'w',          mods = 'SUPER',       action = wezterm.action.DisableDefaultAssignment },
    { key = 't',          mods = 'CTRL',        action = toggle_theme_action},
    { key = 'a',          mods = 'ALT',         action = wezterm.action.ShowLauncherArgs { flags='LAUNCH_MENU_ITEMS' } },
    { key = 'p',          mods = 'ALT',         action = wezterm.action.ShowTabNavigator },
    { key = ';',          mods = 'ALT',         action = wezterm.action.CloseCurrentTab { confirm = false } },
    -- { key = ',', mods = 'ALT', action = wezterm.action.PromptInputLine {
    --   description = "Rename tab",
    --   action = wezterm.action_callback(function(window, pane, line)
    --     if line then
    --       window:active_tab():set_title(line)
    --     end
    --   end) }
    -- },
    -- { key = 't', mods = 'ALT', action = wezterm.action.PromptInputLine {
    --   description = "Goto tab",
    --   action = wezterm.action_callback(function(window, pane, line)
    --     if line then
    --       window:perform_action(wezterm.action.ActivateTab(tonumber(line)), pane)
    --     end
    --   end) }
    -- },
  }
end

return M
