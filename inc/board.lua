-- Board types
local command = require("inc/commands")
local M = {}

local cell = {
	name = "",
	x, y = 0, 0,
	mov = 1,
	light = 0
}

M.board = {
	name = "",
	img = "",
	sq = {}			-- Squares [x][y]
}


-- Load a board from file of data
function M.load(file_name)
	local f = assert(io.open("boards/" .. file_name, "r"))
	local n = 0
	for raw in f:lines() do
		n = n + 1
		print ("Linea " .. n)
		line = command.split_command(raw)
	print_r(line)
	end

	f:close()
end





return M
