require('nvim-treesitter.configs').setup({
  modules = {},
  ignore_install = {},

  -- A list of parser names, or 'all' (the five listed parsers should always be installed)
  ensure_installed = { 'bash', 'c', 'cpp', 'json', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'regex', 'vim', 'vimdoc', 'yaml' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = { enable = true },

  indent = { enable = true },

  textobjects = {
    move = {
      enable = true,
      goto_next_start     = { [']f'] = '@function.outer' },
      goto_next_end       = { [']F'] = '@function.outer' },
      goto_previous_start = { ['[f'] = '@function.outer' },
      goto_previous_end   = { ['[F'] = '@function.outer' },
    },
  },

  matchup = {
    enable = true,
  },
})

require('treesitter-context').setup({
  max_lines = 1,
  trim_scope = 'inner',
  separator = '═',
})
