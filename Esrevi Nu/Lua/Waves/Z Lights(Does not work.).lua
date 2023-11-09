timer = 0
bullets = {}
Star = CreateProjectile("circle",200,25)
R1 = 75
R2 = 150
R3 = 225
R4 = 300
R5 = 375
Scale = 0
Color = 0
Beams = {}

function Update()
	timer = timer + 1
	Star.sprite.SendToTop()
	if timer == 100 then
		local bullet = CreateProjectile("Pixel",200,25)
		bullet.sprite.SetPivot(0.5, 1)
		table.insert(Beams, bullet)
		local bullet = CreateProjectile("Pixel",200,25)
		bullet.sprite.SetPivot(0.5, 1)
		table.insert(Beams, bullet)
		local bullet = CreateProjectile("Pixel",200,25)
		bullet.sprite.SetPivot(0.5, 1)
		table.insert(Beams, bullet)
		local bullet = CreateProjectile("Pixel",200,25)
		bullet.sprite.SetPivot(0.5, 1)
		table.insert(Beams, bullet)
		local bullet = CreateProjectile("Pixel",200,25)
		bullet.sprite.SetPivot(0.5, 1)
		table.insert(Beams, bullet)
		for i=1, #Beams do
			local bullet = Beams[i]
			bullet.sprite.rotation = i*75
		end
	elseif timer > 100 and timer <= 200 then
		Scale = Scale + 10
		for i=1, #Beams do
			local bullet = Beams[i]
			bullet.sprite.yscale = Scale
			bullet.sprite.xscale = 1
		end
	elseif timer > 200 then
		Star.sprite.rotation = Star.sprite.rotation + 2
		for i=1, #Beams do
			local bullet = Beams[i]
			bullet.sprite.rotation = (i*75) + Star.sprite.rotation
		end
		if timer%(75/2) == 0 then
			for i=1,#Beams do
				local bullet = Beams[i]
				Color = math.random()*2
				if Color > 0 and Color <= 1 then
					bullet.sprite.color = { 1.00, 0.65, 0.00 }
					bullet.SetVar("Type",2)
				elseif Color > 1 and Color <= 2 then
					bullet.sprite.color = { 0.02, 0.37, 0.97 }
					bullet.SetVar("Type",3)
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == nil then 
		elseif bullet.GetVar("Type") == 1 then 
			Player.Hurt(9)
        elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
    	   	Player.Hurt(9)
    	elseif bullet.GetVar("Type") == 3 and Player.isMoving then
    	    Player.Hurt(9)
    	end
	end
    if timer >= 99999 then
        EndWave()
    end
end