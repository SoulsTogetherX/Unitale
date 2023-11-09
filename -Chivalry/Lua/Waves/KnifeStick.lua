timer = 0
bullets = {}
TargetX = math.random((-Arena.width/2 + 10),(Arena.width/2 - 10))
TargetY = math.random((-Arena.height/2 + 10),(Arena.height/2 - 10))
R = math.random() * 6.2
Knife1 = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
Knife1.SetVar("distance_x", (TargetX - Knife1.x)/50)
Knife1.SetVar("distance_y", (TargetY - Knife1.y)/50)
Knife1.SetVar("Type",1)
R2 = math.random() * 6.2
Knife2 = CreateProjectile("Knife", 400 * math.cos(R2), 400 * math.sin(R2))
Knife2.SetVar("distance_x", (TargetX - Knife2.x)/50)
Knife2.SetVar("distance_y", (TargetY - Knife2.y)/50)
Knife2.SetVar("Type",1)

function Update()
    timer = timer + 1
	if timer%50 == 0 then
		TargetX = math.random((-Arena.width/2 + 10),(Arena.width/2 - 10))
		TargetY = math.random((-Arena.height/2 + 10),(Arena.height/2 - 10))
		R = math.random() * 6.2
		Knife1 = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
		Knife1.SetVar("distance_x", (TargetX - Knife1.x)/50)
		Knife1.SetVar("distance_y", (TargetY - Knife1.y)/50)
		Knife1.SetVar("Type",1)
		R2 = math.random() * 6.2
		Knife2 = CreateProjectile("Knife", 400 * math.cos(R2), 400 * math.sin(R2))
		Knife2.SetVar("distance_x", (TargetX - Knife2.x)/50)
		Knife2.SetVar("distance_y", (TargetY - Knife2.y)/50)
		Knife2.SetVar("Type",1)
	end
	Knife1.MoveTo(Knife1.GetVar("distance_x") + Knife1.x, Knife1.GetVar("distance_y") + Knife1.y)
	Knife1.sprite.rotation = math.deg(math.atan2(TargetY - Knife1.y, TargetX - Knife1.x)) + 270
	Knife2.MoveTo(Knife2.GetVar("distance_x") + Knife2.x, Knife2.GetVar("distance_y") + Knife2.y)
	Knife2.sprite.rotation = math.deg(math.atan2(TargetY - Knife2.y, TargetX - Knife2.x)) + 270
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(3)
		end
	end
    if timer >= 520 then
        EndWave() 
    end
end