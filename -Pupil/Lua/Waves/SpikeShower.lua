-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {} 
I = 0

function Update()
    timer = timer + 1
	if timer%10 == 0 and timer <= 70 then
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",Arena.width/2 - (I*10),Arena.height/2)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2 + (I*10),Arena.height/2)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		I = I + 1
	end
	if timer == 80 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",Arena.width/2 - 80,Arena.height/2)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2 + 80,Arena.height/2)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Arena.width/2 - 70,Arena.height/2)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2 + 70,Arena.height/2)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",0)
		table.insert(bullets,bullet)
	end
	if timer == 135 then
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Spike",400,-40)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400,-50)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400,-60)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("Type",1)
		if bullet.GetVar("M") == 1 then
			bullet.Move(0,-2)
			bullet.sprite.rotation = 90
		elseif bullet.GetVar("M") == 2 then
			if bullet.y > - 30 then
				bullet.Move(0,-2)
			end
			bullet.sprite.rotation = 90
		elseif bullet.GetVar("M") == 3 then
			bullet.Move(-12,0)
			bullet.sprite.rotation = 0
		elseif bullet.GetVar("M") == 4 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.GetVar("timer") >= 80 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
				if bullet.GetVar("timer") == 80 then
					Audio.PlaySound("Shoot2") 
				end
			else
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
				bullet.sprite.rotation = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 180
			end
		end
		if timer == 150 and i == 15 then
			bullet.SetVar("M",4)
			bullet.SetVar("Type",1)
		elseif timer == 180 and i == 16 then
			bullet.SetVar("M",4)
			bullet.SetVar("Type",1)
		elseif timer == 210 and i == 17 then
			bullet.SetVar("M",4)
			bullet.SetVar("Type",1)
		elseif timer == 240 and i == 18 then
			bullet.SetVar("M",4)
			bullet.SetVar("Type",1)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 400 then
        EndWave()
    end
end