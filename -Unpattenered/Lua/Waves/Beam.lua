X = 0
Y = 0
timer = 0
Beam = CreateProjectile('FastBeam', 99999, 99999)
Beam.remove()
Blaster1 = CreateProjectile('Blaster', 400, 0)
pole1 = CreateProjectile('Pole1',Blaster1.x+240,Blaster1.y)
pole1.sprite.rotation = 90
Blaster2 = CreateProjectile('Blaster', 400, 0)
pole2 = CreateProjectile('Pole1',Blaster1.x+240,Blaster1.y)
pole2.sprite.rotation = 90
Blaster3 = CreateProjectile('Blaster', 400, 0)
pole3 = CreateProjectile('Pole1',Blaster1.x+240,Blaster1.y)
pole3.sprite.rotation = 90
Blasters = {Blaster1, Blaster2, Blaster3}
Player.MoveTo(0,100,false)
for i=1,#Blasters do
    local bullet = Blasters[i]
    bullet.sprite.SendToTop()
end

function Update()
    timer = timer + 1
	pole1.MoveTo(Blaster1.x+240,Blaster1.y)
	pole2.MoveTo(Blaster2.x+240,Blaster2.y)
	pole3.MoveTo(Blaster3.x+240,Blaster3.y)
	for i=1,#Blasters do
        local bullet = Blasters[i]
	    if bullet.x >= 200 and bullet == Blaster1 and timer >= 50 then
		    bullet.MoveTo(bullet.x-8,Player.y)
		elseif bullet.x >= 200 and bullet == Blaster2 and timer >= 160 then
		    bullet.MoveTo(bullet.x-8,Player.y)
		elseif bullet.x >= 200 and bullet == Blaster3 and timer >= 270 then
		    bullet.MoveTo(bullet.x-8,Player.y)
		end
    end
	if timer%10 == 0 and timer < 70 then
		Audio.PlaySound("alarm")
	end
	if timer%10 == 0 and timer > 120 and timer < 180 then
		Audio.PlaySound("alarm")
	end
	if timer%10 == 0 and timer > 230 and timer < 290 then
		Audio.PlaySound("alarm")
	end
	if (timer+50)%110 == 0 and timer < 330 then
		Audio.PlaySound("00002a2e")
	end
	if timer == 110 then
		Beam = CreateProjectile('FastBeam', (Blaster1.x-28), Blaster1.y)
		Audio.PlaySound("00002a30")
	end
	if timer == 220 then
		Beam = CreateProjectile('FastBeam', (Blaster2.x-28), Blaster2.y)
		Audio.PlaySound("00002a30")
	end
	if timer == 330 then
		Beam = CreateProjectile('FastBeam', (Blaster3.x-28), Blaster3.y)
		Audio.PlaySound("00002a30")
	end
	if timer >= 110 then
        if Beam.isactive then
	        X = Beam.x - 24
	    	Y = Beam.y
	    	Beam = CreateProjectile('FastBeam', X, Y)
	    end
	end
    if timer >= 400 then
        EndWave() 
    end
end