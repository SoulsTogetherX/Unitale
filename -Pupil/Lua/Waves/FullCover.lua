-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
R1 = math.random()
SetPPCollision(true) 

function Update()
    timer = timer + 1
	if timer%8 == 0 then
		Audio.PlaySound("Shoot3")
		local bullet = CreateProjectile("Spike",Arena.width/2 + 20,Arena.height/2 + 20)
		bullet.SetVar("R",math.random()*(2*math.pi))
		bullet.SetVar("Rad",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2 - 20,Arena.height/2 + 20)
		bullet.SetVar("R",math.random()*(2*math.pi))
		bullet.SetVar("Rad",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Arena.width/2 + 20,-Arena.height/2 - 20)
		bullet.SetVar("R",math.random()*(2*math.pi))
		bullet.SetVar("Rad",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2 - 20,-Arena.height/2 - 20)
		bullet.SetVar("R",math.random()*(2*math.pi))
		bullet.SetVar("Rad",0)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("Rad",bullet.GetVar("Rad") + 1)
		if i%4 == 0 then
			bullet.MoveTo(bullet.GetVar("Rad")*math.cos(bullet.GetVar("R")) + Arena.width/2 + 20,bullet.GetVar("Rad")*math.sin(bullet.GetVar("R")) + Arena.height/2 + 20)
			bullet.sprite.rotation = math.deg(math.atan2(((bullet.GetVar("Rad") + 1)*math.sin(bullet.GetVar("R")) + Arena.height/2 + 20) - bullet.y, ((bullet.GetVar("Rad") + 1)*math.cos(bullet.GetVar("R")) + Arena.width/2 + 20) - bullet.x)) - 180
		elseif (1+i)%4 == 0 then
			bullet.MoveTo(bullet.GetVar("Rad")*math.cos(bullet.GetVar("R")) - Arena.width/2 - 20,bullet.GetVar("Rad")*math.sin(bullet.GetVar("R")) + Arena.height/2 + 20)
			bullet.sprite.rotation = math.deg(math.atan2(((bullet.GetVar("Rad") + 1)*math.sin(bullet.GetVar("R")) + Arena.height/2 + 20) - bullet.y, ((bullet.GetVar("Rad") + 1)*math.cos(bullet.GetVar("R")) - Arena.width/2 - 20) - bullet.x)) - 180
		elseif (2+i)%4 == 0 then
			bullet.MoveTo(bullet.GetVar("Rad")*math.cos(bullet.GetVar("R")) + Arena.width/2 + 20,bullet.GetVar("Rad")*math.sin(bullet.GetVar("R")) - Arena.height/2 - 20)
			bullet.sprite.rotation = math.deg(math.atan2(((bullet.GetVar("Rad") + 1)*math.sin(bullet.GetVar("R")) - Arena.height/2 - 20) - bullet.y, ((bullet.GetVar("Rad") + 1)*math.cos(bullet.GetVar("R")) + Arena.width/2 + 20) - bullet.x)) - 180
		elseif (3+i)%4 == 0 then
			bullet.MoveTo(bullet.GetVar("Rad")*math.cos(bullet.GetVar("R")) - Arena.width/2 - 20,bullet.GetVar("Rad")*math.sin(bullet.GetVar("R")) - Arena.height/2 + 20)
			bullet.sprite.rotation = math.deg(math.atan2(((bullet.GetVar("Rad") + 1)*math.sin(bullet.GetVar("R"))) - ((bullet.GetVar("Rad"))*math.sin(bullet.GetVar("R"))), ((bullet.GetVar("Rad") + 1)*math.cos(bullet.GetVar("R"))) - ((bullet.GetVar("Rad"))*math.cos(bullet.GetVar("R"))))) - 180
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 700 then
        EndWave()
    end
end