timer = 0
timer2 = 0
bullets = {}
TargetX = math.random((-Arena.width/2 + 10),(Arena.width/2 - 10))
TargetY = math.random((-Arena.height/2 + 10),(Arena.height/2 - 10))
R = math.random() * 6.2
Knife1 = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
Knife1.SetVar("distance_x", (TargetX - Knife1.x)/50)
Knife1.SetVar("distance_y", (TargetY - Knife1.y)/50)
Knife1.SetVar("Type",1)
Knife1.sprite.rotation = math.deg(math.atan2(TargetY - Knife1.y, TargetX - Knife1.x)) + 270
R2 = math.random() * 6.2
Knife2 = CreateProjectile("Knife", 400 * math.cos(R2), 400 * math.sin(R2))
Knife2.SetVar("distance_x", (TargetX - Knife2.x)/50)
Knife2.SetVar("distance_y", (TargetY - Knife2.y)/50)
Knife2.SetVar("Type",1)
Knife2.sprite.rotation = math.deg(math.atan2(TargetY - Knife2.y, TargetX - Knife2.x)) + 270
BOMB = false
Bomb = CreateProjectile("Boom", 4000,40000)
Bomb.remove()

function Update()
    timer = timer + 1
	if timer%100 == 0 then
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
		Knife1.sprite.rotation = math.deg(math.atan2(TargetY - Knife1.y, TargetX - Knife1.x)) + 270
		Knife2.sprite.rotation = math.deg(math.atan2(TargetY - Knife2.y, TargetX - Knife2.x)) + 270
	end
	if Knife1.isactive == true then
		Knife1.MoveTo(Knife1.GetVar("distance_x") + Knife1.x, Knife1.GetVar("distance_y") + Knife1.y)
	end
	if Knife1.isactive == true then
		Knife2.MoveTo(Knife2.GetVar("distance_x") + Knife2.x, Knife2.GetVar("distance_y") + Knife2.y)
	end
	if Knife1.x < TargetX + 3 and Knife1.x > TargetX - 3 and Knife1.y < TargetY + 3 and Knife1.y > TargetY - 3 and Knife1.isactive == true then
		Audio.PlaySound("000029f8")
		Bomb = CreateProjectile("Boom", TargetX, TargetY)
		Bomb.SetVar("timer",0)
		Bomb.SetVar("Type",2)
		table.insert(bullets, Bomb)
		Audio.PlaySound("Bomb")
		if Knife2.isactive == true then
			Knife2.remove()
		end
		if Knife1.isactive == true then
			Knife1.remove()
		end
	end
	for i=1,#bullets do
		local Bomb = bullets[i] 
		if Bomb.isactive == true then
			Bomb.SetVar("timer",Bomb.GetVar("timer") + 1)
			Bomb.sprite.alpha = 1/(Bomb.GetVar("timer")/6)
			Bomb.sprite.xscale = (Bomb.GetVar("timer"))/10
			Bomb.sprite.yscale = (Bomb.GetVar("timer"))/10
			if Bomb.sprite.alpha <= 0.2 then
				Bomb.SetVar("Type",0)
				Bomb.remove()
				Bomb = false
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(3)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(5)
		end
	end
    if timer >= 400 then
        EndWave() 
    end
end