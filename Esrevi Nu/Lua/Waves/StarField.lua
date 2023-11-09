timer = 0
bullets = {}
R = 0
B = 1
C = 0
Arena.ResizeImmediate(220, 220)

function Update()
	timer = timer + 1
	if timer%2 == 0 then
		B = B * (-1)
	end
	C = C + 0.5
	R = R + (50 * B)
	bullet = CreateProjectile("Star",300*math.cos(R),50*math.sin(R))
	local distance = math.sqrt((350*math.cos(C) - bullet.x)^2 + (300*math.sin(C) - bullet.y)^2)
	bullet.SetVar("distance_x", ((350*math.cos(C) - bullet.x) / distance)*2)
	bullet.SetVar("distance_y", ((350*math.sin(C) - bullet.y) / distance)*2.5)
	bullet.SetVar("Type", 1)
	table.insert(bullets, bullet)
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
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
    if timer >= 700 then
        EndWave()
    end
end