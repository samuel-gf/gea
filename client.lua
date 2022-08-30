-- Client socket
require("lib")
local host, port = "localhost", 8081
local socket = require("inc.socket")
local tcp = assert(socket.tcp())

tcp:connect(host, port);
tcp:send("hello world\n");

while true do
    local s, status, partial = tcp:receive()
    print(s or partial)
    if status == "closed" then 
		break 
	end
end
tcp:close()