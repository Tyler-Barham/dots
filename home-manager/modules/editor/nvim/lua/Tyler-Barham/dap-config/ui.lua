local dap = require('dap')
local dapui = require('dapui')

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open({ reset=true })
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.disconnect['dapui_config'] = function()
  dapui.close()
end

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, bg = '#932525' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, bg = '#254c93' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, bg = '#0c6d09' })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

local ucmd = vim.api.nvim_create_user_command
ucmd('DapUI',
  function(opts)
    local cmd_type = opts.fargs[1]

    if cmd_type == 'open' then
      dapui.open({ reset=true })
    elseif cmd_type == 'close' then
      dapui.close()
    end
  end,
  {
    nargs = '*',
    complete = function(_, _, _)
      return { 'open', 'close' }
    end,
  }
)
