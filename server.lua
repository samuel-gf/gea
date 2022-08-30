-- Server
socket = require("inc.socket")
require("inc.lib_general.lua")
local server = assert(socket.bind("*", 8081))
local ip, port = server:getsockname()
local r = {
	n = 0,
	c1 = "Samuel",
	c2 = "Gómez",
}




while true do
  local client = server:accept()
  client:settimeout(10)
  local line, err = client:receive()
  if not err then 
	while true do
	  r.n = r.n + 1
	  client:send(serialize(r) .. "\n") 
  	  wait(1000) end
    end
  --client:close()
end


