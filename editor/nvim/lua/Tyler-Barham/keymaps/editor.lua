local opts = { silent = true, noremap = true }

-- Terminal mode
-- vim.keymap.set('t', '<leader>q', '<C-\\><C-n>', opts)

-- Trouble
vim.keymap.set('n', '<leader>xt', '<CMD>Trouble telescope toggle<CR>',                opts)
vim.keymap.set('n', '<leader>xx', '<CMD>Trouble diagnostics toggle<CR>',              opts)
vim.keymap.set('n', '<leader>xb', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', opts)

-- NeoTree
-- Need different positions to show at the same time (regardless of edgy positions)
vim.keymap.set('n', '<leader>nf', '<CMD>Neotree position=left  toggle filesystem <CR>', opts)
vim.keymap.set('n', '<leader>ng', '<CMD>Neotree position=right toggle git_status <CR>', opts)
vim.keymap.set('n', '<leader>nb', '<CMD>Neotree position=right toggle buffers    <CR>', opts)

-- To update the guessed indent (don't use <leader>gi, or lazygit will delay)
vim.keymap.set('n', '<leader>i', '<CMD>GuessIndent<CR>', opts)

-- Move vis selection
vim.keymap.set('v', 'H', ':<<CR>gv', opts)
vim.keymap.set('v', 'L', ':><CR>gv', opts)
vim.keymap.set('v', 'J', ':m\'>+1<CR>gv=gv', opts)
vim.keymap.set('v', 'K', ':m\'<-2<CR>gv=gv', opts)

-- Hide notification
vim.keymap.set('n', '<leader><leader>', function() require('notify').dismiss() end, opts)

-- View diff of HEAD and current lines last commit
local function diffthis_linelastchange()
  local cache = require('gitsigns.cache').cache
  local winid = vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local lnum = vim.api.nvim_win_get_cursor(winid)[1]
  local bcache = cache[bufnr]

  if not bcache or not bcache.git_obj.object_name then
    vim.notify('Cannot diff this line due to cache.', vim.log.levels.ERROR)
    return
  end
  local blame_info = bcache:get_blame(lnum)
  if not blame_info then
    vim.notify('Cannot diff this line due to blame.', vim.log.levels.ERROR)
    return
  end
  local commit = blame_info.commit.sha
  local gitsigns = require('gitsigns')
  gitsigns.diffthis(commit)
end

vim.keymap.set('n', '<leader>hd', diffthis_linelastchange, opts)

