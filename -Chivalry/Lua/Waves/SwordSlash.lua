timer = 0
bullets1 = {}
bullets2 = {}
bullets3 = {}
bullets4 = {}
bullets5 = {}
Var = 0
R = 0

function Update()
    timer = timer + 1
	if timer%80 == 0 then
		Var = math.random(1,4)
		if Var == 1 then
			local bullet = CreateProjectile("Sword" ,Player.x + 30, Player.y + 30) -- -> /\
			bullet.SetVar("Type",1)
			bullet.sprite.xscale = -1
			bullet.sprite.SetPivot(0.5, 0.25)
			bullet.SetVar("timer",0)
			bullet.sprite.alpha = 0
			table.insert(bullets1, bullet)
		elseif Var == 2 then
			local bullet = CreateProjectile("Sword", Player.x - 30, Player.y + 30) -- <- /\
			bullet.SetVar("Type",1)
			bullet.sprite.SetPivot(0.5, 0.25)
			bullet.SetVar("timer",0)
			bullet.sprite.alpha = 0
			table.insert(bullets2, bullet)
		elseif Var == 3 then
			local bullet = CreateProjectile("Sword", Player.x + 30, Player.y - 30) -- -> \/
			bullet.SetVar("Type",1)
			bullet.sprite.rotation = 180
			bullet.SetVar("timer",0)
			bullet.sprite.SetPivot(0.5, 0.25)
			bullet.sprite.alpha = 0
			table.insert(bullets3, bullet)
		elseif Var == 4 then
			local bullet = CreateProjectile("Sword", Player.x - 30, Player.y - 30) -- <- \/
			bullet.SetVar("Type",1)
			bullet.sprite.rotation = 180
			bullet.SetVar("timer",0)
			bullet.sprite.xscale = -1
			bullet.sprite.SetPivot(0.5, 0.25)
			bullet.sprite.alpha = 0
			table.insert(bullets4, bullet)
		end
	end
	for i=1, #bullets1 do
		bullet = bullets1[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		if bullet.sprite.alpha < 1 and bullet.GetVar("timer") < 45 then
			bullet.sprite.alpha = bullet.sprite.alpha + 0.05
		elseif bullet.sprite.rotation ~= 180 and bullet.GetVar("timer") >= 30 then
			if bullet.GetVar("timer") == 30 then
				Audio.PlaySound("Break") 
			end
			bullet.sprite.rotation = bullet.sprite.rotation - 10
			local S = CreateProjectile("Pixel", 60 * math.cos(bullet.GetVar("timer")/5 + (math.pi/2)) + bullet.x, 60 * math.sin(bullet.GetVar("timer")/5 + (math.pi/2)) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
			local S = CreateProjectile("Pixel", 60 * math.cos(bullet.GetVar("timer")/5 + (math.pi/2)+0.1) + bullet.x, 60 * math.sin(bullet.GetVar("timer")/5 + (math.pi/2)+0.1) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha > 0 then
			bullet.sprite.alpha = bullet.sprite.alpha - 0.05
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha <= 0 and bullet.isactive == true then
			bullet.remove()
		end
	end
	for i=1, #bullets2 do
		bullet = bullets2[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		if bullet.sprite.alpha < 1 and bullet.GetVar("timer") < 45 then
			bullet.sprite.alpha = bullet.sprite.alpha + 0.05
		elseif bullet.sprite.rotation ~= 180 and bullet.GetVar("timer") >= 30 then
			if bullet.GetVar("timer") == 30 then
				Audio.PlaySound("Break") 
			end
			bullet.sprite.rotation = bullet.sprite.rotation - 10
			local S = CreateProjectile("Pixel", 60 * math.sin(bullet.GetVar("timer")/5 + (math.pi*2)) + bullet.x, 60 * math.cos(bullet.GetVar("timer")/5 + (math.pi*2)) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
			local S = CreateProjectile("Pixel", 60 * math.sin(bullet.GetVar("timer")/5 + (math.pi*2)+0.1) + bullet.x, 60 * math.cos(bullet.GetVar("timer")/5 + (math.pi*2)+0.1) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha > 0 then
			bullet.sprite.alpha = bullet.sprite.alpha - 0.05
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha <= 0 and bullet.isactive == true then
			bullet.remove()
		end
	end
	for i=1, #bullets3 do
		bullet = bullets3[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		if bullet.sprite.alpha < 1 and bullet.GetVar("timer") < 45 then
			bullet.sprite.alpha = bullet.sprite.alpha + 0.05
		elseif bullet.sprite.rotation ~= 0 and bullet.GetVar("timer") >= 30 then
			if bullet.GetVar("timer") == 30 then
				Audio.PlaySound("Break") 
			end
			bullet.sprite.rotation = bullet.sprite.rotation - 10
			local S = CreateProjectile("Pixel", 60 * math.sin(bullet.GetVar("timer")/5 + (math.pi)) + bullet.x, 60 * math.cos(bullet.GetVar("timer")/5 + (math.pi)) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
			local S = CreateProjectile("Pixel", 60 * math.sin(bullet.GetVar("timer")/5 + (math.pi)+0.1) + bullet.x, 60 * math.cos(bullet.GetVar("timer")/5 + (math.pi)+0.1) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha > 0 then
			bullet.sprite.alpha = bullet.sprite.alpha - 0.05
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha <= 0 and bullet.isactive == true then
			bullet.remove()
		end
	end
	for i=1, #bullets4 do
		bullet = bullets4[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		if bullet.sprite.alpha < 1 and bullet.GetVar("timer") < 45 then
			bullet.sprite.alpha = bullet.sprite.alpha + 0.05
		elseif bullet.sprite.rotation ~= 0 and bullet.GetVar("timer") >= 30 then
			if bullet.GetVar("timer") == 30 then
				Audio.PlaySound("Break") 
			end
			bullet.sprite.rotation = bullet.sprite.rotation - 10
			local S = CreateProjectile("Pixel", 60 * math.cos(bullet.GetVar("timer")/5 + (3*math.pi/2)) + bullet.x, 60 * math.sin(bullet.GetVar("timer")/5 + (3 * math.pi/2)) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
			local S = CreateProjectile("Pixel", 60 * math.cos(bullet.GetVar("timer")/5 + (3*math.pi/2)+0.1) + bullet.x, 60 * math.sin(bullet.GetVar("timer")/5 + (3 * math.pi/2)+0.1) + bullet.y)
			S.sprite.Scale(3, 8)
			S.SetVar("timer",0)
			S.SetVar("Type",2)
			table.insert(bullets5, S)
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha > 0 then
			bullet.sprite.alpha = bullet.sprite.alpha - 0.05
		elseif bullet.GetVar("timer") > 45 and bullet.sprite.alpha <= 0 and bullet.isactive == true then
			bullet.remove()
		end
	end
	for i=1, #bullets5 do
		bullet = bullets5[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		if bullet.GetVar("timer") > 50 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
        if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(5)
        elseif bullet.GetVar("Type") == 2 then
    	   	Player.Hurt(3,0.2)
		end
	end
    if timer >= 400 then
        EndWave() 
    end
end