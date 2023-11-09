timer = 0
T = 1
bullets = {}
MoveToPlayer = {}
Arena.Resize(155, 130)

function Update()
	timer = timer + 1
	if timer%10 == 0 then
		local bullet = CreateProjectile("Star",72, 70 - ((timer - T) * 2))
		bullet.SetVar("Type",1)
		bullet.SetVar("distance_x", 0)
		bullet.SetVar("distance_y", 0)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Star",-72,70 - ((timer - T) * 2))
		bullet.SetVar("Type",1)
		bullet.SetVar("distance_x", 0)
		bullet.SetVar("distance_y", 0)
		table.insert(bullets, bullet)
	end
	if (timer + 10)%70 == 0 then
		T = timer
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive == true then
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			end
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			table.insert(MoveToPlayer, bullet)
		end
		bullets = {}
	end
	for i=1,#MoveToPlayer do
		local bullet = MoveToPlayer[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
		end
		if bullet.x < -340 or bullet.x > 340 or bullet.y < -250 or bullet.y > 400 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(3,0.1)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end