--Plus d'infos ici : https://www.youtube.com/watch?v=INQPAgFHHA4

p = peripheral.wrap("top")
     
p.clear()
p.setTextScale(5)

     
while true do
	p.clear()
	p.setCursorPos(1,8)
	p.write("A")
	os.sleep(0.5)
	p.scroll(1)
	p.setCursorPos(1,8)
	p.write("Y")
	os.sleep(0.5)
	p.scroll(1)
	p.setCursorPos(1,8)
	p.write("R")
	os.sleep(0.5)
	p.scroll(1)
	p.setCursorPos(1,8)
	p.write("O")
	os.sleep(0.5)
	p.scroll(1)
	p.setCursorPos(1,8)
	p.write("B")
	os.sleep(0.5)
	p.scroll(1)
	p.setCursorPos(1,8)
	p.write("O")
	os.sleep(0.5)
	p.scroll(1)
	p.setCursorPos(1,8)
	p.write("T")
	os.sleep(0.5)
	for i=1,8 do
		p.scroll(1)
		os.sleep(0.5)
	end
end
