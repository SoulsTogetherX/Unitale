timer = 0
bullets = {}
bullets2 = {}
bullets3 = {}
R = 0
B = 1
C = 0
Arena.ResizeImmediate(220, 220)

function Update()
	timer = timer + 1
	--if timer%140 == 0 then
	--	B = B * (-1)
	--end
	if timer%20 == 0 then
		C = C + 1
	end
	if timer%4 == 0 then
		R = R + (1 * B)
		bullet = CreateProjectile("Star",200*math.cos(R),200*math.sin(R))
		local distance = math.sqrt((math.cos(C) - bullet.x)^2 + (math.sin(C) - bullet.y)^2)
		bullet.SetVar("distance_x", ((math.cos(C) - bullet.x) / distance)*(math.sin(C)*3))
		bullet.SetVar("distance_y", ((math.sin(C) - bullet.y) / distance)*(math.cos(C)*3))
		bullet.SetVar("Type", 1)
		table.insert(bullets, bullet)
	end
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
	if timer%32 == 0 then
		local bullet = CreateProjectile("pixel",320,(math.random()*150)-50)
		bullet.sprite.xscale = 5
		bullet.sprite.yscale = 5
		bullet.SetVar("Speed",(math.random()*8)+3)
		bullet.SetVar("Speed2",(math.random()*4))
		bullet.SetVar("Radius",math.random()*105)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets2, bullet)
	end
	for i=1,#bullets2 do
		local bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.SetVar("timer",bullet.GetVar("timer")+1)
			bullet.MoveTo(bullet.x-bullet.GetVar("Speed"),bullet.GetVar("Radius")*math.cos((bullet.GetVar("timer")*bullet.GetVar("Speed2"))/20))
			if bullet.x < -320 then
				bullet.remove()
			end
		end
	end
	if timer%20 == 0 then
		local bullet = CreateProjectile("pixel",-320,(math.random()*150)-50)
		bullet.sprite.xscale = 5
		bullet.sprite.yscale = 5
		bullet.SetVar("Speed",(math.random()*8)+3)
		bullet.SetVar("Speed2",(math.random()*4))
		bullet.SetVar("Radius",math.random()*105)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets3, bullet)
	end
	for i=1,#bullets3 do
		local bullet = bullets3[i]
		if bullet.isactive == true then
			bullet.SetVar("timer",bullet.GetVar("timer")+1)
			bullet.MoveTo(bullet.x+bullet.GetVar("Speed"),bullet.GetVar("Radius")*math.cos((bullet.GetVar("timer")*bullet.GetVar("Speed2"))/20))
			if bullet.x < -320 then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(9)
		end
	end
    if timer >= 700 then
        EndWave()
    end
end