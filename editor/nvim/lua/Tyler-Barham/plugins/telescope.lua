local telescope   = require('telescope')
local actions     = require('telescope.actions')
local builtin     = require('telescope.builtin')
local themes      = require('telescope.themes')
local actions_set = require('telescope.actions.set')
local trouble = require("trouble.sources.telescope")

---@diagnostic disable-next-line: missing-parameter
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      '^build/',
      '^builds/',
      'LanguageTranslations/',
      '.*Tests/TestFiles/',
      '.git/',
      '.svn/',
      '__pycache__/',
      '.ccls-cache/',
    },
    mappings = {
      i = {
        ['<ESC>'] = actions.close,
        ['<PageUp>'] = actions.preview_scrolling_up,
        ['<PageDown>'] = actions.preview_scrolling_down,
        ['<C-s>'] = function(p_buf) return actions_set.edit(p_buf, 'rightbelow new') end,
        ['<C-v>'] = function(p_buf) return actions_set.edit(p_buf, 'rightbelow vnew') end,
        ['<M-t>'] = trouble.open,
        ['<M-r>'] = actions.to_fuzzy_refine,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      themes.get_dropdown(),
    },
  },
  pickers = {
    lsp_implementations = {
      theme = 'dropdown',
      previewer = false,
    },
    find_files = {
      hidden = true,
    },
    grep_string = {
      additional_args = {'--hidden'},
    },
    live_grep = {
      additional_args = {'--hidden'},
    },
  },
})

telescope.load_extension('ui-select')

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=true}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fm', function() builtin.lsp_document_symbols({ symbols={ 'method', 'function' } }) end, {})
vim.keymap.set('n', '<leader>fv', builtin.git_status, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.highlights, {})

