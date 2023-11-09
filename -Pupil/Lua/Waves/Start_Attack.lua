-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
N = 0
I = 0

function Update()
    timer = timer + 1
	if timer == 50 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		for i=1,15 do
			if i ~= 3 and i ~= 4 then
				local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*10),400)
				bullet.SetVar("M",4)
				bullet.SetVar("Type",1)
				bullet.SetVar("timer",0)
				bullet.ppcollision = true
				table.insert(bullets,bullet)
			elseif i == 3 then
				local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*10),400)
				bullet.SetVar("M",6)
				bullet.SetVar("Type",1)
				bullet.SetVar("timer",0)
				bullet.ppcollision = true
				table.insert(bullets,bullet)
			elseif i == 4 then
				local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*10),400)
				bullet.SetVar("M",7)
				bullet.SetVar("Type",1)
				bullet.SetVar("timer",0)
				bullet.ppcollision = true
				table.insert(bullets,bullet)
			end
		end
	end
	if timer == 100 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		for i=1,15 do
			if i ~= 10 and i ~= 11 then
				local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*10),-400)
				bullet.SetVar("M",5)
				bullet.SetVar("Type",1)
				bullet.SetVar("timer",0)
				bullet.ppcollision = true
				table.insert(bullets,bullet)
			elseif i == 10 then
				local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*10),-400)
				bullet.SetVar("M",9)
				bullet.SetVar("Type",1)
				bullet.SetVar("timer",0)
				bullet.ppcollision = true
				table.insert(bullets,bullet)
			elseif i == 11 then
				local bullet = CreateProjectile("Spike",-Arena.width/2 + (i*10),-400)
				bullet.SetVar("M",8)
				bullet.SetVar("Type",1)
				bullet.SetVar("timer",0)
				bullet.ppcollision = true
				table.insert(bullets,bullet)
			end
		end
	end
	if timer%5 == 0 and timer >= 150 and timer <= 210 then
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",400,Player.y)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer%30 == 0 and timer >= 230 and timer <= 350 then
		Audio.PlaySound("Shoot4")
		N = N + 1
		local bullet = CreateProjectile("Spike",100*math.cos((N*50)/60),100*math.sin((N*50)/60))
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer%5 == 0 and timer >= 400 and timer <= 450 then
		Audio.PlaySound("Shoot2")
		I = I + 1
		local bullet = CreateProjectile("Spike",-400, -Arena.height/2 + (I*10))
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		bullet.ppcollision = true
		table.insert(bullets,bullet)
	end
	if timer == 470 then
		Audio.PlaySound("Shoot1")
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Spike",-Arena.width/2 + 10, 400)
		bullet.SetVar("M",10)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Arena.width/2 - 10, 400)
		bullet.SetVar("M",10)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400, Arena.height/2 - 10)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("M") == 1 then
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
			elseif bullet.GetVar("M") == 2 then
				bullet.Move(12,0)
				bullet.sprite.rotation = 180
			elseif bullet.GetVar("M") == 3 then
				bullet.Move(-12,0)
			elseif bullet.GetVar("M") == 4 then
				bullet.Move(0,-6)
				bullet.sprite.rotation = -90
			elseif bullet.GetVar("M") == 5 then
				bullet.Move(0,6)
				bullet.sprite.rotation = 90
			elseif bullet.GetVar("M") == 6 then
				bullet.Move(0,-6)
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				if bullet.GetVar("timer") >= 60 and bullet.GetVar("timer") <= 71 then
					bullet.Move(-1,0)
				end
				bullet.sprite.rotation = -90
			elseif bullet.GetVar("M") == 7 then
				bullet.Move(0,-6)
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				if bullet.GetVar("timer") >= 60 and bullet.GetVar("timer") <= 71 then
					bullet.Move(1,0)
				end
				bullet.sprite.rotation = -90
			elseif bullet.GetVar("M") == 8 then
				bullet.Move(0,6)
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				if bullet.GetVar("timer") >= 50 and bullet.GetVar("timer") <= 61 then
					bullet.Move(1,0)
				end
				bullet.sprite.rotation = 90
			elseif bullet.GetVar("M") == 9 then
				bullet.Move(0,6)
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				if bullet.GetVar("timer") >= 50 and bullet.GetVar("timer") <= 61 then
					bullet.Move(-1,0)
				end
				bullet.sprite.rotation = 90
			elseif bullet.GetVar("M") == 10 then
				bullet.Move(0,-12)
				bullet.sprite.rotation = -90
			end
			if bullet.isactive == true then
				if bullet.x > 400 or bullet.x < -400 or bullet.y > 400 or bullet.y < -400 then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false and bullet.GetVar("Type") == 1 then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 525 then
		Audio.LoadFile("battle-theme-intensifies")
		Audio.Volume(1)
		Audio.Pitch(1.5)
        EndWave()
    end
end