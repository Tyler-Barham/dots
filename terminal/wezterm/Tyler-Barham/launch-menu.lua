local M = {}

function M.set_launch_menu(config)
  config.launch_menu = {
    {
      label = "New tab",
      args = { 'zsh' }
    },
    {
      label = "Tmux",
      args = { 'tmux', 'new', '-As0' }
    },
    {
      label = "Docker",
      args = { 'zsh', '-ic', 'wezterm cli set-tab-title "Docker"; docker-dev' }
    },
    {
      label = "SSH (desktop.lan)",
      args = { 'zsh', '-ic', 'wezterm cli set-tab-title "desktop.lan"; ssh desktop.lan; echo "\nSSH exited. Press any key..."; read -k; exec zsh' }
    },
    {
      label = "SSH (desktop.wan)",
      args = { 'zsh', '-ic', 'ssh', 'wezterm cli set-tab-title "desktop.wan"; desktop.wan; echo "\nSSH exited. Press any key..."; read -k; exec zsh' }
    },
  }
end

return M
