local dap = require('dap')
local FileUtils = require('Tyler-Barham.utils.files')

-- dap.adapters.gdb = {
--   id = 'gdb',
--   type = 'executable',
--   command = '/usr/local/bin/gdb',
--   args = { '-i', 'dap' },
-- }

-- dap.adapters.codelldb = {
--   id = 'codelldb',
--   type = 'server',
--   port = '13000',
--   executable = {
--     command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
--     args = {
--       '--port', '13000',
--     },
--   }
-- }

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
  command = os.getenv('HOME') .. '/.local/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = 'Launch locally',
    type = 'cppdbg',
    request = 'launch',
    program = function()
      local exe = FileUtils.get_link_target(vim.fn.getcwd()..'/builds/current/Engine')
      return exe
    end,
    cwd = function()
      local dir = FileUtils.get_link_target(vim.fn.getcwd()..'/builds/current/')
      return dir
    end,
    stopAtEntry = false,
    args = function()
      local args = {}
      local inputargs = vim.fn.input("Args:")
      for str in string.gmatch(inputargs, '[^%s]+') do
        table.insert(args, str)
      end
      return args
    end,
    MIMode = 'gdb',
    miDebuggerPath = '/usr/bin/gdb',
    setupCommands = {
      -- pretty printing slows us down... 10s per step
      {
        description = 'Enable pretty-printing for gdb',
        text = '-enable-pretty-printing',
        ignoreFailures = true,
      },
    },
  },
  {
    name = 'Attach to gdbserver',
    type = 'cppdbg',
    request = 'launch',
    program = function()
      local exe = FileUtils.get_link_target(vim.fn.getcwd()..'/builds/current/Engine')
      return exe
    end,
    cwd = function()
      local dir = FileUtils.get_link_target(vim.fn.getcwd()..'/builds/current/')
      return dir
    end,
    MIMode = 'gdb',
    miDebuggerPath = 'gdb',
    miDebuggerServerAddress = 'localhost:4444',
    setupCommands = {
      -- pretty printing slows us down... 10s per step
      {
        description = 'Enable pretty-printing for gdb',
        text = '-enable-pretty-printing',
        ignoreFailures = true,
      },
    },
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.qmake = dap.configurations.cpp

