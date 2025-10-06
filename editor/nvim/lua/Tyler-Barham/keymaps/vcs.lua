local opts = { silent = true, noremap = true }

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

-- Mappings for vimdiff
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    if vim.wo.diff then
      -- Accept LOCAL/REMOTE for the current conflict block
      vim.keymap.set('n', '<leader>L', function() vim.cmd('/<<<<<<</,/>>>>>>>/diffget LO<CR>') end, { buffer = true })
      vim.keymap.set('n', '<leader>R', function() vim.cmd('/<<<<<<</,/>>>>>>>/diffget RE<CR>') end, { buffer = true })

      -- Navigate between conflicts
      vim.keymap.set('n', ']x', function() vim.fn.search('<<<<<<<\\|=======\\|>>>>>>>', 'W') end, { buffer = true })
      vim.keymap.set('n', '[x', function() vim.fn.search('<<<<<<<\\|=======\\|>>>>>>>', 'bW') end, { buffer = true })
    end
  end,
})

