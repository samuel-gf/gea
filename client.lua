#!/usr/local/bin/lua
local host, port = "127.0.0.1", 8081
local Socket = require("socket")
local copas = require("copas")

local s = Socket.connect(host, port)
s:settimeout(0)

copas.addthread(function()
	while true do
		print("Recibiendo...")
		local resp = copas.receive(s, 6)
		print("received:", resp or "nil")
		if resp and resp:sub(1,4) == "quit" then
		  s:close()
		  break
		end
	end
end)

copas.loop()
