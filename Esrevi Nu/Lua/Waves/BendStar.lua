timer = 0
bullets = {}
Gravity = 0.03

function Update()
    timer = timer + 1
	if timer%100 == 0 then
		local bullet = CreateProjectile("Star",400*math.cos(math.random(0,2*math.pi)),400*math.sin(math.random(0,2*math.pi)))
		local distance = math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)
		bullet.SetVar("HSpeed", (((0+(math.random()*50)) - bullet.x) / distance)*0.1)
		bullet.SetVar("VSpeed", (((0+(math.random()*50)) - bullet.y) / distance)*0.1)
		bullet.SetVar("Rotaion",math.random()*25)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
		distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
		if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
			bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-Gravity)
		elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
			bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+Gravity)
		end
		if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
			bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-Gravity)
		elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+Gravity)
		end
		bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
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