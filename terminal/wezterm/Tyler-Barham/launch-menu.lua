local M = {}

function M.set_launch_menu(config)
  config.launch_menu = {
    {
      label = "WSL",
      args = { 'wsl.exe', '-e', 'tmux', 'new', '-As0' }
    },
    {
      label = "Powershell",
      args = { 'powershell.exe' }
    },
    {
      label = "SSH (desktop)",
      args = { 'ssh.exe', '-Y', 'desktop' }
    },
    {
      label = "SSH (wsl)",
      args = { 'ssh.exe', '-Y', 'wsl' }
    },
  }
end

return M
