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

-- A function in Lua similar to PHP's print_r, from http://luanet.net/lua/function/print_r
--function print_r ( t ) 
--    local print_r_cache={}
--    local function sub_print_r(t,indent)
--        if (print_r_cache[tostring(t)]) then
--            print(indent.."*"..tostring(t))
--        else
--            print_r_cache[tostring(t)]=true
--            if (type(t)=="table") then
--                for pos,val in pairs(t) do
--                    if (type(val)=="table") then
--                        print(indent.."["..pos.."] => "..tostring(t).." {")
--                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
--                        print(indent..string.rep(" ",string.len(pos)+6).."}")
--                    else
--                        print(indent.."["..pos.."] => "..tostring(val))
--                    end
--                end
--            else
--                print(indent..tostring(t))
--            end
--        end
--    end
--    sub_print_r(t,"  ")
--end

function print_r(t, level)
	local level = level or 1
	local spaces = string.rep("    ", level)
	for k, v in pairsByKeys(t) do
		if type(v) == "table" then
			print(spaces.."["..k.."] => array")
			print_r(t[k], level+1)
		else
			print(spaces.."["..k.."] => \""..v.."\"")
		end
		::end_switch::
	end
	
end


function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do 
		table.insert(a, n) 
	end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then 
			return nil
		else 
			return a[i], t[a[i]]
		end
    end
    return iter
end

function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end
