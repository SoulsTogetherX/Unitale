timer = 0
bullets = {}
Arena.Resize(400, 80)

function Update()
	timer = timer + 1
	if timer%40 == 0 then
		local bullet = CreateProjectile("SmallSpike",400,0)
		bullet.SetVar("V",0)
		bullet.SetVar("H",(-10*math.abs(math.random()))-5)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("V",bullet.GetVar("V") - 0.1)
		bullet.Move(bullet.GetVar("H"),bullet.GetVar("V"))
		if bullet.y < -Arena.height/2 then
			bullet.SetVar("V",5*math.abs(math.random()))
		end
		if bullet.y > Arena.height/2 then
			bullet.SetVar("V",-5*math.abs(math.random()))
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(4,0.2)
		end
	end
    if timer >= 550 then
        EndWave()
    end
end