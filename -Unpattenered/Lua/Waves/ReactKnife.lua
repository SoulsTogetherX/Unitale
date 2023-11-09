timer = 0
bullets = {}
Arena.ResizeImmediate(16, 16)

function Update()
	timer = timer + 1
	if (timer)%140 == 0 and timer >= 20 then
		R = math.random()*4
		if R > 0 and R <= 1 then
		    Arena.ResizeImmediate(16, 48)
			Player.MoveTo(0,0,false)
			local bullet = CreateProjectile('Knife_Left', 120, 0)
			bullet.SetVar("Move", 1)
			table.insert(bullets, bullet)
		elseif R > 1 and R <= 2 then
		    Arena.ResizeImmediate(48, 16)
			Player.MoveTo(0,0,false)
			local bullet = CreateProjectile('Knife_Down', 0, 120)
			bullet.SetVar("Move", 2)
			table.insert(bullets, bullet)
		elseif R > 2 and R <= 3 then
		    Arena.ResizeImmediate(16, 48)
			Player.MoveTo(0,0,false)
			local bullet = CreateProjectile('Knife_Right', -120, 0)
			bullet.SetVar("Move", 3)
			table.insert(bullets, bullet)
		elseif R > 3 and R <= 4 then
		    Arena.ResizeImmediate(48, 16)
			Player.MoveTo(0,0,false)
			local bullet = CreateProjectile('Knife_Up', 0, -120)
			bullet.SetVar("Move", 4)
			table.insert(bullets, bullet)
		end
	end
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("Move") == 1 then
			bullet.MoveTo(bullet.x-2, bullet.y)
		elseif bullet.GetVar("Move") == 2 then
			bullet.MoveTo(bullet.x, bullet.y-2)
		elseif bullet.GetVar("Move") == 3 then
			bullet.MoveTo(bullet.x+2, bullet.y)
		elseif bullet.GetVar("Move") == 4 then
			bullet.MoveTo(bullet.x, bullet.y+2)
		end
	end
	if timer >= (140*5) then
	  EndWave()
	end
end
