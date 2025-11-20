local M = {}

-- Many-to-many mapping of file extensions for possible matches
local filetype_map = {
  {
    { ".c", ".cpp", ".cxx", ".cc", ".cppm" },
    { ".h", ".hpp", ".hxx", ".hh" }
  },
  {
    { ".cu" },
    { ".cuh" }
  },
}

--- Swap between header and source files (many-to-many)
function M.swap_between_header_source()
  local filename = vim.fn.expand("%:t")
  local dirname = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
  local alt_filenames = {}

  -- Find all possible alternative filenames
  for _, mapping in ipairs(filetype_map) do
    local exts_a, exts_b = mapping[1], mapping[2]

    -- Source → Header
    for _, ext_a in ipairs(exts_a) do
      if filename:match(vim.pesc(ext_a) .. "$") then
        for _, ext_b in ipairs(exts_b) do
          local alt_filename = filename:gsub(vim.pesc(ext_a), ext_b)
          table.insert(alt_filenames, alt_filename)
        end
      end
    end

    -- Header → Source
    for _, ext_b in ipairs(exts_b) do
      if filename:match(vim.pesc(ext_b) .. "$") then
        for _, ext_a in ipairs(exts_a) do
          local alt_filename = filename:gsub(vim.pesc(ext_b), ext_a)
          table.insert(alt_filenames, alt_filename)
        end
      end
    end
  end

  if #alt_filenames == 0 then
    vim.notify("No mapped alternative filetype found", vim.log.levels.WARN)
    return false
  end

  -- Try to locate the first matching alternative file
  for _, alt_filename in ipairs(alt_filenames) do
    local cmd = string.format(
      'find %s . -type f -iregex ".*\\/%s" -print -quit',
      dirname,
      alt_filename
    )
    local find_res = vim.fn.systemlist(cmd)

    if #find_res > 0 and vim.fn.filereadable(find_res[1]) == 1 then
      vim.cmd("edit " .. find_res[1])
      return true
    end
  end

  vim.notify("No matching file found (" .. table.concat(alt_filenames, ", ") .. ")", vim.log.levels.WARN)
  return false
end

-- ++++++++++ Self initialize the first time this module is required ++++++++++
local module_initialized = false

local function initialize()
  if module_initialized then return end

  module_initialized = true
  vim.api.nvim_create_user_command('SwapBetweenHeaderSource', M.swap_between_header_source, {})
end

initialize()
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

return M

