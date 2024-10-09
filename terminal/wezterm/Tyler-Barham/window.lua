local M = {}

function M.set_window_config(config)
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_and_split_indices_are_zero_based = true
  config.use_fancy_tab_bar = true
  config.show_new_tab_button_in_tab_bar = false

  config.window_decorations = 'NONE' --'TITLE|RESIZE'
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
end

return M
