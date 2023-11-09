timer = 0
Blasters = {}
Poles = {}
Beams = {}
Blaster = CreateProjectile('Blank', 0, 400)
Blaster.sprite.rotation = 90
pole = CreateProjectile('Blank',Blaster.x,Blaster.y+240)
Blaster.sprite.SendToTop()
table.insert(Blasters, Blaster)
table.insert(Poles, pole)
Arena.Resize(60, 16)
function Update()
	timer = timer + 1
	if (timer-60)%110 == 0 then
		Blaster = CreateProjectile('Blaster', 0, 400)
		Blaster.sprite.rotation = 90
		pole = CreateProjectile('Pole1',Blaster.x,Blaster.y+240)
		Blaster.sprite.SendToTop()
		table.insert(Blasters, Blaster)
		table.insert(Poles, pole)
		Audio.PlaySound("00002a2e")
	end
	if pole.isactive then
		pole.MoveTo(Blaster.x,Blaster.y+240)
	end
	if Blaster.y >= 200 then
		Blaster.MoveTo(Player.x,Blaster.y-8)
	end
	if Blaster.y <= 200 then			
		if timer%110 == 0 then 
			Beam = CreateProjectile('FastBeam', Blaster.x, Blaster.y-28)
			table.insert(Beams, Beam)
			Audio.PlaySound("00002a30")
		end
	end
	if timer >= 3110 then
		if Beam.isactive then
			X = Beam.x
			Y = Beam.y - 24
			Beam = CreateProjectile('FastBeam', X, Y)
			Beam.sprite.rotation = 90
			table.insert(Beams, Beam)
		end
	end		
	for i=1,#Poles do
		local bullet = Poles[i]
		if bullet ~= pole and bullet.y <= 640 then
			bullet.MoveTo(bullet.x,bullet.y+8)
		elseif bullet ~= pole and bullet.isactive == true then
			bullet.remove()
		end
	end
	for i=1,#Blasters do
		local bullet = Blasters[i]
		if bullet ~= Blaster and bullet.y <= 400 then
			bullet.MoveTo(bullet.x,bullet.y+8)
		elseif bullet ~= Blaster and bullet.isactive == true then
			bullet.remove()
		end
	end
	for i=1,#Beams do
		local bullet = Beams[i]
		bullet.SetVar("Type", 1)
		if bullet.isactive then
			bullet.MoveTo(bullet.x,bullet.y-8)
			if bullet.y <= -350 and bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	if timer >= 380 then -- 420 is how many frames the wave will last
	  EndWave()
	end
end
