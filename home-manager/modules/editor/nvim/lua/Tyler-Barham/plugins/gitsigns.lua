require('gitsigns').setup({
  signs = {
    add          = { text = '▌' },
    change       = { text = '▌' },
    delete       = { text = '▌' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  vim.api.nvim_set_hl(0, 'GitSignsAdd',    { fg='DarkCyan' }),
  vim.api.nvim_set_hl(0, 'GitSignsChange', { fg='DarkGreen' }),
  vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg='DarkRed' }),

  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- eol|overlay|right_align
    virt_text_priority = 5000, -- noice search has priority 4096. Lower to come before, higher to come after
    delay = 100,
    ignore_whitespace = false
  }
})

