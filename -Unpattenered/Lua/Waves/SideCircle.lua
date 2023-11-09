WAVETIMER = 0
wavetimer = 100
Arena.Resize(300, 16)
Pole = CreateProjectile('Pole1', 100, 100)
b1 = CreateProjectile('bulletA', 100, 100)
b2 = CreateProjectile('bulletA', 100, 100)
b3 = CreateProjectile('bulletA', 100, 100)
b4 = CreateProjectile('bulletA', 100, 100)
b5 = CreateProjectile('bulletA', 100, 100)
b6 = CreateProjectile('bulletA', 100, 100)
b7 = CreateProjectile('bulletB', 100, 100)
Bullets = {b1, b2, b3, b4, b5, b6, b7, Pole}
b7.sprite.xscale=2
b7.sprite.yscale=2
timer = 0
Y = 350
X = 150
Change = 1
function Update()
     timer = timer + 1
	 if Y > 40 then
	     Y = (400-(3*timer))
	 end
	 if Y <= 40 then
	     if X <= -150 then
		     Change = -1
		 elseif X >= 150 then
		     Change = 1
		 end
		 if Change == 1 then
		     X = X - 3
		 elseif Change == -1 then
		     X = X + 3
		 end
	 end
     for i=1,#Bullets do
	     b1.MoveTo((70 * math.cos((timer+0) / 30) + X),(-70 * math.sin((timer+0) / 30) + Y))
	     b2.MoveTo((70 * math.cos((timer+32) / 30) + X),(-70 * math.sin((timer+32) / 30) + Y))
	     b3.MoveTo((70 * math.cos((timer+64) / 30) + X),(-70 * math.sin((timer+64) / 30) + Y))
	     b4.MoveTo((70 * math.cos((timer+96) / 30) + X),(-70 * math.sin((timer+96) / 30) + Y))
	     b5.MoveTo((70 * math.cos((timer+128) / 30) + X),(-70 * math.sin((timer+128) / 30) + Y))
		 b6.MoveTo((70 * math.cos((timer+160) / 30) + X),(-70 * math.sin((timer+160) / 30) + Y))
		 b7.MoveTo(X,Y)
		 b7.sprite.rotation=timer*2
		 Pole.MoveTo(X,Y+240)
	 end
     if timer >= 560 then
         EndWave() 
     end
end