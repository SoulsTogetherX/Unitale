timer = 0
bullets = {}
S1 = CreateProjectile("SmallSpike_up",300,100)
S2 = CreateProjectile("SmallSpike_up",300,50)
S3 = CreateProjectile("SmallSpike_up",300,0)
S4 = CreateProjectile("SmallSpike_up",300,-50)
S5 = CreateProjectile("SmallSpike_up",300,-100)
bullets = {S1, S2, S3, S4, S5}

for i = 1, #bullets do
	bullet = bullets[i]
	bullet.SetVar("distance_x",0)
	bullet.SetVar("distance_y",0)
	bullet.SetVar("Type",1)
end

function Update()
	timer = timer + 1
	if timer%60 == 0 then
		Audio.PlaySound("Shoot1")
		Audio.PlaySound("Shoot1")
	end
	for i = 1, #bullets do
		bullet = bullets[i]
		if timer%60 == 0 or timer == 1 then
			local X = (50*math.random()) + Player.x
			local Y = (50*math.random()) + Player.y
			bullet.sprite.rotation = math.deg(math.atan2(Y - bullet.y, X - bullet.x)) + 90
			local distance = math.sqrt((X - bullet.x)^2 + (Y - bullet.y)^2)
			local distance_x = ((X - bullet.x) / distance)*5
			local distance_y = ((Y - bullet.y) / distance)*5
			bullet.SetVar("distance_x", distance_x)
			bullet.SetVar("distance_y", distance_y)
		end
		bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(3,0.5)
		end
	end
    if timer >= 750 then
        EndWave()
    end
end