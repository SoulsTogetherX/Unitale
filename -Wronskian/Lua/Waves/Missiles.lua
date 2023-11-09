timer = 0
bullets = {}
Arena.ResizeImmediate(200, 80)

function Update()
	timer = timer + 1
	if timer%40 == 0 then
		local Ran = math.random(1,2)
		if Ran == 1 then
			Audio.PlaySound("Shoot1")
			local bullet = CreateProjectile("Fire",430,Player.y)
			bullet.SetVar("MType",4)
			bullet.sprite.Scale(2,2)
			table.insert(bullets,bullet)
			local bullet = CreateProjectile("Spike",400,Player.y)
			bullet.SetVar("Type",2)
			bullet.SetVar("MType",2)
			bullet.ppcollision = true
			table.insert(bullets,bullet)
		elseif Ran == 2 then
			Audio.PlaySound("Shoot1")
			local bullet = CreateProjectile("Fire",-430,Player.y)
			bullet.SetVar("MType",5)
			bullet.sprite.Scale(2,2)
			table.insert(bullets,bullet)
			local bullet = CreateProjectile("Spike",-400,Player.y)
			bullet.SetVar("Type",2)
			bullet.SetVar("MType",1)
			bullet.ppcollision = true
			table.insert(bullets,bullet) 
		end
	end
	if timer%20 == 0 then
		local bullet = CreateProjectile("SmallSpike_Up",Player.x,100)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",3)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet) 
	end
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.Move(5,0)
		elseif bullet.GetVar("MType") == 2 then
			bullet.Move(-5,0)
			bullet.sprite.rotation = 180
		elseif bullet.GetVar("MType") == 3 then
			bullet.sprite.rotation = 180
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.GetVar("timer") >= 40 then
				bullet.Move(0,-5)
				if bullet.GetVar("timer") == 40 then
					Audio.PlaySound("Shoot2")
				end
			else
				bullet.Move(0, 5*(0.1*math.cos(bullet.GetVar("timer")/40)))
			end
		elseif bullet.GetVar("MType") == 4 then
			bullet.Move(-5,0)
			bullet.sprite.rotation = -90
		elseif bullet.GetVar("MType") == 5 then
			bullet.Move(5,0)
			bullet.sprite.rotation = 90
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(2,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(5)
		end
	end
    if timer >= 550 then
        EndWave()
    end
end