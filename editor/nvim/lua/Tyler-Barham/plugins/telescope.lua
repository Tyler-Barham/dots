local telescope   = require('telescope')
local actions     = require('telescope.actions')
local builtin     = require('telescope.builtin')
local themes      = require('telescope.themes')
local actions_set = require('telescope.actions.set')
local previewers  = require("telescope.previewers")
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
    preview = {
      mime_hook = function(filepath, bufnr, opts)
        local is_image = function(filepath)
          local image_extensions = {'png', 'jpg', 'jpeg', 'webp', 'ico', 'bmp'}   -- Supported image formats
          local split_path = vim.split(filepath:lower(), '.', {plain=true})
          local extension = split_path[#split_path]
          return vim.tbl_contains(image_extensions, extension)
        end
        if is_image(filepath) then
          local term = vim.api.nvim_open_term(bufnr, {})
          local function send_output(_, data, _ )
            for _, d in ipairs(data) do
              vim.api.nvim_chan_send(term, d..'\r\n')
            end
          end
          vim.fn.jobstart(
            {
              'chafa', filepath  -- Terminal image viewer command
            },
            {on_stdout=send_output, stdout_buffered=true, pty=true})
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end
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

