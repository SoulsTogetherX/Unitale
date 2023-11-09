timer = 0
bullets = {}
MoveToPlayer = {}
B = 1
distance = 0

function Update()
    timer = timer + 1
	if timer%20 == 0 and B == 1 then
		local bullet = CreateProjectile("Star",320,(math.random()*150)-50)
		bullet.SetVar("Speed",(math.random()*4)+3)
		bullet.SetVar("Rotation",math.random()*20)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
	end
	if timer%300 == 0 then
		Time = CreateProjectile("circle",0,0)
		Time.sprite.xscale = 0.01
		Time.sprite.yscale = 0.01
		Time.sprite.alpha = 0.5
		B = 0
	end
	if (timer-50)%300 == 0 and B == 0 then
		MoveToPlayer = bullets
		bullets = {}
		for i=1,#MoveToPlayer do
			local bullet = MoveToPlayer[i]
			if bullet.isactive == true then
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			end
		end
		B = 1
	end
	if B == 0 then
		if Time.isactive == true then
			Time.sprite.xscale = Time.sprite.xscale + 0.6
			Time.sprite.yscale = Time.sprite.yscale + 0.6
		end
	end
	if B == 1 then
		Player.SetControlOverride(false)
		if timer > 300 then
			if Time.isactive == true then
				Time.remove()
			end
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive == true then
				bullet.MoveTo(bullet.x-bullet.GetVar("Speed"),bullet.y)
				bullet.sprite.rotation = bullet.GetVar("Rotation")*timer
				if bullet.x < -320 then
					bullet.remove()
				end
			end
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
	elseif B == 0 then
		Player.SetControlOverride(true)
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		end
	end
    if timer >= 1100 then
        EndWave()
    end
end