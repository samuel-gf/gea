-- Lib
function serialize(a)
  local s = ""
  for k, v in pairs(a) do
    s = s .. k .. ":" .. v .. "\n"
  end
  return s
end


function wait(millisecond)
  socket.sleep(1)
end


function print_r(t, level)
  local level = level or 1
  local spaces = string.rep("    ", level)
  for k, v in pairsByKeys(t) do
    if type(v) == "table" then
      print(spaces.."["..k.."] = > array")
      print_r(t[k], level + 1)
    else
      print(spaces.."["..k.."] = > \""..v.."\"")
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
    local i = 0-- iterator variable
    local iter = function ()-- iterator function
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
  return (s:gsub("^%s * (. - )%s * $", "%1"))
end
