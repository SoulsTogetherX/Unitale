timer = 0
bullets = {}

function Update()
	timer = timer + 1
	if timer%100 == 0 then
		for i=1,math.random(3,6) do
			local bullet = CreateProjectile("Zero",Player.x,200 + (i*30))
			local M = math.random(1,2)
			if M == 1 then
				bullet.sprite.SetAnimation({"Zero","One"},1) 
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", -2)
				bullet.SetVar("Type",1)
				table.insert(bullets,bullet)
			elseif M == 2 then
				bullet.sprite.SetAnimation({"One","Zero"},1)
				bullet.SetVar("distance_x", 0)
				bullet.SetVar("distance_y", -2)
				bullet.SetVar("Type",1)
				table.insert(bullets,bullet)
			end
		end
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
			if bullet.y <= -150 then
				if bullet.y == -150 then
					Audio.PlaySound("Shoot1")
				end
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				local distance_x = ((Player.x - bullet.x) / distance)*5
				local distance_y = ((Player.y - bullet.y) / distance)*5
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.Move(0,2)
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y > 500 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(3)
		end
	end
    if timer >= 1000 then
        EndWave()
    end
end