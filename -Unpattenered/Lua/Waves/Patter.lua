b1 = CreateProjectile('bulletA', 100, 100)
b2 = CreateProjectile('bulletA', 100, 100)
b3 = CreateProjectile('bulletA', 100, 100)
b4 = CreateProjectile('bulletA', 100, 100)
b5 = CreateProjectile('bulletA', 100, 100)
b6 = CreateProjectile('bulletA', 100, 100)
b7 = CreateProjectile('bulletA', 100, 100)
b8 = CreateProjectile('bulletA', 100, 100)
b9 = CreateProjectile('bulletA', 100, 100)
b10 = CreateProjectile('bulletA', 100, 100)
b11 = CreateProjectile('bulletA', 100, 100)
b12 = CreateProjectile('bulletA', 100, 100)
b13 = CreateProjectile('bulletA', 100, 100)
b14 = CreateProjectile('bulletA', 100, 100)
b15 = CreateProjectile('bulletA', 100, 100)
b16 = CreateProjectile('bulletA', 100, 100)
Bullets = {b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16}
timer = 0
function Update()
     timer = timer + 1
     for i=1,#Bullets do
	     b1.MoveTo(((200-timer) * math.cos((timer+0) / 40) + 0),((-(200-timer)) * math.sin((timer+-20) / 40) + 0))
	     b2.MoveTo(((200-timer) * math.cos((timer+20) / 40) + 0),((-(200-timer)) * math.sin((timer+0) / 40) + 0))
	     b3.MoveTo(((200-timer) * math.cos((timer+40) / 40) + 0),((-(200-timer)) * math.sin((timer+20) / 40) + 0))
	     b4.MoveTo(((200-timer) * math.cos((timer+60) / 40) + 0),((-(200-timer)) * math.sin((timer+40) / 40) + 0))
	     b5.MoveTo(((200-timer) * math.cos((timer+80) / 40) + 0),((-(200-timer)) * math.sin((timer+60) / 40) + 0))
		 b6.MoveTo(((200-timer) * math.cos((timer+100) / 40) + 0),((-(200-timer)) * math.sin((timer+80) / 40) + 0))
		 b7.MoveTo(((200-timer) * math.cos((timer+120) / 40) + 0),((-(200-timer)) * math.sin((timer+100) / 40) + 0))
		 b8.MoveTo(((200-timer) * math.cos((timer+140) / 40) + 0),((-(200-timer)) * math.sin((timer+120) / 40) + 0))
		 b9.MoveTo(((200-timer) * math.cos((timer+-20) / 40) + 0),((-(200-timer)) * math.sin((timer+0) / 40) + 0))
	     b10.MoveTo(((200-timer) * math.cos((timer+0) / 40) + 0),((-(200-timer)) * math.sin((timer+20) / 40) + 0))
	     b11.MoveTo(((200-timer) * math.cos((timer+20) / 40) + 0),((-(200-timer)) * math.sin((timer+40) / 40) + 0))
	     b12.MoveTo(((200-timer) * math.cos((timer+40) / 40) + 0),((-(200-timer)) * math.sin((timer+60) / 40) + 0))
	     b13.MoveTo(((200-timer) * math.cos((timer+60) / 40) + 0),((-(200-timer)) * math.sin((timer+80) / 40) + 0))
		 b14.MoveTo(((200-timer) * math.cos((timer+80) / 40) + 0),((-(200-timer)) * math.sin((timer+100) / 40) + 0))
		 b15.MoveTo(((200-timer) * math.cos((timer+100) / 40) + 0),((-(200-timer)) * math.sin((timer+120) / 40) + 0))
		 b16.MoveTo(((200-timer) * math.cos((timer+120) / 40) + 0),((-(200-timer)) * math.sin((timer+140) / 40) + 0))
	 end
     if timer >= 360 then
         EndWave() 
     end
end