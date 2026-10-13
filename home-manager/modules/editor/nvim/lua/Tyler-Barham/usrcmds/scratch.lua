local ucmd = vim.api.nvim_create_user_command
local opts = { silent = true, noremap = true }

local Snacks = require('snacks')

-- Function to open a new scratch buffer with a specific filetype
local function open_scratch_buffer(filetype)
  -- Define where file will be stored
  local scratch_dir = vim.fn.expand('~/.vim/scratches/')
  local filename = scratch_dir .. 'scratch.' .. filetype
  vim.fn.mkdir(scratch_dir, 'p')

  -- Open the file
  vim.cmd('edit ' .. vim.fn.fnameescape(filename))
  -- Set the filetype for appropriate syntax highlighting
  vim.api.nvim_set_option_value('filetype', filetype, { buf = 0 })
  -- Save the file to create it on disk
  vim.api.nvim_command('write')
end

local function get_possible_filetypes()
  -- Retrieve the list of Vim syntax files from the runtime path
  local syntax_dir = vim.fn.globpath(vim.env.VIMRUNTIME, 'syntax/*.vim', false, true)
  local filetypes = {}

  -- Extract filetype names from the retrieved syntax file paths
  for _, filepath in ipairs(syntax_dir) do
    local filetype = filepath:match('syntax[/\\](.+).vim$')
    if filetype then
      -- Add the filetype to the list
      table.insert(filetypes, filetype)
    end
  end

  return filetypes
end

local function create_scratch()
  local filetypes = get_possible_filetypes()

  Snacks.picker.select(
    filetypes,
    { prompt = "Filetypes> " },
    function(selected)
      if selected then
        open_scratch_buffer(selected)
      end
    end
  )
end

ucmd('Scratch', create_scratch, {})
vim.keymap.set('n', '<leader>s', create_scratch, opts)

