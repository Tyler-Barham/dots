
local group_cursorline = vim.api.nvim_create_augroup('UserCursorLine', {})

vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter', 'BufWinEnter'}, {
  group = group_cursorline,
  callback = function()
    local ft = vim.bo.filetype
    if ft == ''
      or ft == 'dashboard'
      or ft:lower():find('telescope')
    then
      vim.opt_local.cursorline = false
    else
      vim.opt_local.cursorline = true
    end
  end,
})

vim.api.nvim_create_autocmd({'WinLeave'}, {
  group = group_cursorline,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

