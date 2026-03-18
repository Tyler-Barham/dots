local AutoSession = require('auto-session')

AutoSession.setup({
  auto_restore = false,

  suppressed_dirs = { "~/" },
  bypass_save_filetypes = { "dashboard" },

  session_lens = {
    load_on_setup = true,
  },

  pre_save_cmds    = {
    'lua require([[neo-tree]]).close_all()',
    'lua require([[trouble]]).close()',
  },
})

vim.keymap.set('n', '<leader>fs', AutoSession.search, { noremap = true })

