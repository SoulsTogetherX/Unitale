timer = 0
R = 0
bullets = {}
covers = {}
Hider = CreateProjectile("OpenCircle",0,0)
Hider.ppcollision = true
--Hider2 = CreateSprite("Cover","Top")
Hider2 = CreateSprite("Cover1","Top")
Hider2.MoveTo(Hider.absx, Hider.absy)
function Update()
	timer = timer + 1
	if timer <= 50 then
		Hider.sprite.xscale = 50/timer
		Hider.sprite.yscale = 50/timer
		Hider2.xscale = 50/timer
		Hider2.yscale = 50/timer
	end
	if timer > 50 and timer%5 == 0 then
		R = math.random()*3500
		local bullet = CreateProjectile("circle",150 * math.cos(R),150 * math.sin(R))
		bullet.sprite.xscale = 0.1
		bullet.sprite.yscale = 0.1
		bullet.SetVar("Type",1)
		bullet.SetVar("timer",200)
		local distance = math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)
		bullet.SetVar("distance", distance)
		bullet.SetVar("distance_x", ((0- bullet.x) / distance)*((1/(math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)))*700))
		bullet.SetVar("distance_y", ((0- bullet.y) / distance)*((1/(math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)))*700))
		table.insert(bullets, bullet)
		local bullet = CreateSprite("circle","Top")
		bullet.MoveTo((150 * math.cos(R))+320,(150 * math.sin(R))+160)
		bullet.xscale = 0.1
		bullet.yscale = 0.1
		table.insert(covers, bullet)
	end
	if timer < 500 then
		for i=1,#bullets do
			local bullet = bullets[i]
			local distance = bullet.GetVar("distance")
			bullet.SetVar("distance_x", ((0 - bullet.x) / distance)*((1/(math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)))*700))
			bullet.SetVar("distance_y", ((0 - bullet.y) / distance)*((1/(math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)))*700))
			local cover = covers[i]
			if bullet.isactive then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
				cover.MoveTo(cover.x + bullet.GetVar("distance_x"), cover.y + bullet.GetVar("distance_y"))
			end
			bullet.SetVar("timer", bullet.GetVar("timer") - 1)
			if bullet.GetVar("timer") <= 0 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then 
			Player.Hurt(12)
        elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
    	   	Player.Hurt(15)
    	elseif bullet.GetVar("Type") == 3 and Player.isMoving then
    	    Player.Hurt(15)
    	end
	end
	if timer == 500 then
		Hider = CreateProjectile("OpenCircle",0,0)
		Hider.ppcollision = true
		Hider.sprite.xscale = (timer-500)/25
		Hider.sprite.yscale = (timer-500)/25
	end
    if timer > 500 and timer <= 525 then
		for i=1,#covers do
			local bullet = covers[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		Hider.sprite.xscale = (timer-500)/25
		Hider.sprite.yscale = (timer-500)/25
	elseif timer > 525 then
		Hider2.remove()
        EndWave()
    end
end