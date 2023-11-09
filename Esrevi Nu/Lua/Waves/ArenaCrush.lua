timer = 0
bullets = {}
Arena.Resize(155, 130)
Side1 = CreateProjectile("Thing",Arena.width/2+400,0)
Side1.SetVar("Type",1)
Side1.sprite.yscale = 4
Side1.sprite.xscale = 3
Side2 = CreateProjectile("Thing",-Arena.width/2-400,0)
Side2.SetVar("Type",1)
Side2.sprite.yscale = 4
Side2.sprite.xscale = 3
Ax = 155

function Update()
	timer = timer + 1
	if timer <= 100 then
		Side1.Move(-4,0)
		Side2.Move(4,0)
	elseif timer > 100 then
		Side1.Move(-0.0625,0)
		Side2.Move(0.0625,0)
		Ax = Ax - 0.125
		Arena.Resize(Ax, 130)
		if timer%5 == 0 then
			local Side = math.random(1,2)
			if Side > 0 and Side <= 1 then
				local bullet = CreateProjectile("Pixel", Arena.width/2,(math.random()*150)-70)
				bullet.SetVar("HSpeed", -(math.abs(math.random()*3)))
				bullet.SetVar("VSpeed", -(math.abs(math.random()*2)))
				bullet.sprite.yscale = 2
				bullet.sprite.xscale = 2
				table.insert(bullets, bullet)
			elseif Side > 1 and Side <= 2 then
				local bullet = CreateProjectile("Pixel", -Arena.width/2,(math.random()*150)-70)
				bullet.SetVar("HSpeed", (math.abs(math.random()*3)))
				bullet.SetVar("VSpeed", (math.abs(math.random()*2)))
				bullet.sprite.yscale = 2
				bullet.sprite.xscale = 2
				table.insert(bullets, bullet)
			end
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			bullet.SetVar("Type",1)
			bullet.Move(bullet.GetVar("HSpeed"),bullet.GetVar("VSpeed"))
			--bullet.SetVar("HSpeed", bullet.GetVar("HSpeed") - 0.1)
			bullet.SetVar("VSpeed", bullet.GetVar("VSpeed") - 0.1)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(6)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(3,0.1)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end