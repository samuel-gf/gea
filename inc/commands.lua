local M = {}

-- Each line of a command
local Line = {
  command = "",    -- command at left of :
  parameters = {}, -- List of parameters at right of :
  raw = line_raw,  -- raw text from data file
}

-- INVESTIGANDO
-- https://www.lua.org/pil/13.1.html
function Line:clone()
  local cloned_line = {}
  for k, v in pairs(self) do
    cloned_line[k] = v
  end
end

-- Input: Raw line 
function M.split_command (line_raw)
  local line = Line.clone()
  line.raw = line_raw
  local pos = line.raw:find(":")
  line.command = trim(line.raw:sub(1, pos -1 ))
  local pos2 = line.raw:find(", ", pos + 1)
  while pos2 ~= nil do
    table.insert(line.parameters, trim(line.raw:sub(pos + 1, pos2-1)))
    pos = pos2
    pos2 = line.raw:find(", ", pos + 1)
    if pos2 == nil then    -- Last parameter
      table.insert(line.parameters, line.raw:sub(pos + 1) )
    end
  end
  return line
end

return M
