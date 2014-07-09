--Plus d'info ici : https://www.youtube.com/watch?v=I5ypmkKHklQ

p = {}
rednet.open("right")
local x = {peripheral.find("EnergyMeterRF")}

for k,v in  pairs(x) do
	p[v.getLabel()] = v
end

function loadDB()
  local f = fs.open("db", "r")
  db = textutils.unserialize(f.readAll())
  f.close()
end

function saveDB()
  local f = fs.open("db", "w")
  f.write(textutils.serialize(db))
  f.close()
end

while true do
	e = {}
	for k,v in pairs(p) do
		if not v.isOutputAllowed() then
			e[k] = -1
			v.reset()
		else		
			e[k] = v.getCountAndReset()
		end
	end
	rednet.send(171,textutils.serialize(e))
	os.sleep(1)
end
