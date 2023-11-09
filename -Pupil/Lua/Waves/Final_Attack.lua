-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
bullets2 = {}
N = 0
Audio.LoadFile("battle-theme-intensifies")
Audio.Volume(1)
Audio.Pitch(2)

function Update()
    timer = timer + 1
	if timer%5 == 0 and timer <= 600 then
		local bullet = CreateProjectile("Spike",100*math.cos(timer/60),100*math.sin(timer/60))
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		
		if timer <= 170 then
			local bullet = CreateProjectile("Spike",100*math.cos(timer/60)^2,100*math.sin(timer/60)^2)
			bullet.SetVar("M",1)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
		
		if timer >= 230 then
			local bullet = CreateProjectile("Spike",100*math.cos((timer + 30)/60),100*math.sin((timer + 30)/60))
			bullet.SetVar("M",1)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
		if timer >= 270 then
			local bullet = CreateProjectile("Spike",100*math.cos((timer + 60)/60),100*math.sin((timer + 60)/60))
			bullet.SetVar("M",1)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
		if timer >= 310 then
			local bullet = CreateProjectile("Spike",100*math.cos((timer + 90)/60),100*math.sin((timer + 90)/60))
			bullet.SetVar("M",1)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
	end
	if timer%60 == 0 and timer >= 400 and timer <= 800 then
		N = N + 1
		local bullet = CreateProjectile("Spike",100*math.cos((N*80)/60),100*math.sin((N*80)/60))
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer >= 1500 and timer <= 1515 and timer%5 == 0 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",-400, Player.y)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400, Player.y)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x, 400)
		bullet.SetVar("M",5)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x, -400)
		bullet.SetVar("M",6)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer%40 == 0 and timer > 1000 and timer < 1250 then
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",-400, Player.y)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	elseif (timer + 20)%40 == 0 and timer > 1000 and timer < 1250 then
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",400, Player.y)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer%40 == 0 and timer >= 1250 and timer < 1500 then
		Audio.PlaySound("Shoot1")
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Spike",-Player.x, 400)
		bullet.SetVar("M",5)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x, -400)
		bullet.SetVar("M",6)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer == 1700 then
		Audio.PlaySound("Shoot1")
		Audio.PlaySound("Shoot1")
		for i=1,31 do
			local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*5), 400)
			bullet.SetVar("M",5)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
			local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*5), -400)
			bullet.SetVar("M",6)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
		for i=1,26 do
			local bullet = CreateProjectile("Spike",-400, -Arena.height/2 + (i*5))
			bullet.SetVar("M",3)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
			local bullet = CreateProjectile("Spike",400, -Arena.height/2 + (i*5))
			bullet.SetVar("M",4)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
	end
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("M") == 1 then
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				local R = math.deg(math.atan2(-bullet.y, -bullet.x)) - 180
				local R2 = 360 - math.abs(R)
				if -bullet.y > 0 and -bullet.x < 0 then
					R2 = 360 - R2
				end
				if bullet.GetVar("timer") >= 80 then
					bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
					if bullet.GetVar("timer") == 80 then
						Audio.PlaySound("Shoot2") 
					end
				else
					local distance = math.sqrt((-bullet.x)^2 + (-bullet.y)^2)
					bullet.SetVar("distance_x", ((-bullet.x) / distance)*5)
					bullet.SetVar("distance_y", ((-bullet.y) / distance)*5)
					if bullet.GetVar("timer") <= 36 then
						bullet.sprite.rotation = bullet.sprite.rotation + 10
					elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
						bullet.sprite.rotation = R2
					elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) then
						bullet.sprite.rotation = bullet.sprite.rotation + 10
					end
				end
			elseif bullet.GetVar("M") == 2 then
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 180
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
			elseif bullet.GetVar("M") == 3 then
				bullet.Move(12,0)
				bullet.sprite.rotation = 180
			elseif bullet.GetVar("M") == 4 then
				bullet.Move(-12,0)
			elseif bullet.GetVar("M") == 5 then
				bullet.Move(0,-12)
				bullet.sprite.rotation = -90
			elseif bullet.GetVar("M") == 6 then
				bullet.Move(0,12)
				bullet.sprite.rotation = 90
			end
			if bullet.isactive == true then
				if bullet.x > 400 or bullet.x < -400 or bullet.y > 400 or bullet.y < -400 then
					bullet.remove()
				end
			end
		end
	end
	if timer%50 == 0 and timer >= 620 and timer <= 1500 then
		Audio.PlaySound("Shoot4")
		Audio.PlaySound("Shoot4")
		local bullet = CreateProjectile("Spike",Arena.width/2,math.random(-Arena.height/2,Arena.height/2))
		bullet.sprite.rotation = 180
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2,math.random(-Arena.height/2,Arena.height/2))
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.sprite.yscale = -1
		table.insert(bullets2,bullet)
	end
	for i=1, #bullets2 do
		bullet = bullets2[i]
		if bullet.isactive == true then
			if bullet.GetVar("M") == 1 then
				bullet.Move(-2.5,0)
			elseif bullet.GetVar("M") == 2 then
				bullet.Move(2.5,0)
			end
			if bullet.x < -Arena.width/2 or bullet.x > Arena.width/2 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(0,0.2)
		elseif bullet.isactive == true and Player.isHurting == false and bullet.GetVar("Type") == 1 then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 1730 and bullet.GetVar("Type") == 1 then
		Audio.Pause()
		SetGlobal("Stop",true)
		SetGlobal("CD",{"[effect:none]*Pant*[w:20] *Pant*","[effect:none]That's a far as I got\nwith my training.","[effect:none][func:Face7]You are a advanced\nlearner!","[effect:none][func:Face1]*Pant*[w:20] *Pant*","[effect:none]I don't understand...","[effect:none][func:Face7]Why are you NOT[w:15]\npart of the royal\nguard?","[effect:none][func:Face2]I guess that's\nundyen for you...","[effect:none]Well...[w:20][func:Face1]It's time to call\nit a day!","[effect:none]Say, do you want to\ngo out to eat?","[effect:none][func:Face7]I hear grillby's is a\ngreat place!","[effect:none][func:Face1]I'm buying!"})
        State("ENEMYDIALOGUE")
    end
end