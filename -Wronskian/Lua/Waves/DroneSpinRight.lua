timer = 0
bullets = {}
Arena.Move(0, 100, true, false) 
Shoot = CreateProjectile("Shooter",150,100)
Shoot.SetVar("R",0)

function Update()
	timer = timer + 1
	Shoot.sprite.rotation = math.deg(math.atan2(0 - Shoot.y, 0 - Shoot.x)) + 90
	if timer > 75 then
		Shoot.SetVar("R",Shoot.GetVar("R") - 3)
		Shoot.MoveTo(150*math.cos(Shoot.GetVar("R")/50),150*math.sin(Shoot.GetVar("R")/50))
		if timer%5 == 0 then
			Audio.PlaySound("Shoot3")
		end
		if timer%1 == 0 then
			local distance = math.sqrt((0 - Shoot.x)^2 + (0 - Shoot.y)^2)
			local distance_x = ((0 - Shoot.x) / distance)*20
			local distance_y = ((0 - Shoot.y) / distance)*20
			local bullet = CreateProjectile("Pixel",Shoot.x,Shoot.y)
			bullet.SetVar("distance_x", distance_x)
			bullet.SetVar("distance_y", distance_y)
			bullet.SetVar("Type",1)
			bullet.sprite.Scale(2,2)
			table.insert(bullets,bullet)
		end
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(2,0.2)
		end
	end
    if timer >= 450 then
        EndWave()
    end
end