local FileUtils = {}

function FileUtils.read_file(path)
  local file = io.open(path, 'rb')
  if not file then return nil end
  local content = file:read '*a' -- *a or *all reads the whole file
  file:close()
  return content
end

function FileUtils.write_file(filepath, content)
  local dirpath = string.match(filepath, '(.*[/\\])')
  local cmd = 'mkdir -p '..dirpath
  local _, _ pcall(io.popen, cmd)

  local file = io.open(filepath, 'w+')
  if not file then return false end
  file:write(content)
  file:close()
  return true
end

function FileUtils.get_link_target(path)
  local cmd = 'readlink -f '..path
  local ok, resp = pcall(io.popen, cmd)

  if ok and resp then
    return string.gsub(resp:read('*a'), "%s+", "")
  else
    return ''
  end
end

function FileUtils.path_to_table(path)
  local t = {}
  for part in string.gmatch(path, '([^/\\%s]+)') do
    table.insert(t, part)
  end
  return t
end

local build_target = vim.fn.getcwd()..'/builds/current'

function FileUtils.get_buildtype()
  local paths = FileUtils.path_to_table(FileUtils.get_link_target(build_target))
  if #paths >= 2 then
    return paths[#paths-1]
  else
    return 'buildtype'
  end
end

function FileUtils.get_buildproject()
  local paths = FileUtils.path_to_table(FileUtils.get_link_target(build_target))
  if #paths >= 2 then
    return paths[#paths]
  else
    return 'project'
  end
end

return FileUtils

