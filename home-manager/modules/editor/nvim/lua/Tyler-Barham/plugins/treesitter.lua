local inst_langs = {
  'bash', 'zsh',
  'c', 'cpp', 'cmake',
  'python',
  'lua', 'luadoc',
  'vim', 'vimdoc',
  'markdown', 'markdown_inline',
  'regex', 'yaml', 'json',
}

local indent_langs = {
  'bash',
  'python',
  'lua',
  'yaml', 'json',
}

-- Basic setup
require('nvim-treesitter').install(inst_langs)

require('nvim-treesitter-textobjects').setup{
  move = {
    set_jumps = true,
  }
}

require('treesitter-context').setup({
  max_lines = 1,
  trim_scope = 'inner',
  separator = '═',
  multiwindow = true,
})

-- Autocommands
local ts_group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = inst_langs,
  group = ts_group,
  callback = function()
    local ok, err = pcall(vim.treesitter.start)
    if not ok then
      vim.notify(err, vim.log.levels.WARN)
    end
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = indent_langs,
  group = ts_group,
  callback = function()
    vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
  end,
})

-- Move keymappings
vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
  require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
end, { desc = 'Next function' })
vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
  require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
end, { desc = 'End of next function' })
vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
  require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
end, { desc = 'Previous function' })
vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
  require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
end, { desc = 'End of previous function' })

