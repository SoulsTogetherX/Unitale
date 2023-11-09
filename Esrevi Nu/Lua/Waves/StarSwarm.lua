timer = 0
T = 0
bullets = {}
Arena.Resize(155, 130)
Time = math.random(20,100)+100
for i=1,6 do
	local bullet = CreateProjectile("Star",100,100)
	bullet.SetVar("Type",1)
	table.insert(bullets, bullet)
end
R = 100
R2 = 0
Rotation = 50
Attack = false

function Update()
	timer = timer + 1
	if timer >= Time and Attack == false then
		T = timer
		R2 = R * (-1)
		Attack = true
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if Attack == false then
			bullet.MoveTo(R * math.cos((timer/10) + ((i-1) * Rotation)),R * math.sin((timer/10) + ((i-1) * Rotation)))
		elseif Attack == true then
			if timer >= T + 50 and R > R2 then
				R = R - 1
			elseif timer >= T + 50 and R < R2 then
				R = R + 1
			elseif timer >= T + 50 and R == R2 then
				timer = T
				Time = (math.random(20,100)+100) + T
				local bullet = CreateProjectile("Star",100,100)
				bullet.SetVar("Type",1)
				table.insert(bullets, bullet)
				Rotation = Rotation + 10
				Attack = false
			end
			bullet.MoveTo(R * math.cos((T/10) + ((i-1) * Rotation)),R * math.sin((T/10) + ((i-1) * Rotation)))
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(6,0.1)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end