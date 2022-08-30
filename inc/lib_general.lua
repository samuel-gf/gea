-- Lib
function serialize(a)
	local s
	for k, v in pairs(a) do
		s = s .. "\n" .. k .. ":" .. v
	end
	return s
end


function wait(millisecond)
	socket.sleep(1)
end
