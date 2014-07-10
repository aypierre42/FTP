--Ce programme permet de découper un arbre seul. 
--Plus d'info sur https://www.youtube.com/watch?v=rnhgpmMM6jM et https://www.youtube.com/watch?v=aPwSHFlwwq0

--Initialisation slots turtle
slotCharbon = 7
slotWood = 1
slotPlastic = 2
slotTree = 3
slotWaypoint = 8
slotChest = 9
slotBonemeal = 10
 
--Permet à la turtle de refaiure le plein d'energie si la turtle à moins de 800 d'énergie
function reEnergy()
    turtle.select(slotCharbon)
    if turtle.getFuelLevel() < 800 then
        turtle.suck()
        turtle.refuel()
    end
end

-- Permet de déposer le "itemSlotName" (slotWood, slotPlastic, ...) dans le container situé en dessous de la turtle
function deposeItem(itemSlotName)
    turtle.select(itemSlotName)
    turtle.drop(turtle.getItemCount(itemSlotName)-1)
end

--Permet de refaire le plein de "Item" si la turtle en à moins de count dans son inventaire
function reItem(itemSlotName, count, suckType)
    turtle.select(itemSlotName)
    if turtle.getItemCount(itemSlotName) < count then
        if suckType == "suckUp" then
            turtle.suckUp()
        else
            turtle.suck()
        end
    end
end


--Vérifie si le block situé sous la turtle est du même type que le "type" (waypoint, chest, ...)défini plus haut. Utilisé comme réparage 
--pour le déplacement de la turtle (nottament lors de son initialisation)
function isBlockType(type)
    turtle.select(type)
    return turtle.compare()
end

--Replante un arbre
function rePlant()
        turtle.select(slotTree)
        turtle.place()
end
 
--Fonction qui permet de déposer le bois, le plastic, refaire le plein d'énergie et de sapling, de replanter l'arbre et 
--d'attendre qu'il pousse
function reAndFill(init)
    if not init then
        turtle.turnLeft()
        turtle.turnLeft()
        while true do
            turtle.forward()
        end
    end
    turtle.turnLeft()
    reEnergy()
    turtle.turnRight()
    deposeItem(slotWood)
    deposeItem(slotPlastic)
    turtle.turnRight()
    reItem(slotTree, 2, "suck")
    turtle.turnRight()
    reItem(slotBonemeal, 5, "suckUp")
    i = 0
    while isBlockType(slotWaypoint) do
        i = i+1
        turtle.forward()
        if i > 10 then
            break
        end
    else
        turtle.back()
    end

    rePlant()
    os.sleep(200)
    turtle.select(slotBonemeal)
    for i=0,4 do
            turtle.place()
    end
end

--Fonction qui permet de découper l'arbre. Fonctionnement uniquement avec des troncs droits (une seule ligne de tronc). 
--La turtle casse le bois et monte en hauteur tant qu'il y a du bois devant elle, jusqu'a atteindre la cime de l'arbre.
function decoupeArbre()
    turtle.select(slotWood)
    while turtle.detect() do
        turtle.dig()
        turtle.digUp()
        turtle.up()
    end
    while not isBlockType(slotWaypoint) do
        turtle.down()
    end
end

--Fonction d'initialisation, déclenchée au démarrage de la turtle. Indispensable pour repositioner correctement la
--turtle (utile en cas de reboot serv par exemple)
function init()
    turtle.select(slotCharbon)
    turtle.refuel(1)

    while true do
        if not isBlockType(slotWaypoint) then
            if not turtle.down() then
                break
            end
        else
            break
        end
    end
   
    while true do
        if not turtle.forward() then
            if isBlockType(slotChest) then
                break
            else
                turtle.turnLeft()
            end
        else
            if isBlockType(slotWaypoint) then
                break
            else
                turtle.back()
                turtle.turnLeft()
            end
        end            
    end
    while turtle.forward() do
        if not isBlockType(slotWaypoint) then
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.forward()
        end
    end
    tourne()
end

--Fonction principale, appelé par le programme parent
function tourne()
    reAndFill(true)
    while true do
        decoupeArbre()
        reAndFill()
    end    
end
