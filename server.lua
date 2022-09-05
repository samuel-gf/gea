-- Server
socket = require("inc.socket")
require("inc.lib_general")
local board = require("inc.board")


-- local server = assert(socket.bind(" * ", 8081))
-- local ip, port = server:getsockname()
local r = {
  n = 0, 
  c1 = "Samuel", 
  c2 = "Gómez"
}

board.load("001.txt")

os.exit()

while true do
  local client = server:accept()
  client:settimeout(10)
  local line, err = client:receive()
  if not err then 
    while true do
      r.n = r.n + 1
      client:send(serialize(r) .. "\n") 
    end
    wait(1000)
  end
end
client:close()
