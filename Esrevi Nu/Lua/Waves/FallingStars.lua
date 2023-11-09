timer = 0
bullets = {}

function Update()
	timer = timer + 1
	if timer%10 == 0 then
		local bullet = CreateProjectile("Star",math.random(-400,400),400)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x")*2, bullet.GetVar("distance_y")*2)
		end
		if bullet.x < -320 or bullet.y < -250 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		Player.Hurt(12)
	end
    if timer >= 400 then
        EndWave()
    end
end