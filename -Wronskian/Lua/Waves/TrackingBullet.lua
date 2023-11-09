timer = 0
bullets = {}
bullet = CreateProjectile("bullet",220,0)
bullet.SetVar("Type",1)
bullet.ppcollision = true
Gravity = 0.05
bullet.SetVar("VSpeed",0)
bullet.SetVar("HSpeed",-5)
Pole = CreateProjectile("Pole",380,0)
Pole.sprite.Scale(2,2)
Pole.sprite.rotation = 90
Lancher = CreateProjectile("Lancher",200,0)
Lancher.sprite.Scale(1,1)

function Update()
	timer = timer + 1
	if timer == 60 then
		Audio.PlaySound("Shoot1")
	end
	if timer > 60 then
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
		bullet.sprite.rotation = math.deg(math.atan2((bullet.y + bullet.GetVar("VSpeed")) - bullet.y, (bullet.x + bullet.GetVar("HSpeed")) - bullet.x)) + 180
		bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
		Lancher.Move(1,0)
		Pole.Move(1,0)
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(6)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end