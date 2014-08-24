--Utilisé pour ramasser du bois en masse
--Pour plus de détail voir https://www.youtube.com/watch?v=aPwSHFlwwq0 et https://www.youtube.com/watch?v=2R0FLrJOyDw

--Initialisation des slots utilisés par la turtle.
slotTronc = 1
slotRubber = 5
slotSapling = 10
slotBonemeal = 14
slotWaypoint = 15
slotCharbon = 16

coffreCoffreBase = vector.new(-80,64,19)

--Cette fonction permet à la turtle de retrouver son emplacement d'origine si elle s'est égarée.
function goTo(x,y,z)
	local position = vector.new(gps.locate(2))		--Recupère sa potition
	local home = vector.new(x,y,z)				--Coordonnées de sa 'masison'
	local deplacement = home:sub(position)			
	local move = home:sub(vector.new(gps.locate(2)))	--Calcule de la distance à parcourir
	
	--Boucles permettant son déplacement
	while move.y > 0 do					
		turtle.up()
		move = home:sub(vector.new(gps.locate(2)))
	end
	
	turtle.forward()
	move = home:sub(vector.new(gps.locate(2)))
	if math.abs(deplacement.x) - math.abs(move.x) == 0 then
		turtle.back()
		turtle.turnLeft()
		turtle.forward()
		move = home:sub(vector.new(gps.locate(2)))
	end
	if math.abs(deplacement.x) - math.abs(move.x) == -1 then
		turtle.turnLeft()
		turtle.turnLeft()
	end
	while math.abs(home:sub(vector.new(gps.locate(2))).x) > 0 do
		if not turtle.forward() then
			turtle.up()	
		end
	end
	
	turtle.turnLeft()
	turtle.forward()
	move = home:sub(vector.new(gps.locate(2)))
	if math.abs(deplacement.z) - math.abs(move.z) == -1 then
		turtle.turnLeft()
		turtle.turnLeft()
	end
	while math.abs(home:sub(vector.new(gps.locate(2))).z) > 0 do
		turtle.forward()
	end	
	
	move = home:sub(vector.new(gps.locate(2)))
	while move.y < 0 do
		turtle.down()
		move = home:sub(vector.new(gps.locate(2)))
	end
end

--Fonction permettant à la turtle d'aller aux coffres pour y déposer bois, plastique, sapling (1) et d'y refaire le plein 
--de charbon et de bonemeal(2).
function forestier()
	while true do
		goTo(coffreCoffreBase.x, coffreCoffreBase.y, coffreCoffreBase.z)
		for i=1,4 do					--(1)
			turtle.select(i)
			turtle.dropDown(turtle.getItemCount(i)-1)
		end
		for i=5,9 do					--(2)
			turtle.select(i)			
			turtle.dropUp(turtle.getItemCount(i)-1)
		end
		
		turtle.select(slotWaypoint)
		turtle.forward()
		while not turtle.compareDown() do
			turtle.back()
			turtle.turnLeft()
			turtle.forward()
		end
		
		turtle.forward()
		turtle.select(slotBonemeal)
		turtle.dropDown()
		turtle.suckDown()
		
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.select(slotSapling)
		turtle.dropDown()
		turtle.suckDown()
				
		turtle.turnLeft()
		turtle.turnLeft()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		
		turtle.turnRight()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.turnLeft()
		turtle.forward()
		turtle.forward()
		
		
		ramasseRangee()
		
		turtle.turnRight()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.turnRight()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		
		ramasseRangee()
		
		turtle.turnLeft()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.turnLeft()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		
		ramasseRangee()		
	end

end

--Fonction qui replante la sapling, met de la bonemeal et decoupe l'arbre si la turtle détecte un block devant lui.
--Fonctionne uniquement avec des arbres droits.
function ramasseRangee()
	for i=1,6 do
		turtle.select(slotSapling)
		turtle.place()
		turtle.select(slotBonemeal)
		turtle.place()
		turtle.place()
		turtle.place()
		while turtle.detect() do
			turtle.dig()
			turtle.digUp()
			turtle.up()
		end
		
		while turtle.down() do
		end
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
		turtle.forward()
	end
end
