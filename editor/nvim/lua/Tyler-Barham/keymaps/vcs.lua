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
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local conflict_marker = '<<<<<<<\\|=======\\|>>>>>>>'
    local has_conflict = vim.fn.search(conflict_marker, 'nw') ~= 0
    if has_conflict then
      -- Accept LOCAL/REMOTE for the current conflict block
      vim.keymap.set('n', '<leader>L', function() vim.cmd('/<<<<<<</,/>>>>>>>/diffget LO') end, { buffer = true })
      vim.keymap.set('n', '<leader>R', function() vim.cmd('/<<<<<<</,/>>>>>>>/diffget RE') end, { buffer = true })

      -- Navigate between conflicts
      vim.keymap.set('n', ']x', function() vim.fn.search(conflict_marker, 'W') end, { buffer = true })
      vim.keymap.set('n', '[x', function() vim.fn.search(conflict_marker, 'bW') end, { buffer = true })
    end
  end,
})

