timer = 0
bullets = {}
Arena.ResizeImmediate(150, 130)
Planet = CreateProjectile("Planet",0,400)
Gravity = 0.03

function Update()
	timer = timer + 1
	if Planet.isactive == true then
		if timer <= 200 then
			Planet.MoveTo(0,Planet.y-1)
		end
		Player.MoveTo(Player.x,Player.y+(((math.sqrt((Player.x - Planet.x)^2 + (Player.y - Planet.y)^2))^-1)*100),false)
		if timer >= 275 and timer < 295 then
			Planet.sprite.xscale = 1-((timer-275)/40)
			Planet.sprite.yscale = 1-((timer-275)/40)
		elseif timer >= 295 and timer < 300 then
			Planet.sprite.xscale = 0.5+((timer-295)/5)
			Planet.sprite.yscale = 0.5+((timer-295)/5)
		elseif timer == 300 then
			Boom = CreateProjectile("Boom",Planet.x,Planet.y)
			for i = 10,30 do
				local Random = math.abs(math.random(1,18))
				if Random > 0 and Random <= 1 then
					local bullet = CreateProjectile("Rock1",0,145)
					bullet.SetVar("VSpeed",math.random(-4,4))
					bullet.SetVar("HSpeed",math.random(-4,4))
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				elseif Random > 1 and Random <= 2 then
					local bullet = CreateProjectile("Rock2",0,145)
					bullet.SetVar("VSpeed",math.random(-4,4))
					bullet.SetVar("HSpeed",math.random(-4,4))
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				elseif Random > 2 and Random <= 3 then
					local bullet = CreateProjectile("Rock3",0,145)
					bullet.SetVar("VSpeed",math.random(-4,4))
					bullet.SetVar("HSpeed",math.random(-4,4))
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				elseif Random > 3 and Random <= 4 then
					local bullet = CreateProjectile("Rock4",0,145)
					bullet.SetVar("VSpeed",math.random(-4,4))
					bullet.SetVar("HSpeed",math.random(-4,4))
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				elseif Random > 4 and Random <= 18 then
					local bullet = CreateProjectile("Pixel",0,145)
					bullet.SetVar("VSpeed",math.random(-4,4))
					bullet.SetVar("HSpeed",math.random(-4,4))
					bullet.SetVar("Rotaion",math.random()*25)
					table.insert(bullets, bullet)
				end
			end -- make the bullets go in a random diriction and then gravitate towards the player
			Planet.remove()
		end
	else
		if timer < 400 then
			Boom.sprite.alpha = 1/((timer-(300))/2)
			Boom.sprite.xscale = (timer-(300))/10
			Boom.sprite.yscale = (timer-(300))/10
		elseif timer == 400 then
			Boom.remove()
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
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		end
	end
    if timer >= 700 then
        EndWave()
    end
end