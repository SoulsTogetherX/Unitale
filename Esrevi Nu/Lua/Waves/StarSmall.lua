timer = 0
bullets = {}

function Update()
    timer = timer + 1
	if timer%12 == 0 then
		local bullet = CreateProjectile("Star",320,(math.random()*150)-50)
		bullet.SetVar("Speed",(math.random()*4)+3)
		bullet.SetVar("Rotation",math.random()*20)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
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
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end