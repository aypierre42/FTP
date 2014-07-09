p = peripheral.wrap("back")

letters = {
	"Plus de pluie dans 3",
	".",
	".",
	"2",
	".",
	".",
	"1",
	".",
	"."
}

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
		-- Petite optimisation grace à une boucle
		for k,v in ipairs(letters) do
			p.write(v);
			os.sleep(1)
		end
		os.sleep(2)	
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
