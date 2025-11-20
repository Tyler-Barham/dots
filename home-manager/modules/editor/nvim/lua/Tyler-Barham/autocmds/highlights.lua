
local group_cursorline = vim.api.nvim_create_augroup('UserCursorLine', {})

vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter', 'BufWinEnter'}, {
  group = group_cursorline,
  callback = function()
    if vim.bo.filetype == '' or string.find(string.lower(vim.bo.filetype), 'telescope')then
      vim.cmd('setlocal nocursorline')
    else
      vim.cmd('setlocal cursorline')
    end
  end,
})

vim.api.nvim_create_autocmd({'WinLeave'}, {
  group = group_cursorline,
  callback = function()
    vim.cmd('setlocal nocursorline')
  end,
})

