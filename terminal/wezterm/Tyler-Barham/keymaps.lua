local M = {}
local wezterm = require('wezterm')

function M.set_keymaps(config)
  config.keys = {
    { key = 'Backspace', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = false } },
    -- { key = 'e', mods = 'ALT', action = wezterm.action.ShowLauncherArgs { flags='LAUNCH_MENU_ITEMS' } },
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
