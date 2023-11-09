timer = 0
bullets = {}
bullets2 = {}
MoveToPlayer = {}
Fire = CreateProjectile("Fire1",0,400)
Fire.sprite.rotation = -45
Fire.sprite.xscale = 5
Fire.sprite.yscale = 5
Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
Rock = CreateProjectile("Rock1",0,400)
Rock.sprite.xscale = 3
Rock.sprite.yscale = 3
BigStar = CreateProjectile("BigStar",0,400)
Gravity = 0.025


function Update()
    timer = timer + 1
	if BigStar.isactive == true and timer > 110 then
		BigStar.sprite.color32 = {255, 225-(timer*25.5), 225-(timer*25.5)}
	end
	if timer < 100 then
		BigStar.MoveTo(0,BigStar.y-2)
	elseif timer < 150 and timer >= 125 then
		BigStar.sprite.xscale = 1-((timer-125)/50)
		BigStar.sprite.yscale = 1-((timer-125)/50)
	elseif timer == 150 then
		if BigStar.isactive == true then
			BigStar.remove()
		end
		for i=1,40 do
			local bullet = CreateProjectile("Star",0,200)
			bullet.SetVar("VSpeed",(math.random()*6)-2)
			bullet.SetVar("HSpeed",(math.random()*10)-5)
			bullet.SetVar("Rotaion",math.random()*25)
			bullet.SetVar("Type",2)
			table.insert(bullets, bullet)
		end
	elseif timer > 150 then
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
	if Rock.isactive == true and Fire.isactive == true then
		Rock.MoveTo(Rock.x-5,Rock.y-8)
		Rock.sprite.rotation = timer*5
		Fire.sprite.xscale = 5
		Fire.sprite.yscale = 5
		Fire.MoveTo(Rock.x+50,Rock.y+50)
		for i=1,2 do
			local bullet = CreateProjectile("pixel",Rock.x+(math.random()*50),Rock.y+(math.random()*50))
			bullet.sprite.xscale = 1
			bullet.sprite.yscale = 1
			bullet.SetVar("Type",1)
			table.insert(bullets2, bullet)
		end
		if Rock.y < -250 then
			Rock.remove()
			Fire.remove()
		end
	elseif timer == 100 then
		Time = CreateProjectile("circle",0,0)
		Time.sprite.xscale = 0.01
		Time.sprite.yscale = 0.01
		Time.sprite.alpha = 0.5
	elseif timer > 100 and timer < 150 then
		Time.sprite.xscale = Time.sprite.xscale + 0.6
		Time.sprite.yscale = Time.sprite.yscale + 0.6
		Player.SetControlOverride(true)
	elseif timer == 150 then
		Player.SetControlOverride(false)
		Time.remove()
		MoveToPlayer = bullets2
		bullets2 = {}
		for i=1,#MoveToPlayer do
			local bullet = MoveToPlayer[i]
			if bullet.isactive == true then
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", (((Player.x+(math.random()*50)) - bullet.x) / distance)*3)
				bullet.SetVar("distance_y", (((Player.y+(math.random()*50)) - bullet.y) / distance)*3)
			end
		end
	end
	if timer < 100 then
		for i=1,#bullets2 do
			local bullet = bullets2[i]
			bullet.MoveTo(bullet.x-0.1,bullet.y-0.1*(8/5))
		end
	end
	for i=1,#MoveToPlayer do
		local bullet = MoveToPlayer[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
		end
		if bullet.x < -320 or bullet.y < -250 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(6,0.1)
			bullet.remove()
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(12)
		end
	end
    if timer >= 450 then
        EndWave()
    end
end