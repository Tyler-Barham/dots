local wezterm = require('wezterm')

wezterm.on('gui-startup', function(cmd)
  -- Show the launcher on startup (keeps current tab open)
  -- local tab, pane, window = wezterm.mux.spawn_window(cmd or {}) -- New window
  -- local gui_window = window:gui_window()
  -- gui_window:perform_action(
  --   wezterm.action.ShowLauncherArgs({ title="Launcher", flags='LAUNCH_MENU_ITEMS' }), pane
  -- )
end)

