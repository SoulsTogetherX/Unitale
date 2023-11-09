timer = 0
bullets = {}
bullets2 = {}
MoveToPlayer = {}
Fire = CreateProjectile("Fire1",0,400)
Fire.sprite.rotation = -45
Fire.sprite.xscale = 5
Fire.sprite.yscale = 5
Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
Rock = CreateProjectile("Rock1",0,400)
Rock.sprite.xscale = 3
Rock.sprite.yscale = 3
R = 0
B = 1
C = 0
Gravity = 0.03
Rotation = math.pi/8.5
Attack = false
Rad = 100

Star1 = CreateProjectile("Star",9999,9999)
Star1.remove()
Star2 = CreateProjectile("Star",9999,9999)
Star2.remove()

function Update()
    timer = timer + 1
	if timer == 1 then
		Audio.LoadFile("Space-Trip")
		Audio.Volume(0.6)
		Audio.Pitch(1.2)
	end
	if Rock.isactive == true and Fire.isactive == true then
		Rock.MoveTo(Rock.x-5,Rock.y-8)
		Rock.sprite.rotation = timer*5
		Fire.MoveTo(Rock.x+50,Rock.y+50)
		Fire.sprite.xscale = 5
		Fire.sprite.yscale = 5
		for i=1,2 do
			local bullet = CreateProjectile("pixel",Rock.x+(math.random()*50),Rock.y+(math.random()*50))
			bullet.sprite.xscale = 1
			bullet.sprite.yscale = 1
			bullet.SetVar("Type",1)
			table.insert(bullets, bullet)
		end
		if Rock.y < -250 then
			Rock.remove()
			Fire.remove()
		end
	elseif timer == 100 then
		Time = CreateProjectile("circle",0,0)
		Time.sprite.xscale = 0.01
		Time.sprite.yscale = 0.01
		Time.sprite.alpha = 0.5
	elseif timer > 100 and timer < 150 then
		Time.sprite.xscale = Time.sprite.xscale + 0.6
		Time.sprite.yscale = Time.sprite.yscale + 0.6
		Player.SetControlOverride(true)
	elseif timer == 150 then
		Player.SetControlOverride(false)
		Time.remove()
		MoveToPlayer = bullets
		bullets = {}
		for i=1,#MoveToPlayer do
			local bullet = MoveToPlayer[i]
			if bullet.isactive == true then
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", (((Player.x+(math.random()*50)) - bullet.x) / distance)*3)
				bullet.SetVar("distance_y", (((Player.y+(math.random()*50)) - bullet.y) / distance)*3)
			end
		end
	end
	if timer < 100 then
		for i=1,#bullets do
			local bullet = bullets[i]
			bullet.MoveTo(bullet.x-0.1,bullet.y-0.1*(8/5))
		end
	end
	for i=1,#MoveToPlayer do
		local bullet = MoveToPlayer[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
		end
		if bullet.x < -320 or bullet.y < -250 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	if timer >= 200 then
		if timer == 300 then
			Player.SetControlOverride(false)
			Time.remove()
		end
		if Time.isactive == false then
			if timer%20 == 0 then
				B = B * (-1)
			end
			if timer%1 == 0 then
				C = C + 1
			end
			if timer%2 == 0 and timer <= 650 then
				R = R + (1 * B)
				local bullet = CreateProjectile("Star",200*math.cos(R),200*math.sin(R))
				local distance = math.sqrt((math.cos(C) - bullet.x)^2 + (math.sin(C) - bullet.y)^2)
				bullet.SetVar("distance_x", ((math.cos(C) - bullet.x) / distance)*(math.sin(C)*3))
				bullet.SetVar("distance_y", ((math.sin(C) - bullet.y) / distance)*(math.cos(C)*3))
				bullet.SetVar("Type", 2)
				bullet.SetVar("B_Type", 1)
				table.insert(bullets, bullet)

			end

			if timer%2 == 0 and timer <= 650 then
		
				local bullet = CreateProjectile("Star",200*math.cos(R),200*math.sin(R))
				local distance = math.sqrt((math.cos(C) - bullet.x)^2 + (math.sin(C) - bullet.y)^2)
				bullet.SetVar("distance_x", ((math.cos(C) - bullet.x) / distance)*(math.sin(C)*3))
				bullet.SetVar("distance_y", ((math.sin(C) - bullet.y) / distance)*(math.cos(C)*3))
				bullet.SetVar("Type", 2)
				bullet.SetVar("B_Type", 1)
				table.insert(bullets, bullet)

			end
			for i=1,#bullets do
				local bullet = bullets[i]
				if bullet.isactive then
					if bullet.GetVar("B_Type") == 1 then
						bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
						if timer == 900 then
							bullet.sprite.SetAnimation({"StarD1", "StarD2", "StarD3","StarD4"},1/8) 
							bullet.sprite.loopmode = "ONESHOT"
							bullet.SetVar("Type", -1)
						elseif bullet.sprite.animcomplete == true then
							bullet.remove()
						end
					elseif bullet.GetVar("B_Type") == 2 then
						bullet.MoveTo(bullet.GetVar("R")*math.cos(bullet.GetVar("Rotation")), bullet.GetVar("R")*math.sin(bullet.GetVar("Rotation"))+130)
						if bullet.GetVar("R") < bullet.GetVar("End_R") then
							bullet.SetVar("R",bullet.GetVar("R") + 1 + ((bullet.GetVar("End_R"))^2-(bullet.GetVar("R"))^2)/1000)
						else
							bullet.SetVar("Type", 2)
						end
						if timer >= 1400 and timer <= 1420 then
							if (timer/2)%2 == 0 then
								bullet.sprite.color = {1, 0, 0}
							elseif (timer/2)%2 ~= 0 then
								bullet.sprite.color = {1, 1, 0}
							end
						elseif timer == 1421 then
							bullet.SetVar("End_R",180)
							bullet.sprite.color = {1, 1, 1}
						elseif timer == 1500 then
							local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
							bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
							bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
							table.insert(bullets2, bullet)
							bullet.SetVar("B_Type",-1)
						end
					elseif bullet.GetVar("B_Type") == 3 then
						bullet.Move(0,bullet.GetVar("Speed_y"))
						if bullet.y > -Arena.height/2 + 10 then
							bullet.SetVar("Speed_y",bullet.GetVar("Speed_y")-0.08)
						elseif bullet.GetVar("Speed_y") <= 0 then
							bullet.SetVar("Speed_y",0)
						end
						if bullet.GetVar("Speed_y") < 0 and bullet.x ~= 0 then
							if bullet.sprite.rotation ~= 180 then
								local R = math.abs(bullet.x)/bullet.x
								bullet.sprite.rotation = 5 * R + bullet.sprite.rotation
							end
						elseif bullet.GetVar("Speed_y") < 0 and bullet.x == 0 then
							if bullet.sprite.yscale > -1 then
								bullet.sprite.yscale = bullet.sprite.yscale - 2/36
							end
						end
						if bullet.x == 0 and bullet.GetVar("timer") <= 25 then
							bullet.SetVar("timer",bullet.GetVar("timer")+1)
							if bullet.GetVar("timer")%5 == 0 then
								Spike = CreateProjectile("Spike",(-Arena.width/10)*(((5-bullet.GetVar("Speed_y")))/0.4),-Arena.height/2)
								Spike.SetVar("B_Type", 3)
								Spike.SetVar("Speed_y", 5 - bullet.GetVar("timer")/22)
								Spike.SetVar("Type", 3)
								table.insert(bullets, Spike)

								Spike = CreateProjectile("Spike",(Arena.width/10)*(((5-bullet.GetVar("Speed_y")))/0.4),-Arena.height/2)
								Spike.SetVar("B_Type", 3)
								Spike.SetVar("Speed_y", 5 - bullet.GetVar("timer")/22)
								Spike.SetVar("Type", 3)
								table.insert(bullets, Spike)
	
							end
						end
					elseif bullet.GetVar("B_Type") == 4 then
						distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
						bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
						bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
						if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
							bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-Gravity)
						elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
							bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+Gravity)
						end
						if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
							bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-Gravity)
						elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
							bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+Gravity)
						end
						bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
						if bullet.GetVar("B_Type") == 4 and bullet.sprite.animcomplete == true and bullet.isactive == true then
							bullet.remove()
						end
					end
				end
				
				if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			end
		end
	end
	if timer > 640 and timer < 670 then
		if Encounter.GetVar("BY") >= 0.9 or Encounter.GetVar("BY") < 0.905 then
			SetGlobal("Animate",false)
		end
	elseif timer == 670 then
		SetGlobal("Charge",true)
	end
	
	if timer == 780 then
		for j = 0,2 do
			for i = 3,8 do
				local bullet = CreateProjectile("Star",0,130)
				bullet.SetVar("R",0)
				bullet.SetVar("End_R",165 - (45*j))
				bullet.SetVar("Rotation",-(math.pi*i)/10)
				bullet.SetVar("B_Type", 2)
				table.insert(bullets, bullet)
			end
		end
	end
	if timer == 790 then
		Fire2 = CreateProjectile("Fire1",0,170)
		Fire2.sprite.xscale = 3
		Fire2.sprite.yscale = 3
		Fire2.SetVar("Type",3)
		Fire2.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Rock2 = CreateProjectile("Rock1",0,130)
		Rock2.sprite.xscale = 2.5
		Rock2.sprite.yscale = 2.5
		Rock2.SetVar("Type",3)
		local distance = math.sqrt((Arena.width/2 - Rock2.x)^2 + (Arena.height/2 - Rock2.y)^2)
		Rock2.SetVar("distance_x", ((Arena.width/2 - Rock2.x) / distance)*10)
		Rock2.SetVar("distance_y", ((Arena.height/2 - Rock2.y) / distance)*10)
		Fire2.sprite.alpha = 0
		Rock2.sprite.alpha = 0
	elseif timer > 790 and timer <= 805 then
		Fire2.sprite.alpha = (timer-790)/10
		Rock2.sprite.alpha = (timer-790)/10
		Fire2.move(0,-0.5)
		Fire2.sprite.xscale = 3
		Fire2.sprite.yscale = 3
		Rock2.move(0,-0.5)
	elseif timer > 805 and Rock2.isactive == true then
		Fire2.move(0,-10)
		Fire2.sprite.xscale = 3
		Fire2.sprite.yscale = 3
		Rock2.move(0,-10)
		if Rock2.y <= -Arena.height/2 then
			Fire2.remove()
			Rock2.remove()
			local bullet = CreateProjectile("Spike",0,-Arena.height/2)
			bullet.SetVar("B_Type", 3)
			bullet.SetVar("Speed_y", 5)
			bullet.SetVar("timer",0)
			bullet.SetVar("Type", 3)
			table.insert(bullets, bullet)
		end
	end
	if timer >= 810 and timer <= 1000 then
		if Star1.isactive == false then
			Star1 = CreateProjectile("Star",Rock2.x,Rock2.y)
			Star1.SetVar("VSpeed",1)
			Star1.SetVar("HSpeed",-3)
			Star1.SetVar("Type", 2)
			Star1.SetVar("B_Type", 4)
			table.insert(bullets, Star1)
		end

		if Star2.isactive == false then
			Star2 = CreateProjectile("Star",Rock2.x,Rock2.y)
			Star2.SetVar("VSpeed",1)
			Star2.SetVar("HSpeed",3)
			Star2.SetVar("Type", 2)
			Star2.SetVar("B_Type", 4)
			table.insert(bullets, Star2)
		end
	end
	
	if timer > 1880 and timer < 1910 then
		if Encounter.GetVar("BY") >= 0.9 or Encounter.GetVar("BY") < 0.905 then
			SetGlobal("Animate",false)
		end
	elseif timer == 1910 then
		SetGlobal("Rage",true)
	end
	
	for i=1,#bullets2 do
		local bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.ppcollision = true
			if timer <= 1600 then
				--X_Pos = Rad * math.cos((timer/10) + ((i-1) * Rotation)) <- Interesting alternative pattern
				--Y_Pos = Rad * math.sin((timer/10) + ((i-1) * Rotation)) <- Interesting alternative pattern
				X_Pos = Rad * math.cos((i-1) * Rotation)
				Y_Pos = Rad * math.sin((i-1) * Rotation)
				local distance = math.sqrt((X_Pos - bullet.x)^2 + (Y_Pos - bullet.y)^2)
				if distance >= 2 then
					bullet.SetVar("distance_x", ((X_Pos - bullet.x) / distance)*2)
					bullet.SetVar("distance_y", ((Y_Pos - bullet.y) / distance)*2)
					bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
				else
					bullet.MoveTo(X_Pos,Y_Pos)
				end
			elseif timer < 1800 then
				bullet.MoveTo(Rad * math.cos(((timer-1600)/10) + (i-1) * Rotation),Rad * math.sin(((timer-1600)/10) + (i-1) * Rotation))
			elseif timer >= 1800 and timer <= 1850 then
				Rad = Rad - 0.07
				bullet.MoveTo(Rad * math.cos(((timer-1600)/10) + (i-1) * Rotation),Rad * math.sin(((timer-1600)/10) + (i-1) * Rotation))
			elseif timer == 1851 then
				Time = CreateProjectile("circle",0,0)
				Time.sprite.xscale = 0.01
				Time.sprite.yscale = 0.01
				Time.sprite.alpha = 0.5
			elseif timer > 1851 and timer < 1901 then
				Time.sprite.xscale = Time.sprite.xscale + 0.6
				Time.sprite.yscale = Time.sprite.yscale + 0.6
				Player.SetControlOverride(true)
			elseif timer == 2359 then
				Time.remove()
				for i=1,#bullets do
					local bullet = bullets[i]
					if bullet.GetVar("B_Type") == 4 then
						bullet.sprite.SetAnimation({"StarD1", "StarD2", "StarD3","StarD4"},1/8) 
						bullet.sprite.loopmode = "ONESHOT"
						bullet.SetVar("Type", -1)
					end
				end
			elseif timer > 2359 and timer < 2409 then
				Rad = Rad + 0.1
				bullet.MoveTo(Rad * math.cos(250 + (i-1) * Rotation),Rad * math.sin(250 + (i-1) * Rotation))
				Player.SetControlOverride(false)
			elseif timer >= 2450 and timer < 2520 then
				if bullet.sprite.xscale < 2 then
					bullet.sprite.color = {1,1,1-(timer - 2200)/20}
					bullet.sprite.Scale(bullet.sprite.xscale + 0.05,bullet.sprite.yscale + 0.05)
					bullet.SetVar("Type", 4)
				end
			elseif timer >= 2550 and Rad > 0 then
				Rad = Rad - 1.5;
				bullet.MoveTo( Rad * math.cos(250 + (i-1) * Rotation),Rad * math.sin(250 + (i-1) * Rotation))
			elseif timer >= 2560 then
				bullet.remove()
				if timer < 6000 then
					Audio.PlaySound("PlayerHurt")
					Audio.PlaySound("Boom")
					timer = 6000
				end
			end
		end
	end

	if timer == 6000 then
		Bomb = CreateProjectile('Boom',0,0)
	elseif timer > 6000 then
		Bomb.sprite.alpha = 250 / ( 250 + ( timer - ( 6000 ) ))
		Audio.Volume( 0.6 * ( 100 / ( 100 + ( timer - ( 6000 ) ))))
		Bomb.sprite.xscale = ( timer - ( 6000 ) ) / 1.5
		Bomb.sprite.yscale = ( timer - ( 6000 ) ) / 1.5
		Bomb.MoveTo(( timer * 0.001 * math.random()) , ( timer * 0.001 * math.random()))
		Bomb.SetVar("Type", 4)
		if timer == 6015 then
			SetGlobal("Hurt",true)
		end
	end

	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(10,0.1)
			bullet.remove()
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(15)
		elseif bullet.GetVar("Type") == 3 then
			Player.Hurt(20)
		elseif bullet.GetVar("Type") == 4 then
			SetGlobal("Force1HP",true)
			bullet.SetVar("Type", -1)
		end
	end
    if timer == 6450 then
		SetGlobal("Blank2",99)
		SetGlobal("Last_attack",false)
		SetGlobal("REMOVE",true)
	elseif timer > 6450 then
		Audio.Stop()
		EndWave()
    end
end
