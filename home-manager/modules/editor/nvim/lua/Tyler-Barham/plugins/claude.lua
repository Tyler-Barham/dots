local Claude = require('claudecode')

Claude.setup({
  terminal_cmd = '~/.local/bin/claude',
  terminal = {
    cwd_provider = function(_)
      return vim.fn.getcwd()
    end,
    provider = 'snacks',
    snacks_win_opts = {
      position = 'float',
      width = 0.9,
      height = 0.9,
      border = 'rounded',
      keys = {
        claude_hide = { '<Esc><Esc>', function(self) self:hide() end, mode = 't', desc = 'Hide' },
      },
    },
  },
  diff_opts = {
    open_in_new_tab = true,
  },
})

vim.keymap.set('n', '<leader>ai', function() vim.cmd('ClaudeCodeFocus') end,      { noremap = true })
vim.keymap.set('n', '<leader>ar', function() vim.cmd('ClaudeCode --resume') end,  { noremap = true })
vim.keymap.set('n', '<leader>aa', function() vim.cmd('ClaudeCodeDiffAccept') end, { noremap = true })
vim.keymap.set('n', '<leader>ad', function() vim.cmd('ClaudeCodeDiffDeny') end,   { noremap = true })

local send_tree_ft = {
  ['NvimTree']    = true,
  ['neo-tree']    = true,
  ['oil']         = true,
  ['minifiles']   = true,
  ['netrw']       = true,
}

local send_key = '<leader>as'

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    -- Using the same keymap to send a file from an explorer, the current buffer, or the visual selection
    if send_tree_ft[args.match] then
      vim.keymap.set('n', send_key, function() vim.cmd('ClaudeCodeTreeAdd') end, { buffer = true })
    else
      vim.keymap.set('n', send_key, function() vim.cmd('ClaudeCodeAdd %') end,   { noremap = true })
      vim.keymap.set('v', send_key, function() vim.cmd('ClaudeCodeSend') end,    { noremap = true })
    end
  end,
})

