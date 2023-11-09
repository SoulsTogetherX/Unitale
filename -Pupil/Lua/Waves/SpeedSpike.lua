-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
bullets2 = {}

function Update()
    timer = timer + 1
	if timer == 50 then
		for i=1,4 do
			local bullet = CreateProjectile("Spike",Player.x + (30*math.cos((math.pi/2)*i)),Player.y + (30*math.sin((math.pi/2)*i)))
			bullet.sprite.rotation = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) + 180
			bullet.SetVar("Timer",0)
			bullet.SetVar("R",30)
			bullet.SetVar("X",Player.x)
			bullet.SetVar("Y",Player.y)
			bullet.SetVar("Type",1)
			table.insert(bullets,bullet)
		end
	end
	if timer == 200 then
		local bullet = CreateProjectile("Spike",Player.x, Player.y + 50)
		bullet.sprite.rotation = 90
		bullet.SetVar("M",4)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",Player.x, Player.y - 50)
		bullet.sprite.rotation = -90
		bullet.SetVar("M",3)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",Player.x + 50,Player.y)
		bullet.sprite.rotation = 0
		bullet.SetVar("M",2)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",Player.x - 50,Player.y)
		bullet.sprite.rotation = 180
		bullet.SetVar("M",1)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	if timer >= 250 and timer%5 == 0 then
		local bullet = CreateProjectile("Spike",150,Player.y)
		bullet.SetVar("M",2)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	if timer == 100 then
		for i=1,10 do
			local bullet = CreateProjectile("Spike",Player.x + (30*math.cos(((math.pi*1)/4)*i)),Player.y + (30*math.sin(((math.pi*1)/4)*i)))
			bullet.sprite.rotation = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) + 180
			bullet.SetVar("Timer",0)
			bullet.SetVar("R",30)
			bullet.SetVar("X",Player.x)
			bullet.SetVar("Y",Player.y)
			bullet.SetVar("Type",1)
			table.insert(bullets,bullet)
		end
	end
	if timer == 150 then
		local bullet = CreateProjectile("Spike",Player.x + 20, Player.y + 50)
		bullet.sprite.rotation = 90
		bullet.SetVar("M",4)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",Player.x - 20, Player.y - 50)
		bullet.sprite.rotation = -90
		bullet.SetVar("M",3)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",Player.x + 50,Player.y - 20)
		bullet.sprite.rotation = 0
		bullet.SetVar("M",2)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		
		local bullet = CreateProjectile("Spike",Player.x - 50,Player.y + 20)
		bullet.sprite.rotation = 180
		bullet.SetVar("M",1)
		bullet.SetVar("Timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("Timer") ~= nil then
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
		end
		if bullet.GetVar("M") == nil then
			if bullet.GetVar("Timer") <= 10 then 
				bullet.SetVar("R",bullet.GetVar("R") + 4)
				if i <= 4 then
					bullet.MoveTo(bullet.GetVar("X") + bullet.GetVar("R")*math.cos((math.pi/2)*i),bullet.GetVar("Y") + bullet.GetVar("R")*math.sin((math.pi/2)*i))
				elseif i > 4 and i <= 14 then
					bullet.MoveTo(bullet.GetVar("X") + bullet.GetVar("R")*math.cos(((math.pi*1)/4)*i),bullet.GetVar("Y") + bullet.GetVar("R")*math.sin(((math.pi*1)/4)*i))
				end
			else
				if bullet.GetVar("Timer") == 11 then 
					Audio.PlaySound("Shoot2")
				end
				bullet.SetVar("R",bullet.GetVar("R") - 3)
				if i <= 4 then
					bullet.MoveTo(bullet.GetVar("X") + bullet.GetVar("R")*math.cos((math.pi/2)*i),bullet.GetVar("Y") + bullet.GetVar("R")*math.sin((math.pi/2)*i))
				elseif i <= 14 then
					bullet.MoveTo(bullet.GetVar("X") + bullet.GetVar("R")*math.cos(((math.pi*1)/4)*i),bullet.GetVar("Y") + bullet.GetVar("R")*math.sin(((math.pi*1)/4)*i))
				end
			end
		elseif bullet.GetVar("M") == 1 then
			bullet.Move(3,0)
			if bullet.GetVar("Timer") == 1 then 
				Audio.PlaySound("Shoot2")
			end
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
		elseif bullet.GetVar("M") == 2 then
			bullet.Move(-3,0)
			if bullet.GetVar("Timer") == 1 then 
				Audio.PlaySound("Shoot2")
			end
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
		elseif bullet.GetVar("M") == 3 then
			bullet.Move(0,3)
			if bullet.GetVar("Timer") == 1 then 
				Audio.PlaySound("Shoot2")
			end
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
		elseif bullet.GetVar("M") == 4 then
			bullet.Move(0,-3)
			if bullet.GetVar("Timer") == 1 then 
				Audio.PlaySound("Shoot2")
			end
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
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
    if timer >= 480 then
        EndWave()
    end
end