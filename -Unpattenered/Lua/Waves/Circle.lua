R1 = CreateProjectile('bulletA', 100, 100)
R2 = CreateProjectile('bulletA', 100, 100)
R3 = CreateProjectile('bulletA', 100, 100)
R4 = CreateProjectile('bulletA', 100, 100)
R5 = CreateProjectile('bulletA', 100, 100)
R6 = CreateProjectile('bulletA', 100, 100)
BulletR = {R1, R2, R3, R4, R5, R6}
L1 = CreateProjectile('bulletA', 100, 100)
L2 = CreateProjectile('bulletA', 100, 100)
L3 = CreateProjectile('bulletA', 100, 100)
L4 = CreateProjectile('bulletA', 100, 100)
L5 = CreateProjectile('bulletA', 100, 100)
L6 = CreateProjectile('bulletA', 100, 100)
BulletL = {L1, L2, L3, L4, L5, L6}
xpos = 0
ypos = 0
timer = 0
wavetimer = 6
function Update()
     timer = timer + 1
     for i=1,#BulletR do
	     R1.MoveTo((50 * math.cos((timer+0) / 25) + (200-timer)),(-50 * math.sin((timer+0) / 25) + 0))
	     R2.MoveTo((50 * math.cos((timer+20) / 25) + (200-timer)),(-50 * math.sin((timer+20) / 25) + 0))
	     R3.MoveTo((50 * math.cos((timer+40) / 25) + (200-timer)),(-50 * math.sin((timer+40) / 25) + 0))
	     R4.MoveTo((50 * math.cos((timer+60) / 25) + (200-timer)),(-50 * math.sin((timer+60) / 25) + 0))
	     R5.MoveTo((50 * math.cos((timer+80) / 25) + (200-timer)),(-50 * math.sin((timer+80) / 25) + 0))
		 R6.MoveTo((50 * math.cos((timer+100) / 25) + (200-timer)),(-50 * math.sin((timer+100) / 25) + 0))
	 end
	 for i=1,#BulletL do
	     L1.MoveTo((50 * math.sin((timer+10) / 25) - (200-timer)),(-50 * math.cos((timer+10) / 25) + 0))
	     L2.MoveTo((50 * math.sin((timer+30) / 25) - (200-timer)),(-50 * math.cos((timer+30) / 25) + 0))
	     L3.MoveTo((50 * math.sin((timer+50) / 25) - (200-timer)),(-50 * math.cos((timer+50) / 25) + 0))
	     L4.MoveTo((50 * math.sin((timer+70) / 25) - (200-timer)),(-50 * math.cos((timer+70) / 25)+ 0))
	     L5.MoveTo((50 * math.sin((timer+90) / 25) - (200-timer)),(-50 * math.cos((timer+90) / 25)+ 0))
		 L6.MoveTo((50 * math.sin((timer+110) / 25) - (200-timer)),(-50 * math.cos((timer+110) / 25)+ 0))
	 end
     if timer >= 360 then
         EndWave() 
     end
end