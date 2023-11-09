timer = 0
bullets = {}
Pole = CreateProjectile("Pole",380,0)
Pole.sprite.Scale(2,2)
Pole.sprite.rotation = 90
Lancher = CreateProjectile("Lancher",200,0)
Lancher.sprite.Scale(2,1)

function Update()
	timer = timer + 1
	if timer == 60 then
		Audio.PlaySound("Shoot1")
		Audio.PlaySound("Shoot1")
		for i=1,15 do
			local bullet = CreateProjectile("bullet",220,0)
			bullet.SetVar("Type",1)
			bullet.sprite.Scale(0.5,0.5)
			bullet.ppcollision = true
			bullet.SetVar("Gravity",(0.05 * math.random()))
			bullet.SetVar("VSpeed",0)
			bullet.SetVar("HSpeed",-5)
			table.insert(bullets,bullet)
		end
	elseif timer > 60 then
		for i=1,#bullets do
			bullet = bullets[i]
			distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-bullet.GetVar("Gravity"))
			elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+bullet.GetVar("Gravity"))
			end
			if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-bullet.GetVar("Gravity"))
			elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+bullet.GetVar("Gravity"))
			end
			bullet.sprite.rotation = math.deg(math.atan2((bullet.y + bullet.GetVar("VSpeed")) - bullet.y, (bullet.x + bullet.GetVar("HSpeed")) - bullet.x)) + 180
			bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
		end
		Pole.SendToTop()
		Lancher.SendToTop()
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(5)
		end
	end
    if timer >= 650 then
        EndWave()
    end
end