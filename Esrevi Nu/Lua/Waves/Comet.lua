timer = 0
bullets = {}
MoveToPlayer = {}
Fire = CreateProjectile("Fire1",0,400)
Fire.sprite.rotation = -45
Fire.sprite.xscale = 5
Fire.sprite.yscale = 5
Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
Rock = CreateProjectile("Rock1",0,400)
Rock.sprite.xscale = 3
Rock.sprite.yscale = 3

function Update()
    timer = timer + 1
	if Rock.isactive == true and Fire.isactive == true then
		Rock.MoveTo(Rock.x-5,Rock.y-8)
		Rock.sprite.rotation = timer*5
		Fire.MoveTo(Rock.x+50,Rock.y+50)
		for i=1,2 do
			local bullet = CreateProjectile("pixel",Rock.x+(math.random()*50),Rock.y+(math.random()*50))
			bullet.sprite.xscale = 1
			bullet.sprite.yscale = 1
			bullet.SetVar("Type",1)
			table.insert(bullets, bullet)
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
		MoveToPlayer = bullets
		bullets = {}
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
		for i=1,#bullets do
			local bullet = bullets[i]
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
			Player.Hurt(10,0.1)
			bullet.remove()
		end
	end
    if timer >= 300 then
        EndWave()
    end
end