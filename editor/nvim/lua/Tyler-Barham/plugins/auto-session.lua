local AutoSession = require('auto-session')

AutoSession.setup({
  pre_save_cmds    = {
    'lua require([[neo-tree]]).close_all()',
    'lua require([[trouble]]).close()',
  },
  session_lens = {
    load_on_setup = true
  }
})

vim.keymap.set('n', '<leader>fs', AutoSession.search, { noremap = true })

