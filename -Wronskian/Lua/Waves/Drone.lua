timer = 0
bullets = {}
Arena.Move(0, 100, true, false) 
Shoot = CreateProjectile("Shooter",150,100)
Shoot.SetVar("R",0)
A = 1
B = math.random(40,250)

function Update()
	timer = timer + 1
	Shoot.sprite.rotation = math.deg(math.atan2(Player.y - Shoot.y, Player.x - Shoot.x)) + 90
	if timer > 25 then
		Shoot.SetVar("R",Shoot.GetVar("R") + (1*A))
		Shoot.MoveTo(150*math.cos(Shoot.GetVar("R")/50),150*math.sin(Shoot.GetVar("R")/50))
		if timer%B == 0 then
			A = A * (-1)
			B = math.random(40,250)
		end
		if timer%10 == 0 then
			Audio.PlaySound("Shoot3")
			local distance = math.sqrt((Player.x - Shoot.x)^2 + (Player.y - Shoot.y)^2)
			local distance_x = ((Player.x - Shoot.x) / distance)*5
			local distance_y = ((Player.y - Shoot.y) / distance)*5
			local bullet = CreateProjectile("Pixel",Shoot.x + (15*(distance_x/math.abs(distance_x))),Shoot.y + (15*(distance_y/math.abs(distance_y))))
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
    if timer >= 750 then
        EndWave()
    end
end