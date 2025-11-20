local dap = require('dap')

dap.configurations.gdscript = {
  {
    type = 'godot',
    request = 'launch',
    name = 'Launch scene',
    project = '${workspaceFolder}',
    launch_scene = true,
  }
}

dap.adapters.godot = {
  type = 'server',
  host = '127.0.0.1',
  port = 6006,
}

