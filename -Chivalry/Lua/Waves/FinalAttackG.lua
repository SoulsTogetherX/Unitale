timer = 0
bullets = {}
bullets2 = {}
bullets3 = {}
Arena.ResizeImmediate(16, 16)
Arena.Move(0,100, true, true) 
I = 0
A = 250
Ra = 0
E = false
function Update()
    timer = timer + 1
	if timer == 1 then
		local bullet = CreateProjectile("Sword",-Arena.width/2 - 50, -Arena.height/2 - 50)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",-Arena.width/2 - 50, Arena.height/2 + 50)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 + 50, -Arena.height/2 - 50)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 + 50, Arena.height/2 + 50)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",2)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
	end
	if timer == 80 then
		Arena.Resize(250, 250)
		Arena.Move(0,-125, false, false)
		Player.MoveTo(0,0,false)
	end
	if timer == 90 then
		F = CreateProjectile("Fire",0, 0)
		F.SetVar("Type",1)
	end
	if timer > 110 and timer%10 == 0 and timer ~= 140 and timer < 180 then
		I = I + 1
		Audio.PlaySound("Shoot1") 
		local bullet = CreateProjectile("Knife", 100, 25*I)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",3)
		bullet.ppcollision = true
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife", -100, -25*I)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",4)
		bullet.ppcollision = true
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife", 25*I, 100)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",5)
		bullet.ppcollision = true
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife",-25*I, -100)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",6)
		bullet.ppcollision = true
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
	end
	if E == false then
		if timer == 180 then
			SetGlobal("Sweat",1)
			R = 0
			Fire = CreateProjectile("Fire", 400 * math.cos(R), 400 * math.sin(R))
			local distance = math.sqrt((Player.x - Fire.x)^2 + (Player.y - Fire.y)^2)
			SetGlobal("distance_x", ((Player.x - Fire.x) / distance)*15)
			SetGlobal("distance_y", ((Player.y - Fire.y) / distance)*15)
			Fire.SetVar("time", 50)
			Fire.SetVar("Type", 2)
			Fire.sprite.color = { 1.00, 0.00, 0.00 }
			table.insert(bullets2, Fire)
			Sword = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
			Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 270
			Sword.SetVar("time", 0)
			Sword.sprite.color = { 1.00, 0.00, 0.00 }
			r = 100
		end
		if timer%10 == 0 and timer < 180 and timer > 160 then
			Audio.PlaySound("alarm")
		end
		if timer > 180 then
			if A > 110 then
				A = A - 0.5
				Arena.ResizeImmediate(A, A)
				Arena.Move(0,0.25, true, false) 
			else
				Sword.remove()
				E = true
			end
			if F.isactive == true then
				F.remove()
			end
			if timer%60 == 0 then
				local bullet = CreateProjectile("Knife", Arena.width/2, Arena.height/2)
				bullet.ppcollision = true
				bullet.SetVar("timer",0)
				bullet.SetVar("Type",2)
				bullet.SetVar("MType",2)
				bullet.ppcollision = true
				bullet.sprite.color = { 1.00, 0.00, 0.00 }
				table.insert(bullets, bullet)
				local bullet = CreateProjectile("Knife", -Arena.width/2, Arena.height/2)
				bullet.ppcollision = true
				bullet.SetVar("timer",0)
				bullet.SetVar("Type",2)
				bullet.SetVar("MType",2)
				bullet.ppcollision = true
				bullet.sprite.color = { 1.00, 0.00, 0.00 }
				table.insert(bullets, bullet)
			end
			Sword.SetVar("time", Sword.GetVar("time") + 1)
			if timer%2 == 0 then
				if Fire.isactive == true and timer > 5 then
					Fire = CreateProjectile("Fire", GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y)
					Fire.sprite.color = { 1.00, 0.00, 0.00 }
					Sword.MoveTo(GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y-5)
					Sword.SendToTop()
					Fire.SetVar("time", 50)
					Fire.SetVar("Type", 2)
					table.insert(bullets2, Fire)
				end
				if (Sword.GetVar("time") + 40)%r == 0 then
					if Fire.isactive == true then
						r = 50
						R = math.random() * 6.2
						local distance = math.sqrt((Player.x - Fire.x)^2 + (Player.y - Fire.y)^2)
						SetGlobal("distance_x", ((Player.x - Fire.x) / distance)*13)
						SetGlobal("distance_y", ((Player.y - Fire.y) / distance)*13)
						Fire.SetVar("time", 100)
						Fire.SetVar("Type", 2)
						table.insert(bullets2, Fire)
						Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 270
					end
				end
			end
		end
	end
	if timer == 540 then
		Arena.Resize(100, 50)
		Arena.Move(0,-125, false, false)
	end
	if timer == 540 then
		SetGlobal("Sweat",2)
		for i = 1, 6 do
			local W = math.random(-Arena.width/2 + 20, Arena.width/2 - 20)
			local bullet = CreateProjectile("Sword",400, i*60 - 150)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",2)
			bullet.SetVar("W",W + 60)
			bullet.SetVar("MType",7)
			bullet.sprite.color = { 1.00, 0.00, 0.00 }
			table.insert(bullets, bullet)
			local bullet = CreateProjectile("Sword",-400, i*60 - 150)
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",2)
			bullet.SetVar("W",W - 60)
			bullet.SetVar("MType",8)
			bullet.sprite.color = { 1.00, 0.00, 0.00 }
			table.insert(bullets, bullet)
		end
	end
	if timer > 620 and timer < 830 then
		Arena.Move(0,2, false, false)
	end
	if timer > 870 and timer < 1350 then
		for i = 1,#bullets do
			local bullet = bullets[i]
			if bullet.GetVar("MType") == 7 or bullet.GetVar("MType") == 8 then
				bullet.Move(0,1)
			end
		end
		if timer < 1200 then
			Arena.Move(0,-1, false, false)
		end
	end
	if timer == 1300 then
		SetGlobal("Sweat",3)
		local bullet = CreateProjectile("Sword", 0, 100)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",9)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets2 do
		bullet = bullets2[i]
		bullet.SetVar("time", bullet.GetVar("time") - 1)
		bullet.sprite.alpha =  bullet.GetVar("time")/20
		if bullet.GetVar("time") <= 20 and bullet.isactive == true then
			bullet.SetVar("Type", 0)
		end
		if bullet.GetVar("time") <= 1 and bullet.isactive == true then
			bullet.remove()
		end
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
					Audio.PlaySound("Shoot2") 
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
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 90
			local R2 = 360 - math.abs(R)
			if Player.y - bullet.y > 0 and Player.x - bullet.x < 0 then
				R2 = 360 - R2
			end
			if bullet.GetVar("timer") >= 80 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
				if bullet.GetVar("timer") == 80 then
					Audio.PlaySound("Shoot2") 
				end
			else
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*10)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*10)
				if bullet.GetVar("timer") <= 36 then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
					bullet.sprite.rotation = R2
				elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				end
				bullet.Move(bullet.GetVar("distance_x")*(-0.1*math.cos(timer/80)), bullet.GetVar("distance_y")*(-0.1*math.cos(timer/80)))
			end
		elseif bullet.GetVar("MType") == 3 then
			bullet.Move(-5,0)
			bullet.sprite.rotation = 90
		elseif bullet.GetVar("MType") == 4 then
			bullet.Move(5,0)
			bullet.sprite.rotation = -90
		elseif bullet.GetVar("MType") == 5 then
			bullet.Move(0,-5)
			bullet.sprite.rotation = 180
		elseif bullet.GetVar("MType") == 6 then
			bullet.Move(0,5)
			bullet.sprite.rotation = 0
		elseif bullet.GetVar("MType") == 7 then
			if bullet.x > bullet.GetVar("W") then
				bullet.Move(-5,0)
			end
			bullet.sprite.rotation = 90
		elseif bullet.GetVar("MType") == 8 then
			if bullet.x < bullet.GetVar("W") then
				bullet.Move(5,0)
			end
			bullet.sprite.rotation = -90
		elseif bullet.GetVar("MType") == 9 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 90
			local R2 = 360 - math.abs(R)
			if Player.y - bullet.y > 0 and Player.x - bullet.x < 0 then
				R2 = 360 - R2
			end
			if bullet.GetVar("timer") >= 160 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
				if bullet.GetVar("timer") == 160 then
					Audio.PlaySound("Shoot3") 
				end
			else
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*2)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*2)
				if bullet.GetVar("timer") <= 72 then
					bullet.sprite.rotation = bullet.sprite.rotation + 5
				elseif bullet.sprite.rotation >= R2 - 5 and bullet.sprite.rotation <= R2 + 5 then
					bullet.sprite.rotation = R2
				elseif (bullet.sprite.rotation <= R2 - 5 or bullet.sprite.rotation >= R2 + 5) then
					bullet.sprite.rotation = bullet.sprite.rotation + 5
				end
				bullet.Move(bullet.GetVar("distance_x")*(-0.1*math.cos(timer/80)), bullet.GetVar("distance_y")*(-0.1*math.cos(timer/80)))
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(4,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(99)
		end
	end
    if timer >= 1560 then
		SetGlobal("FAttack",false)
		SetGlobal("GenEnd",true)
        EndWave() 
    end
end