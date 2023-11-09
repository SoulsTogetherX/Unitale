timer = 0
bullets = {}

function Update()
    timer = timer + 1
	if timer == 1 or timer == 400 then
		local bullet = CreateProjectile("Sword",-Arena.width/2 + 20, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",1)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 - 20, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",1)
		table.insert(bullets, bullet)
		if timer == 400 then
			local bullet = CreateProjectile("Sword",0 , 400)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",2)
			bullet.SetVar("MType",4)
			bullet.sprite.color = { 1.00 , 0.00 , 0.00 }
			table.insert(bullets, bullet)
		end
	end
	if timer == 100 then
		for i=1,4 do
			local bullet = CreateProjectile("Knife",Player.x + 22*i, -200)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",3)
			table.insert(bullets, bullet)
			local bullet = CreateProjectile("Knife",Player.x - 22*i, -200)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",3)
			table.insert(bullets, bullet)
		end
	end
	if timer >= 160 and timer%40 == 0 and timer <= 300 then
		local bullet = CreateProjectile("Knife", 400, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",6)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife", -400, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",2)
		table.insert(bullets, bullet)
	end
	if timer == 340 then
		for i=1,3 do
			local bullet = CreateProjectile("Knife", -320, Player.y - (22*i))
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",2)
			table.insert(bullets, bullet)
			local bullet = CreateProjectile("Knife", -320, Player.y + (22*i))
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",2)
			table.insert(bullets, bullet)
		end
		for i=1,3 do
			local bullet = CreateProjectile("Knife", Player.x + (22*i), -320)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",3)
			table.insert(bullets, bullet)
			local bullet = CreateProjectile("Knife", Player.x - (22*i), -320)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",3)
			table.insert(bullets, bullet)
		end
	end
	if timer == 400 then
		Sword1 = CreateProjectile("Sword", -Arena.width/2, Arena.height/2 + 10)
		Sword1.sprite.rotation = -90
		Sword1.sprite.yscale = 1.3
		Sword1.SetVar("MType",7)
		Sword2 = CreateProjectile("Sword", Arena.width/2, Arena.height/2 + 10)
		Sword2.sprite.rotation = 90
		Sword2.sprite.yscale = -1.3
		Sword2.SetVar("MType",7)
		Sword1.sprite.color = { 1.00, 0.00 , 0.00 }
		Sword1.sprite.alpha = 0
		Sword1.SetVar("Type", 2)
		Sword2.SetVar("S",math.random(1,2))
		Sword2.sprite.color = { 1.00, 0.00 , 0.00 }
		Sword2.sprite.alpha = 0
		Sword2.SetVar("Type", 2)
		Arena.ResizeImmediate(125, 130)
	end
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 90
			local R2 = 360 - math.abs(R)
			if Player.y - bullet.y > 0 and Player.x - bullet.x < 0 then
				R2 = 360 - R2
			end
			if bullet.GetVar("timer") >= 80 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			else
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
				if bullet.GetVar("timer") <= 36 then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
					bullet.sprite.rotation = R2
				elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) and bullet.GetVar("MType") == 1 then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				end
			end
		elseif bullet.GetVar("MType") == 2 then
			bullet.sprite.rotation = -90
			bullet.Move(8,0)
		elseif bullet.GetVar("MType") == 3 then
			bullet.Move(0,8)
		elseif bullet.GetVar("MType") == 4 then
			bullet.sprite.rotation = 180
			bullet.Move(0,-12)
		elseif bullet.GetVar("MType") == 5 then
			bullet.sprite.rotation = -90
			bullet.sprite.xscale = -1
			bullet.Move(0,-12)
		elseif bullet.GetVar("MType") == 6 then
			bullet.sprite.rotation = 90
			bullet.Move(-12,0)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(4,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(99)
		end
	end
    if timer >= 540 then
		Audio.LoadFile("009_inimicial-forthcoming")
		Audio.Volume(1)
		Audio.Pitch(1.4)
        EndWave() 
    end
end