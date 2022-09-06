#!/usr/local/bin/lua


-- Client
local Socket = require("socket")
local Copas = require("copas")

local socket = Socket.connect("127.0.0.1", 8081)
socket:settimeout(0)

Copas.addthread(function()
	print("Conectado al servidor")
	while true do
		local line = Copas.receive(socket, "*l") or "nil"
		print("Recibido: " .. line)
	end
end)

Copas.loop()
