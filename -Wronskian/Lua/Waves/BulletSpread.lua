timer = 0
bullets = {}
Pole = CreateProjectile("Pole",380,0)
Pole.sprite.Scale(2,2)
Pole.sprite.rotation = 90
Lancher = CreateProjectile("Lancher",200,0)
Lancher.sprite.Scale(1,1)

function Update()
	timer = timer + 1
	if timer > 60 then
		if timer%60 == 0 then
			Audio.PlaySound("Shoot1")
			local bullet = CreateProjectile("bullet",220,0)
			bullet.SetVar("Type",1)
			bullet.ppcollision = true
			bullet.SetVar("Gravity",(0.08 * math.random()))
			bullet.SetVar("VSpeed",0)
			bullet.SetVar("HSpeed",-5)
			bullet.SetVar("Timer",0)
			table.insert(bullets,bullet)
		end
		for i=1,#bullets do
			bullet = bullets[i]
			bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
			distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			if bullet.GetVar("Timer") < 100 then
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
			end
			bullet.sprite.rotation = math.deg(math.atan2((bullet.y + bullet.GetVar("VSpeed")) - bullet.y, (bullet.x + bullet.GetVar("HSpeed")) - bullet.x)) + 180
			bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
		end
		Pole.SendToTop()
		Lancher.SendToTop()
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