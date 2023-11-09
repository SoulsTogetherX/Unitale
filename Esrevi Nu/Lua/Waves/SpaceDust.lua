timer = 0
bullets = {}
Arena.ResizeImmediate(150, 100)

function Update()
	timer = timer + 1
	if timer%15 == 0 then
		local bullet = CreateProjectile("pixel",320,(math.random()*150)-50)
		bullet.sprite.xscale = 3
		bullet.sprite.yscale = 3
		bullet.SetVar("Speed",math.abs(math.random()*4)+2.5)
		bullet.SetVar("Speed2",(math.random()*2))
		bullet.SetVar("Radius",math.random()*70)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive == true then
			bullet.SetVar("timer",bullet.GetVar("timer")+1)
			bullet.MoveTo(bullet.x-bullet.GetVar("Speed"),bullet.GetVar("Radius")*math.cos((bullet.GetVar("timer")*bullet.GetVar("Speed2"))/20))
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
    if timer >= 500 then
        EndWave()
    end
end