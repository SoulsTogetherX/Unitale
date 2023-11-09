timer = 0
bullets = {}

function Update()
	timer = timer + 1
	if timer%15 == 0 then
		local R = (200*math.random()) + 150
		local R2 = math.random() * ((400/6.2) * (R/1))
		local bullet = CreateProjectile("Zero",R * math.cos(R2),R * math.sin(R2))
		local M = math.random(1,2)
		if M == 1 then
			bullet.sprite.SetAnimation({"Zero","One"},1) 
			local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			local distance_x = ((Player.x - bullet.x) / distance)*5
			local distance_y = ((Player.y - bullet.y) / distance)*5
			bullet.SetVar("distance_x", distance_x)
			bullet.SetVar("distance_y", distance_y)
			bullet.SetVar("Type",1)
			table.insert(bullets,bullet)
		elseif M == 2 then
			bullet.sprite.SetAnimation({"One","Zero"},1)
			local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			local distance_x = ((Player.x - bullet.x) / distance)*5
			local distance_y = ((Player.y - bullet.y) / distance)*5
			bullet.SetVar("distance_x", distance_x)
			bullet.SetVar("distance_y", distance_y)
			bullet.SetVar("Type",1)
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
			Player.Hurt(3,0.3)
		end
	end
    if timer >= 500 then
        EndWave()
    end
end