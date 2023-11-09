b1 = CreateProjectile('bulletA', 100, 100)
b2 = CreateProjectile('bulletA', 100, 100)
b3 = CreateProjectile('bulletA', 100, 100)
b4 = CreateProjectile('bulletA', 100, 100)
b5 = CreateProjectile('bulletA', 100, 100)
b6 = CreateProjectile('bulletA', 100, 100)
b7 = CreateProjectile('bulletA', 100, 100)
b8 = CreateProjectile('bulletA', 100, 100)
Bullets = {b1, b2, b3, b4, b5, b6, b7, b8}
timer = 0
function Update()
     timer = timer + 1
     for i=1,#Bullets do
	     b1.MoveTo(((200-timer) * math.cos((timer+0) / 25) + 0),((-(200-timer)) * math.sin((timer+0) / 25) + 0))
	     b2.MoveTo(((200-timer) * math.cos((timer+20) / 25) + 0),((-(200-timer)) * math.sin((timer+20) / 25) + 0))
	     b3.MoveTo(((200-timer) * math.cos((timer+40) / 25) + 0),((-(200-timer)) * math.sin((timer+40) / 25) + 0))
	     b4.MoveTo(((200-timer) * math.cos((timer+60) / 25) + 0),((-(200-timer)) * math.sin((timer+60) / 25) + 0))
	     b5.MoveTo(((200-timer) * math.cos((timer+80) / 25) + 0),((-(200-timer)) * math.sin((timer+80) / 25) + 0))
		 b6.MoveTo(((200-timer) * math.cos((timer+100) / 25) + 0),((-(200-timer)) * math.sin((timer+100) / 25) + 0))
		 b7.MoveTo(((200-timer) * math.cos((timer+120) / 25) + 0),((-(200-timer)) * math.sin((timer+120) / 25) + 0))
		 b8.MoveTo(((200-timer) * math.cos((timer+140) / 25) + 0),((-(200-timer)) * math.sin((timer+140) / 25) + 0))
	 end
     if timer >= 360 then
         EndWave() 
     end
end