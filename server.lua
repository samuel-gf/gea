#!/usr/local/bin/lua
-- Server
local Socket = require("socket")
require("inc.lib_general")
local Board = require("inc.board")
local Copas = require("copas")


Board.load("001.txt")

function client_handler(socket)
  print("Cliente conectado")
  local n = 0
  while true do
    n = n + 1
	print("Envio ", n)
    Copas.send(socket, n.."\n")
	Socket.sleep(1)
  end
end


-- os.exit()
local server, err = Socket.bind("127.0.0.1", 8081)
Copas.addserver(server, client_handler)
print("Server on...")
Copas.loop()
