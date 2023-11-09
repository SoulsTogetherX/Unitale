timer = 0
Pausetime = 0
bullets = {}
MoveToPlayer = {}
Animation = {}
R = 0
B = 1
P = 1
C = 0
S = false
Arena.ResizeImmediate(220, 220)
Time = CreateProjectile("circle",0,0)
Time.remove()
 
function Update()
	Pausetime = Pausetime + 1
	if Time.isactive == false then
		timer = timer + 1
	end
	--if timer%140 == 0 then
	--	B = B * (-1)
	--end
	for i=1,#Animation do
		local bullet = Animation[i]
		if bullet.sprite.animcomplete == true and bullet.isactive == true then
			bullet.remove()
		end
		bullet.SetVar("Type", 0)
	end
	if Pausetime%200 == 0 then
		Time = CreateProjectile("circle",0,0)
		Time.sprite.xscale = 0.01
		Time.sprite.yscale = 0.01
		Time.sprite.alpha = 0.5
		P = 0
	end
	if (Pausetime-50)%200 == 0 and P == 0 then
		for i=1,#MoveToPlayer do
			local bullet = MoveToPlayer[i]
			if bullet.isactive == true then
				bullet.sprite.SetAnimation({"StarD1", "StarD2", "StarD3","StarD4"}) 
				bullet.sprite.loopmode = "ONESHOT"
				table.insert(Animation, bullet)
			end
		end
		MoveToPlayer = bullets
		bullets = {}
		for i=1,#MoveToPlayer do
			local bullet = MoveToPlayer[i]
			if bullet.isactive == true then
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*1)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*1)
				bullet.sprite.color = {0.5, 0.5, 0.5}
			end
		end
		S = true
		P = 1
	end
	if P == 0 then
		if Time.isactive == true then
			Time.sprite.xscale = Time.sprite.xscale + 0.6
			Time.sprite.yscale = Time.sprite.yscale + 0.6
		end
	end
	if P == 1 then
		if S == true then
			S = false
		end
		if timer%20 == 0 then
			C = C + 0.5
		end
		if timer%2 == 0 then
			R = R + (3 * B)
			bullet = CreateProjectile("Star",300*math.cos(R),300*math.sin(R))
			local distance = math.sqrt((300*math.cos(C) - bullet.x)^2 + (300*math.sin(C) - bullet.y)^2)
			bullet.SetVar("distance_x", ((300*math.cos(C) - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((300*math.sin(C) - bullet.y) / distance)*3)
			bullet.SetVar("Type", 1)
			table.insert(bullets, bullet)
		end
		Player.SetControlOverride(false)
		if Time.isactive == true then
			Time.remove()
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
		for i=1,#MoveToPlayer do
			local bullet = MoveToPlayer[i]
			if bullet.isactive then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			end
			if bullet.x < -320 or bullet.y < -250 then
				if bullet.isactive == true and bullet.GetVar("Type") == 1 then
					bullet.remove()
				end
			end
		end
	elseif P == 0 then
		Player.SetControlOverride(true)
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(12)
		end
	end
    if timer >= 700 then
        EndWave()
    end
end