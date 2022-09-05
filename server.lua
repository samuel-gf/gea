#!/usr/local/bin/lua
-- Server
Socket = require("socket")
require("inc.lib_general")
local board = require("inc.board")
local copas = require("copas")


-- local server = assert(socket.bind("localhost", 8080))
-- local ip, port = server:getsockname()
local r = {
  n = 0, 
  c1 = "Samuel", 
  c2 = "Gómez"
}

-- board.load("001.txt")

function handler(msg)
  msg = copas.wrap(msg)
  while true do
    local data = msg:receive()
    if data == "quit" then
      break
    end
	if data == nil then data = "*" end
    msg:send(data)
  end
end


-- os.exit()
local server, err = Socket.bind("127.0.0.1", 8081)
copas.addserver(server, handler)
print("Server on...")
copas.loop()
