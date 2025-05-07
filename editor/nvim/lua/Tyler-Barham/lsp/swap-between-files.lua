local M = {}

-- Mapping of file extensions to their alternative counterparts
local filetype_map = {
  ['.cpp'] = '.h',
  ['.h'] = '.cpp',
  ['.cu'] = '.cuh',
  ['.cuh'] = '.cu',
}

function M.swap_between_header_source()
  local filename = vim.fn.expand("%:t")
  local dirname = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
  local alt_filename = nil

  for ext_a, ext_b in pairs(filetype_map) do
    if filename:match(vim.pesc(ext_a) .. "$") then
      alt_filename = filename:gsub(vim.pesc(ext_a), ext_b)
      break
    end
  end

  if not alt_filename then
    vim.notify("No mapped alternative filetype found", vim.log.levels.WARN)
    return false
  end

  local cmd = string.format('find %s . -type f -iregex ".*\\/%s" -print -quit', dirname, alt_filename)
  local find_res = vim.fn.systemlist(cmd)

  if #find_res > 0 and vim.fn.filereadable(find_res[1]) == 1 then
    vim.cmd("edit " .. find_res[1])
    return true
  else
    vim.notify("No matching file found: " .. alt_filename, vim.log.levels.WARN)
    return false
  end
end

return M

