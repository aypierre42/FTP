--Plus d'info ici : https://www.youtube.com/watch?v=I5ypmkKHklQ

local p = {}
m = peripheral.wrap("left")
m.setTextScale(1)
rednet.open("right")
maxe = 4
recentre = 4

function getData()
	event, senderId, message, _ = os.pullEvent()
	if senderId == 154 and event == "rednet_message" then
		p = textutils.unserialize(message)
	end	
end

function tabLn(input)
	local int=0
	for k,v in pairs(input) do
		int=int+1
	end
	return int
end

function comble(fin)
	for i=1,fin do
		m.write(" ")
	end
	m.setBackgroundColor(colors.black)
	m.write(" ")
end

function graphPrincipal()
	m.setTextScale(1)
	m.setBackgroundColor(colors.black)
	m.clear()
	x, _ = m.getSize()
	j = math.ceil(x/(maxe+2))
	m.setCursorPos(j+recentre,2)
	s=0
	t=2
	for k,v in pairs(p) do
		if k ~= "No label" and k ~= "ville" then
			if s == maxe then	
				t = t+3
				m.setCursorPos(j+recentre,t)
				s = 0
			end
			s = s+1
			
			m.setBackgroundColor(colors.white)
			if v==-1 then 
				m.setTextColor(colors.red) 
			else 
				m.setTextColor(colors.lightBlue) 
			end
			m.write(" "..k.." ")
			comble(j-#k-4)
		end
	end
	
	s=0
	t=2
	total = 0
	m.setCursorPos(j+recentre,3)
	for k,v in pairs(p) do
		if k ~= "No label" and k ~= "ville" then
			if s == maxe then	
				t = t+3
				m.setCursorPos(j+4,t+1)
				s = 0
			end
			s = s+1
			if v==-1 then 
				m.setBackgroundColor(colors.gray)
				m.setTextColor(colors.red)
				m.write(" DECO ")
				comble(j-8)
			else 
				if v>0 then
					m.setBackgroundColor(colors.lime)
					m.setTextColor(colors.black)
				else
					m.setBackgroundColor(colors.gray)
					m.setTextColor(colors.lightGray)			
				end
				vt=tostring(v/20)
				m.write(" "..vt.." ")
				comble(j-#vt-4)
			end	
		else
			if k == "ville" then
				total = v/20
			end
		end
	end
	
	--m.setTextScale(4)
	--x, _= m.getSize()
	
	
	if total>0 then
		m.setBackgroundColor(colors.lime)
		m.setTextColor(colors.black)
	else
		m.setBackgroundColor(colors.gray)
		m.setTextColor(colors.lightGray)	
	end
	t2 = tostring(total)
	m.setCursorPos((x-#t2)/2-1,t+5)
	for i=1,#t2+4 do m.write(" ") end
	m.setCursorPos((x-#t2)/2-1,t+6)
	m.write("  "..t2.."  ")
	m.setCursorPos((x-#t2)/2-1,t+7)
	for i=1,#t2+4 do m.write(" ") end
end


while true do
	getData()
	graphPrincipal()
end
