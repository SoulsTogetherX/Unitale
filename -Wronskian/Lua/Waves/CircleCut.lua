timer = 0
bullets = {}

function Update()
	timer = timer + 1
	if timer%15 == 0 then
		local bullet = CreateProjectile("SmallSpike",Player.x + (30*math.cos(timer/100)),Player.y + (30*math.sin(timer/100)))
		bullet.sprite.rotation = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) + 180
		bullet.SetVar("Timer",0)
		bullet.SetVar("R",30)
		bullet.SetVar("R2",timer)
		bullet.SetVar("X",Player.x)
		bullet.SetVar("Y",Player.y)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		local R = (math.pi/180) * bullet.sprite.rotation 
		bullet.SetVar("Timer",bullet.GetVar("Timer") + 1)
		if bullet.GetVar("Timer") <= 50 then 
			bullet.SetVar("R",bullet.GetVar("R") + 1)
			bullet.MoveTo(bullet.GetVar("X") + bullet.GetVar("R")*math.cos(bullet.GetVar("R2")/100),bullet.GetVar("Y") + bullet.GetVar("R")*math.sin(bullet.GetVar("R2")/100))
			if bullet.GetVar("Timer") == 50 then
				Audio.PlaySound("Shoot2")
			end
		else
			bullet.SetVar("R",bullet.GetVar("R") - 3)
			bullet.MoveTo(bullet.GetVar("X") + bullet.GetVar("R")*math.cos(bullet.GetVar("R2")/100),bullet.GetVar("Y") + bullet.GetVar("R")*math.sin(bullet.GetVar("R2")/100))
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(4,0.5)
		end
	end
    if timer >= 550 then
        EndWave()
    end
end