timer = 0
tim = 0
Audio.Play()
bullets = {}
bullets1 = {}
bullets2 = {}
bullets3 = {}
bullets4 = {}
bullets5 = {}
bullets6 = {}
bullets7 = {}
bullets8 = {}
bullets9 = {}
bullets10 = {}
Pole1 = {}
Pole2 = {}
Arena.ResizeImmediate(200, 150)
Arena.Move(0, 100, true, true)
I1 = 3
I2 = 3
function Update()
	timer = timer + 1
	if timer > 1000 then
		if timer%20 == 0 and timer < 1400 then
			local bullet = CreateProjectile("SmallSpike",Arena.width/2,math.random(Arena.height/2,-Arena.height/2))
			Audio.PlaySound("Shoot2")
			bullet.SetVar("Type",1)
			table.insert(bullets5,bullet)
		end
		if timer%25 == 0 and timer < 1400 then
			local Cross = CreateProjectile("CrossHair",Player.x,Player.y)
			Cross.sprite.Scale(2,2)
			Cross.SetVar("S",2)
			Cross.SetVar("B",0)
			Cross.SetVar("Y",0)
			Cross.sprite.color = { 1.00, Cross.GetVar("Y"), Cross.GetVar("B")}
			table.insert(bullets8,Cross)
		end
		for i=1, #bullets8 do
			bullet = bullets8[i]
			if bullet.isactive == true then
				bullet.sprite.rotation = bullet.sprite.rotation + (270 / 50)
				bullet.SetVar("S",bullet.GetVar("S") - (1/50))
				bullet.sprite.Scale(bullet.GetVar("S"),bullet.GetVar("S"))
				bullet.SetVar("B", bullet.GetVar("B") + 0.02)
				bullet.SetVar("Y", bullet.GetVar("Y") + 0.02)
				bullet.sprite.color = { 1.00, bullet.GetVar("Y"), bullet.GetVar("B")}
				if bullet.sprite.rotation >= 270 then
					Audio.PlaySound("Break2")
					local Boom = CreateProjectile("Boom",bullet.x,bullet.y)
					Boom.ppcollision = true
					Boom.sprite.Scale(0.1,0.1)
					Boom.SetVar("S",0.1)
					Boom.SetVar("Type",2)
					table.insert(bullets9,Boom)
					bullet.remove()
				end
			end
		end
		for i=1, #bullets9 do
			bullet = bullets9[i]
			if bullet.isactive == true then
				bullet.SetVar("S",bullet.GetVar("S") + (1/25))
				bullet.sprite.alpha = 2 - bullet.GetVar("S")
				bullet.sprite.Scale(bullet.GetVar("S"),bullet.GetVar("S"))
				if bullet.sprite.xscale >= 2 then
					bullet.remove()
				end
			end
		end
	end
	if timer > 600 then
		if timer%15 == 0 and timer < 850 then
			local R = (200*math.random()) + 150
			local R2 = math.random() * ((400/6.2) * (R/1))
			local bullet = CreateProjectile("Zero",R * math.cos(R2),R * math.sin(R2))
			local M = math.random(1,2)
			if M == 1 then
				bullet.sprite.SetAnimation({"Zero","One"},1) 
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				local distance_x = ((Player.x - bullet.x) / distance)*5
				local distance_y = ((Player.y - bullet.y) / distance)*5
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",2)
				table.insert(bullets7,bullet)
			elseif M == 2 then
				bullet.sprite.SetAnimation({"One","Zero"},1)
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				local distance_x = ((Player.x - bullet.x) / distance)*5
				local distance_y = ((Player.y - bullet.y) / distance)*5
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",2)
				table.insert(bullets7,bullet)
			end
		end
		for i=1, #bullets7 do
			bullet = bullets7[i]
			if bullet.isactive == true then
				bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
				if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			end
		end
	end
	if timer == 500 then
		Shoot = CreateProjectile("Shooter",0,250)
		Shoot.SetVar("R",0)
		Shoot2 = CreateProjectile("Shooter",0,-50)
		Shoot2.SetVar("R",0)
		Shoot2.sprite.rotation  = 180
		A = 1
		B = math.random(25,110)
		c = false
	elseif timer > 500 then
		if c == true then
			tim = tim + 1
			if tim >= 20 then
				c = false
				tim = 0
			end
		end
		if timer > 25 then
			Shoot.SetVar("R",Shoot.GetVar("R") + (2*A))
			Shoot.MoveTo(Shoot.GetVar("R"),150)
			Shoot2.SetVar("R",Shoot.GetVar("R") + (2*A))
			Shoot2.MoveTo(-Shoot.GetVar("R"),-150)
			if (timer%B == 0 or Shoot.x < (-Arena.width/2 + 10) or Shoot.x > (Arena.width/2 - 10)) and c ~= true then
				A = A * (-1)
				B = math.random(25,110)
				c = true
			end
			if timer%16 == 0 and timer < 800 then
				Audio.PlaySound("Shoot3")
				local bullet = CreateProjectile("Pixel",Shoot.x,Shoot.y - 15)
				bullet.SetVar("MType",1)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(2,2)
				table.insert(bullets6,bullet)
				local bullet = CreateProjectile("Pixel",Shoot2.x,Shoot2.y + 15)
				bullet.SetVar("MType",2)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(2,2)
				table.insert(bullets6,bullet)
			end
			if timer > 800 then
				Shoot.sprite.alpha = Shoot.sprite.alpha - 0.1
				if Shoot.sprite.alpha <= 0 then
					Shoot.SetVar("Type",0)
				end
				Shoot2.sprite.alpha = Shoot2.sprite.alpha - 0.1
				if Shoot2.sprite.alpha <= 0 then
					Shoot2.SetVar("Type",0)
				end
			end
		end
		for i=1, #bullets6 do
			bullet = bullets6[i]
			if bullet.isactive == true then
				if bullet.GetVar("MType") == 1 then
					bullet.Move(0,-5)
				elseif bullet.GetVar("MType") == 2 then
					bullet.Move(0,5)
				end
				if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			end
		end
	end
	if timer == 250 then
		Pole = CreateProjectile("Pole",-520,0)
		Pole.sprite.Scale(2,2)
		Pole.sprite.rotation = -90
		Lancher = CreateProjectile("Lancher",-340,0)
		Lancher.sprite.rotation = 180
		Lancher.sprite.Scale(1,1)
	elseif timer > 300 and timer <= 450 then
		if Lancher.x < -300 then
			Lancher.Move(2,0)
		end
		Pole.MoveTo(Lancher.x - 180,Lancher.y)
		if timer == 450 then
			Audio.PlaySound("Shoot1")
			local B = CreateProjectile("bullet",Lancher.x + 20,Lancher.y)
			B.SetVar("Type",2)
			B.ppcollision = true
			B.sprite.color = {1.00, 0.00, 0.00}
			B.SetVar("Gravity",0.05)
			B.SetVar("VSpeed",0)
			B.SetVar("HSpeed",5)
			B.SetVar("Type",3)
			table.insert(bullets4,B)
			Pole.remove()
			Lancher.remove()
		end
	end
	if timer >= 300 and timer <= 420 then
		if timer%5 == 0 then
			Audio.PlaySound("Shoot2")
			local bullet = CreateProjectile("SmallSpike",Arena.width/2,math.random(-15,-Arena.height/2))
			bullet.SetVar("Type",1)
			table.insert(bullets5,bullet)
		end
	end
	if timer == 200 then
		for i=1,4 do
			local Pole = CreateProjectile("Pole",-Arena.width/2 - 50 + (i*50),580 + (i*20))
			Pole.sprite.Scale(2,2)
			local Lancher = CreateProjectile("Lancher",-Arena.width/2 - 50 + (i*50),400 + (i*20))
			Lancher.sprite.rotation = -90
			Lancher.sprite.Scale(1,1)
			table.insert(bullets3,Lancher)
			table.insert(Pole1,Pole)
		end
	elseif timer > 200 then
		for i=1,#bullets3 do
			bullet = bullets3[i]
			if bullet.isactive == true then
				Pole = Pole1[i]
				if bullet.y > 100 and bullet.GetVar("B") == nil then
					bullet.Move(0,-2)
				elseif bullet.GetVar("B") == nil then
					local B = CreateProjectile("bullet",bullet.x,bullet.y - 20)
					B.SetVar("Type",2)
					B.ppcollision = true
					B.SetVar("Gravity",0.05)
					B.SetVar("VSpeed",-0.5)
					B.SetVar("HSpeed",0)
					B.SetVar("Timer",0)
					table.insert(bullets,B)
					bullet.SetVar("B",B)
					Audio.PlaySound("Shoot1")
				else
					if bullet.y < 400 then
						bullet.Move(0,2)
					end
				end
				if Pole.isactive == true then
					Pole.MoveTo(bullet.x,bullet.y + 180)
					Pole.SendToTop()
				end
				bullet.SendToTop()
			end
		end
	end
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
			distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			if bullet.GetVar("Timer") < 100 then
				if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
					bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-bullet.GetVar("Gravity"))
				elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
					bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+bullet.GetVar("Gravity"))
				end
				if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
					bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-bullet.GetVar("Gravity"))
				elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
					bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+bullet.GetVar("Gravity"))
				end
			else
				bullet.sprite.alpha = bullet.sprite.alpha - 0.1
				if bullet.sprite.alpha <= 0 then
					bullet.SetVar("Type",0)
				end
			end
			bullet.sprite.rotation = math.deg(math.atan2((bullet.y + bullet.GetVar("VSpeed")) - bullet.y, (bullet.x + bullet.GetVar("HSpeed")) - bullet.x)) + 180
			bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
		end
	end
	for i=1,#bullets4 do
		bullet = bullets4[i]
		if bullet.isactive == true then
			distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-bullet.GetVar("Gravity"))
			elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+bullet.GetVar("Gravity"))
			end
			if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-bullet.GetVar("Gravity"))
			elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+bullet.GetVar("Gravity"))
			end
			bullet.sprite.rotation = math.deg(math.atan2((bullet.y + bullet.GetVar("VSpeed")) - bullet.y, (bullet.x + bullet.GetVar("HSpeed")) - bullet.x)) + 180
			bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
		end
	end
	for i=1,#bullets5 do
		bullet = bullets5[i]
		if bullet.isactive == true then
			bullet.Move(-3,0)
			if bullet.x < -Arena.width/2 then
				bullet.remove()
			end
		end
	end
	if timer == 50 then
		for i=1,6 do
			local bullet = CreateProjectile("Zero",Arena.width/2,200 + (i*30))
			local M = math.random(1,2)
			if M == 1 then
				bullet.sprite.SetAnimation({"Zero","One"},1) 
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", -2)
				bullet.SetVar("Type",1)
				table.insert(bullets1,bullet)
			elseif M == 2 then
				bullet.sprite.SetAnimation({"One","Zero"},1)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", -2)
				bullet.SetVar("Type",1)
				table.insert(bullets1,bullet)
			end
		end
		for i=1,6 do
			local bullet = CreateProjectile("Zero",-Arena.width/2,200 + (i*30))
			local M = math.random(1,2)
			if M == 1 then
				bullet.sprite.SetAnimation({"Zero","One"},1) 
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", -2)
				bullet.SetVar("Type",1)
				table.insert(bullets2,bullet)
			elseif M == 2 then
				bullet.sprite.SetAnimation({"One","Zero"},1)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", -2)
				bullet.SetVar("Type",1)
				table.insert(bullets2,bullet)
			end
		end
	end
	for i=1, #bullets1 do
		bullet = bullets1[i]
		if bullet.isactive == true then
			bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
			if bullet.y <= -Arena.height/2 then
				for i=1, #bullets1 do
					bullet = bullets1[i]
					if i == math.random(1,6) then
						if bullet.GetVar("M") == nil then
							bullet.SetVar("M",I1/3)
							I1 = I1 + 1
						end
					end
					if bullet.GetVar("M") ~= nil then
						bullet.SetVar("distance_x", -bullet.GetVar("M"))
					end
					bullet.SetVar("distance_y", 0)
				end
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y > 500 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	for i=1, #bullets2 do
		bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
			if bullet.y <= -Arena.height/2 then
				for i=1, #bullets2 do
					bullet = bullets2[i]
					if i == math.random(1,6) then
						if bullet.GetVar("M") == nil then
							bullet.SetVar("M",I2/3)
							I2 = I2 + 1
						end
					end
					if bullet.GetVar("M") ~= nil then
						bullet.SetVar("distance_x", bullet.GetVar("M"))
					end
					bullet.SetVar("distance_y", 0)
				end
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y > 500 then
				if bullet.isactive == true then
					bullet.remove()
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
		end
	end
    if timer >= 1550 then
		SetGlobal("FinalAttackDone",true)
		Audio.Pause()
       		EndWave()
    end
end