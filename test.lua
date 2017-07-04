local output = io.open("c:\\users\\bob\\desktop\\export2.coord", "w")

local lat, long
local x = 0
local y = 0


--lat, long = coord.LOtoLL({x=0, y=0, z=0})
--output:write('0'..', '..'0'..', '..lat..', '..long..'\n')
--lat, long = coord.LOtoLL({x=10, y=0, z=0})
--output:write('10'..', '..'0'..', '..lat..', '..long..'\n')
--lat, long = coord.LOtoLL({x=20, y=0, z=0})
--output:write('20'..', '..'0'..', '..lat..', '..long..'\n')

while true do
  lat, long = coord.LOtoLL({x=x, y=0, z=y})
  if lat < 40 then
    break
  end
  
  output:write(x..', '..y..', '..lat..', '..long..'\n')
  y = y + 1
end