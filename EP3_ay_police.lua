--Pour plus d'info voir https://www.youtube.com/watch?v=2R0FLrJOyDw

slotWaypoint = 1
slotCharbon = 2
slotTapeDrive = 3
slotCassette = 4
slotCoffre = 5


function police()
	turtle.forward()
	turtle.select(slotWaypoint)
	if not turtle.compareDown() then
		turtle.select(slotCoffre)
		if turtle.compareDown() then
			plein()
		else
			turtle.back()
			turtle.turnRight()	
		end
	end
	p = peripheral.wrap("left")
	entites = p.getNearbyEnt(10)

	for k,v in pairs(entites) do
		if v.type == "Player" and v.username ~= "aypierre" and v.username ~= "As2piK" then
			alerte()
			break
		end
	end	
end

function alerte()
	turtle.select(slotTapeDrive)
	turtle.place()
	q = peripheral.wrap("front")
	turtle.select(slotCassette)
	turtle.drop(1)
	q.seek(-9999999)
	q.play()
	os.sleep(4)
	q.stop()
	turtle.suck()
	turtle.select(slotTapeDrive)
	turtle.dig()
end

function plein()
	if turtle.getFuelLevel() < 500 then
		turtle.select(slotCharbon)
		turtle.suckDown()
		turtle.refuel()
	end
end
