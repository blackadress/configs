local M = {}
-- see if the file exists
M.file_exists = function(file)
  local f = io.open(file, "rb")
  if f then
    f:close()
  end
  return f ~= nil
end

M.splitLine = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    t[#t + 1] = str
  end
  return t
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
M.lines_from = function(file)
  if not M.file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    local parsedLine = M.splitLine(line, "=")
    local key = parsedLine[1]
    local value = parsedLine[2]
    lines[key] = value
  end
  return lines
end

M.split_str = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

M.VARS = require("vars")

local RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

M.reload_plugin = function(name)
  RELOAD(name)
  return require(name)
end

return M
