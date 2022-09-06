-- Board types
local Command = require("inc/commands")
local M = {}

local Cell = {
  name = "",
  x, y = 0, 0,
  mov = 1,
  light = 0
}

M.board = {
  name = "",
  img = "",
  sq = {}                 -- Squares [x][y]
}


-- Load a board from file of data
function M.load(file_name)
  local f = assert(io.open("boards/" .. file_name, "r"))
  local n = 0
  for raw in f:lines() do
    n = n + 1
    line = Command.split_command(raw)
    print_r(line)
  end
  
  f:close()
end





return M
