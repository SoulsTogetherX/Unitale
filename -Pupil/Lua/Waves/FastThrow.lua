-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
bullets2 = {}
Arena.ResizeImmediate(155, 75)
R = 0

local bullet = CreateProjectile("Spike",380,300)
local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
bullet.SetVar("M",10)
bullet.SetVar("timer",0)
bullet.SetVar("Type",1)
table.insert(bullets,bullet)

local bullet = CreateProjectile("Spike",-380,300)
local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
bullet.SetVar("M",10)
bullet.SetVar("timer",0)
bullet.SetVar("Type",1)
table.insert(bullets,bullet)

function Update()
    timer = timer + 1
	if timer == 300 then
		local bullet = CreateProjectile("Spike",380,300)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",10)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)

		local bullet = CreateProjectile("Spike",-380,300)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",10)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	if timer == 400 then
		local bullet = CreateProjectile("Spike",380,300)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",12)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)

		local bullet = CreateProjectile("Spike",-380,300)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",12)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	if timer == 600 then
		local bullet = CreateProjectile("Spike",400,200)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",12)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)

		local bullet = CreateProjectile("Spike",-400,200)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",12)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",400,300)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",12)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)

		local bullet = CreateProjectile("Spike",-400,300)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*13)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*13)
		bullet.SetVar("M",12)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	if timer%50 == 0 and timer >= 250 and timer <= 600 then
		Audio.PlaySound("Shoot3")
		Audio.PlaySound("Shoot3")
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
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("M") == 1 then
			bullet.Move(0,-10)
		elseif bullet.GetVar("M") == 2 then
			bullet.Move(10,0)
		elseif bullet.GetVar("M") == 3 then
			bullet.Move(10,10)
		elseif bullet.GetVar("M") == 4 then
			bullet.Move(0,10)
		elseif bullet.GetVar("M") == 5 then
			bullet.Move(-10,0)
		elseif bullet.GetVar("M") == 6 then
			bullet.Move(-10,-10)
		elseif bullet.GetVar("M") == 7 then
			bullet.Move(-10,10)
		elseif bullet.GetVar("M") == 8 then
			bullet.Move(10,-10)
		elseif bullet.GetVar("M") == 9 then
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
		elseif bullet.GetVar("M") == 10 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.y <= -Arena.height/2 then
				bullet.SetVar("Up",true)
				bullet.SetVar("timer",0)
				bullet.SetVar("M",11)
			end
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
		elseif bullet.GetVar("M") == 11 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 180
			local R2 = 360 - math.abs(R)
			if Player.y - bullet.y > 0 and Player.x - bullet.x < 0 then
				R2 = 360 - R2
			end
			if bullet.GetVar("timer") > 80 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			elseif bullet.GetVar("timer") == 80 then
				Audio.PlaySound("Shoot2") 
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*15)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*15)
			elseif bullet.GetVar("timer") < 80 then
				if bullet.GetVar("move") == nil then
					bullet.Move(-0.1*bullet.GetVar("distance_x"), 3)
				elseif bullet.GetVar("move") == 1 then
					bullet.Move(-0.1*bullet.GetVar("distance_x"), 4)
				elseif bullet.GetVar("move") == 2 then
					bullet.Move(-0.1*bullet.GetVar("distance_x"), 2)
				end
				if bullet.GetVar("timer") <= 36 then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
					bullet.sprite.rotation = R2
				elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) then
					bullet.sprite.rotation = bullet.sprite.rotation + 10
				end
			end
		elseif bullet.GetVar("M") == 12 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.y <= -Arena.height/2 then
				bullet.SetVar("Up",true)
				bullet.SetVar("timer",0)
				bullet.SetVar("M",11)
				local B = CreateProjectile("Spike",bullet.x,bullet.y)
				B.SetVar("Type",1)
				B.sprite.rotation = bullet.sprite.rotation
				local distance = math.sqrt((Player.x - B.x)^2 + (Player.y - B.y)^2)
				B.SetVar("distance_x", ((Player.x - B.x) / distance)*13)
				B.SetVar("distance_y", ((Player.y - B.y) / distance)*13)
				B.SetVar("M",11)
				B.SetVar("timer",0)
				bullet.SetVar("move",1)
				table.insert(bullets,B)

				local B = CreateProjectile("Spike",bullet.x,bullet.y)
				B.SetVar("Type",1)
				B.sprite.rotation = bullet.sprite.rotation
				local distance = math.sqrt((Player.x - B.x)^2 + (Player.y - B.y)^2)
				B.SetVar("distance_x", ((Player.x - B.x) / distance)*13)
				B.SetVar("distance_y", ((Player.y - B.y) / distance)*13)
				B.SetVar("M",11)
				B.SetVar("timer",0)
				bullet.SetVar("move",2)
				table.insert(bullets,B)
			end
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
    if timer >= 900 then
        EndWave()
    end
end