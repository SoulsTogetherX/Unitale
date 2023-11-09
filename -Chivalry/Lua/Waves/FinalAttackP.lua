timer = 0
I = 0
bullets = {}
Arena.ResizeImmediate(75, 200)
A = 50

function Update()
    timer = timer + 1
	if timer%100 == 0 and timer > 0 and timer < 400 then
		local bullet = CreateProjectile("Sword",0, Arena.height/2 + 100)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		table.insert(bullets, bullet) 
		Audio.PlaySound("Shoot2")
	end
	if (timer + 50)%100 == 0 and timer > 50 and timer < 400 then
		local bullet = CreateProjectile("Sword",-Arena.width/2 + 10, Arena.height/2 + 100)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 - 10, Arena.height/2 + 100)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		table.insert(bullets, bullet)
		Audio.PlaySound("Shoot2")
	end
	if timer%50 == 0 and timer < 400 then
		local bullet = CreateProjectile("Sword",-Arena.width/2 - 60, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",4)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 + 60, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",3)
		table.insert(bullets, bullet)
		Audio.PlaySound("Shoot3")
	end
	if timer == 420 then
		Arena.Resize(75, 16)
	end
	if timer == 450 then
		Arena.Resize(75, 50)
		local bullet = CreateProjectile("Knife",Arena.width/2 + 20, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",3)
		table.insert(bullets, bullet)
	end
	if timer >= 500 then
		if timer%10 == 0 and timer <= 520 then
			local bullet = CreateProjectile("Knife",-Arena.width/2 + (I*20), Arena.height/2 + 20)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",2)
			table.insert(bullets, bullet)
			I = I + 1
			Audio.PlaySound("Shoot1")
		end
	end
	if timer >= 560 and timer <= 580 and timer%4 == 0 then
		local bullet = CreateProjectile("Sword",Arena.width/2 + 60, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",6)
		bullet.SetVar("MType",1)
		table.insert(bullets, bullet)
	end
	if timer == 680 then
		Arena.Resize(16, 50)
		Arena.Move(-(75-16)/2,0, false, false)
	end
	if timer == 700 then
		Arena.Resize(16, 250)
		Arena.Move(0,125/2, false, false)
	end
	if timer > 750 and timer%20 == 0 and timer <= 1010 then
		local bullet = CreateProjectile("Sword",0, Arena.height/2 + 60)
		Audio.PlaySound("Shoot2")
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		local C = math.random(1,2)
		if C == 1 then
			bullet.SetVar("Type",4)
			bullet.sprite.color = { 1.00, 0.65, 0.00 }
		elseif C == 2 then
			bullet.SetVar("Type",5)
			bullet.sprite.color = { 0.02, 0.37, 0.97 }
		end
		bullet.SetVar("MType",5)
		table.insert(bullets, bullet)
	end
	if timer == 1100 then
		Arena.Resize(155, 155)
		Arena.Move(155/4,155/4, false, false)
	end
	if timer == 1200 then
		local bullet = CreateProjectile("Sword", 0, -Arena.height/2 - 50)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",3)
		bullet.SetVar("MType",6)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword", 0, Arena.height/2 + 50)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",3)
		bullet.SetVar("MType",6)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword", Arena.width/2 + 50, 0)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",3)
		bullet.SetVar("MType",6)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword", -Arena.width/2 - 50, 0)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",3)
		bullet.SetVar("MType",6)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
	end
	if timer == 1280 then
		Audio.PlaySound("Shoot2")
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
				if bullet.GetVar("timer") == 80 then
					Audio.PlaySound("Shoot1")
				end
			else
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
				if bullet.GetVar("timer") <= 36 then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
					bullet.sprite.rotation = R2
				elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				end
			end
		elseif bullet.GetVar("MType") == 2 then
			bullet.Move(0,-5)
			bullet.sprite.rotation = 180
		elseif bullet.GetVar("MType") == 3 then
			bullet.sprite.rotation = 90
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.GetVar("timer") < 30 then
				bullet.Move(-1*math.cos(bullet.GetVar("timer")/30), 0)
			else
				bullet.Move(-5,0)
			end
		elseif bullet.GetVar("MType") == 4 then
			bullet.sprite.rotation = -90
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.GetVar("timer") < 30 then
				bullet.Move(1*math.cos(bullet.GetVar("timer")/30), 0)
			else
				bullet.Move(5,0)
			end
		elseif bullet.GetVar("MType") == 5 then
			bullet.Move(0,-5)
			bullet.sprite.rotation = 90
		elseif bullet.GetVar("MType") == 6 then
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
				elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(3,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(5)
		elseif bullet.GetVar("Type") == 3 then
			Player.Hurt(99)
        elseif bullet.GetVar("Type") == 4 and not Player.isMoving then
    	   	Player.Hurt(4)
    	elseif bullet.GetVar("Type") == 5 and Player.isMoving then
    	    Player.Hurt(4)
    	elseif bullet.GetVar("Type") == 6 and Player.isMoving then
    	    Player.Hurt(5,0.2)
		end
	end
    if timer >= 1400 then
		SetGlobal("FAttack",false)
		SetGlobal("PacEnd",true)
        EndWave() 
    end
end