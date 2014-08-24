--Pour plus d'info voir https://www.youtube.com/watch?v=2R0FLrJOyDw

--Initialisation des slots utilisés par la turtle.
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
	entites = p.getNearbyEnt(10) --Détection des entités situées dans un rayon de 10 blocks

	for k,v in pairs(entites) do
		--Si l'entitée détectée est un joueur et que le joueur est différent de aypierre et différent que As2piK 
		if v.type == "Player" and v.username ~= "aypierre" and v.username ~= "As2piK" then
			alerte()
			break
		end
	end	
end

--Fonction se déclanchant si la turtle détecte un joueur autre que aypierre et As2piK
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

-- Fonction permettant à la turtle de refaiure le plein de charbon si la turtle à moins de 500 d'énergie
function plein()
	if turtle.getFuelLevel() < 500 then
		turtle.select(slotCharbon)
		turtle.suckDown()
		turtle.refuel()
	end
end
