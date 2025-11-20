local grug_far = require('grug-far')

grug_far.setup({
  engine = 'ripgrep',
  replacementInterpreter = 'default',
  windowCreationCommand = 'vsplit',
  transient = true,
  keymaps = {
    replace = { n = '<localleader>r' },
    syncLocations = { n = '<localleader>s' },
    syncLine = { n = '<localleader>l' },
    close = { n = '<localleader>q' },
    historyOpen = { n = '<localleader>t' },
    historyAdd = { n = '<localleader>a' },
    refresh = { n = '<localleader>f' },
    openLocation = { n = '<S-Enter>' },
    openNextLocation = { n = 'j' },
    openPrevLocation = { n = 'k' },
    gotoLocation = { n = '<Enter>' },
    pickHistoryEntry = { n = '<Enter>' },
    abort = { n = '<Esc>' },
    help = { n = '?' },
    toggleShowCommand = { n = '<localleader>c' },
    swapEngine = { n = '' },
    previewLocation = { n = '<localleader>p' },
    swapReplacementInterpreter = { n = '' },
    applyNext = { n = '<localleader>j' },
    applyPrev = { n = '<localleader>k' },
  },
});

local opts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>fr', function() grug_far.open() end, opts)
vim.keymap.set('n', '<leader>fR', function() grug_far.open({ prefills = { paths = vim.fn.expand('%') } }) end, opts)
vim.keymap.set('v', '<leader>fr', function() grug_far.with_visual_selection() end, opts)

local jump_to_search = function()
  vim.api.nvim_win_set_cursor(vim.fn.bufwinid(0), { 2, 0 })
end

local jump_to_results = function()
  local esc_key = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc_key, 'i', false)
  vim.api.nvim_win_set_cursor(vim.fn.bufwinid(0), { 9, 0 })
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('grug-far-keymap', { clear = true }),
  pattern = { 'grug-far' },
  callback = function()
    vim.keymap.set('n', '<Left>',     jump_to_search,   { buffer = true })
    vim.keymap.set('n', 'h',          jump_to_search,   { buffer = true })

    vim.keymap.set('i', '<Enter>',    jump_to_results,  { buffer = true })
    vim.keymap.set('n', '<Right>',    jump_to_results,  { buffer = true })
    vim.keymap.set('n', 'l',          jump_to_results,  { buffer = true })

    vim.keymap.set('i', '<Tab>',      '<Down>',         { buffer = true })
    vim.keymap.set('i', '<S-Tab>',    '<Up>',           { buffer = true })
  end,
})

