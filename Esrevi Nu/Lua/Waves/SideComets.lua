timer = 0
Arena.ResizeImmediate(150, 200)
bullets = {}
Bullets2 = {}
Fire1 = CreateProjectile("Fire1",370,70)
Fire1.sprite.xscale = 5/3
Fire1.sprite.yscale = 5/3
Rock1 = CreateProjectile("Rock1",350,70)
Rock1.sprite.xscale = 1
Rock1.sprite.yscale = 1
Rock1.SetVar("Type",1)
Fire2 = CreateProjectile("Fire1",370,0)
Fire2.sprite.xscale = 5/3
Fire2.sprite.yscale = 5/3
Rock2 = CreateProjectile("Rock1",350,0)
Rock2.sprite.xscale = 1
Rock2.sprite.yscale = 1
Rock2.SetVar("Type",1)
Fire3 = CreateProjectile("Fire1",370,-70)
Fire3.sprite.xscale = 5/3
Fire3.sprite.yscale = 5/3
Rock3 = CreateProjectile("Rock1",350,-70)
Rock3.sprite.xscale = 1
Rock3.sprite.yscale = 1
Rock3.SetVar("Type",1)

B = -1
F = 0

interval = 2
pizelSize = 3

function Update()
    timer = timer + 1
	if (timer+800)%900 == 0 then
		B = 0
	elseif B == 0 then
		Rock1.MoveTo(Rock1.x-20,Rock1.y)
		Rock1.sprite.rotation = timer*5
		Fire1.MoveTo(Rock1.x,Rock1.y)
		Fire1.sprite.rotation = -90
		if timer%interval == 0 then
			for i=1,1 do
				local bullet = CreateProjectile("pixel",Rock1.x+(math.random()*10),Rock1.y+(math.random()*10))
				bullet.sprite.xscale = pizelSize
				bullet.sprite.yscale = pizelSize
				bullet.SetVar("Type",2)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", 0)
				table.insert(bullets, bullet)
			end
		end
	elseif B == 1 then
		Rock2.MoveTo(Rock2.x-20,Rock2.y)
		Rock2.sprite.rotation = timer*5
		Fire2.MoveTo(Rock2.x,Rock2.y)
		Fire2.sprite.rotation = -90
		if timer%interval == 0 then
			for i=1,1 do
				local bullet = CreateProjectile("pixel",Rock2.x+(math.random()*10),Rock2.y+(math.random()*10))
				bullet.sprite.xscale = pizelSize
				bullet.sprite.yscale = pizelSize
				bullet.SetVar("Type",2)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", 0)
				table.insert(bullets, bullet)
			end
		end
	elseif B == 2 then
		Rock3.MoveTo(Rock3.x-20,Rock3.y)
		Rock3.sprite.rotation = timer*5
		Fire3.MoveTo(Rock3.x,Rock3.y)
		Fire3.sprite.rotation = -90
		if timer%interval == 0 then
			for i=1,1 do
				local bullet = CreateProjectile("pixel",Rock3.x+(math.random()*10),Rock3.y+(math.random()*10))
				bullet.sprite.xscale = pizelSize
				bullet.sprite.yscale = pizelSize
				bullet.SetVar("Type",2)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", 0)
				table.insert(bullets, bullet)
			end
		end
	elseif B == 4 then
		B = 4.5
	elseif B == 4.5 then
		Rock1.MoveTo(Rock1.x+22,Rock1.y)
		Rock1.sprite.rotation = timer*5
		Fire1.MoveTo(Rock1.x,Rock1.y)
		Fire1.sprite.rotation = 90
		if timer%interval == 0 then
			for i=1,1 do
				local bullet = CreateProjectile("pixel",Rock1.x+(math.random()*10),Rock1.y+(math.random()*10))
				bullet.sprite.xscale = pizelSize
				bullet.sprite.yscale = pizelSize
				bullet.SetVar("Type",2)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", 0)
				table.insert(bullets, bullet)
			end
		end
	elseif B == 5 then
		Rock2.MoveTo(Rock2.x+22,Rock2.y)
		Rock2.sprite.rotation = timer*5
		Fire2.MoveTo(Rock2.x,Rock2.y)
		Fire2.sprite.rotation = 90
		if timer%interval == 0 then
			for i=1,1 do
				local bullet = CreateProjectile("pixel",Rock2.x+(math.random()*10),Rock2.y+(math.random()*10))
				bullet.sprite.xscale = pizelSize
				bullet.sprite.yscale = pizelSize
				bullet.SetVar("Type",2)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", 0)
				table.insert(bullets, bullet)
			end
		end
	elseif B == 6 then
		Rock3.MoveTo(Rock3.x+22,Rock3.y)
		Rock3.sprite.rotation = timer*5
		Fire3.MoveTo(Rock3.x,Rock3.y)
		Fire3.sprite.rotation = 90
		if timer%interval == 0 then
			for i=1,1 do
				local bullet = CreateProjectile("pixel",Rock3.x+(math.random()*10),Rock3.y+(math.random()*10))
				bullet.sprite.xscale = pizelSize
				bullet.sprite.yscale = pizelSize
				bullet.SetVar("Type",2)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", 0)
				table.insert(bullets, bullet)
			end
		end
	end

	if timer > 100 and (timer+10)%100 == 0 then
		if B < 6 then
			B = math.floor(B) + 1
		else
			B = -1
		end
		if (timer+10)%750 ~= 0 and (timer + 10 )%500 != 0 then
			Time = CreateProjectile("pixel",0,0)
			Time.sprite.xscale = 1000
			Time.sprite.yscale = 1000
			Time.sprite.alpha = 0.5
			Player.SetControlOverride(true)
			F = 1
		end
	elseif timer > 100 and (timer)%100 == 0 and (timer + 10 )%500 != 0 then
		Player.SetControlOverride(false)
		for i=1,#bullets do
			local bullet = bullets[i]
			local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			table.insert(Bullets2,bullet)
		end
		if Time.isactive == true then
			Time.remove()
		end
		bullets = {}
		F = 0
	end
	if F == 0 then
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			end
			if bullet.x < -320 or bullet.y < -250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
		for i=1,#Bullets2 do
			local bullet = Bullets2[i]
			if bullet.isactive then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			end
			if bullet.x < -320 or bullet.y < -250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(24)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(6,0.1)
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
    if timer >= 1000 then
        EndWave()
    end
end