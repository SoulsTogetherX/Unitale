timer = 0
bullets = {}
R = 0
B = 1

function Update()
	timer = timer + 1
	if timer%160 == 0 then
		B = B * (-1)
	end
	if timer%20 == 0 then
		R = R + (1 * B)
		bullet = CreateProjectile("Star",100*math.cos(R),100*math.sin(R))
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
		bullet.SetVar("Type", 1)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x")*0.5, bullet.GetVar("distance_y")*0.5)
		end
		if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		end
	end
    if timer >= 640 then
        EndWave()
    end
end