--Plus d'info ici : https://www.youtube.com/watch?v=4vH3Ap37Dew

p = peripheral.wrap("back")

function enlevePluie()
	if rs.getInput("top") == false then
		p.setCursorPos(12,13)
		p.write("Il ne pleut pas !")
		os.sleep(3)
		os.reboot()
	else
		rs.setOutput("left", true)
		os.sleep(2)
		rs.setOutput("left", false)	
		p.setCursorPos(6,13)
		p.write("Plus de pluie dans 3")
		os.sleep(1)
		p.write(".")
		os.sleep(1)
		p.write(".")
		os.sleep(1)
		p.write("2")
		os.sleep(1)
		p.write(".")
		os.sleep(1)
		p.write(".")
		os.sleep(1)
		p.write("1")
		os.sleep(1)
		p.write(".")
		os.sleep(1)
		p.write(".")
		os.sleep(3)	
		os.reboot()	
	end
end

p.clear()
p.setCursorPos(11,1)
p.write("Pluie cleaner 2000")

p.setCursorPos(15,7)
p.write("-----------")
p.setCursorPos(15,8)
p.write("|         |")
p.setCursorPos(15,9)
p.write("|  CLEAN  |")
p.setCursorPos(15,10)
p.write("|         |")
p.setCursorPos(15,11)
p.write("-----------")

p.setCursorPos(15,18)
p.write("Powered by")
p.setCursorPos(4,19)
p.write("Ayrobot, EpeeForte & Shortenergy")


while true do
	event, side, xPos, yPos = os.pullEvent("monitor_touch")
	if xPos > 13 and xPos < 26 and yPos > 6 and yPos < 12 then
		enlevePluie()
	end
end
