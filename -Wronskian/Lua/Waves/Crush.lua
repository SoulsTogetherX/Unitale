timer = 0
timer2 = 0
bullets = {}
Arena.ResizeImmediate(140, 130)
Player.MoveTo(-25,-200,false)
Pole1 = CreateProjectile("Pole1",Arena.width/4,240 + Arena.height/2)
Wall1 = CreateProjectile("WallSpike",Arena.width/4,Arena.height/2)
Wall1.sprite.rotation = -90
Wall1.ppcollision = true
Wall1.SetVar("Type",1)
Pole2 = CreateProjectile("Pole1",-Arena.width/4,240 + Arena.height/2)
Wall2 = CreateProjectile("WallSpike",-Arena.width/4,Arena.height/2)
Wall2.sprite.rotation = -90
Wall2.ppcollision = true
Wall2.SetVar("Type",1)
A = 1
B = 1
function Update()
	timer = timer + 1
	Pole1.MoveTo(Wall1.x, Wall1.y + 240)
	Pole2.MoveTo(Wall2.x, Wall2.y + 240)
	if A == 1 then
		if Wall1.y > -Arena.height/2 + 10 then
			Wall1.Move(0,-5)
		elseif timer2 >= 15 then
			A = A*(-1)
			timer2 = 0
		else
			timer2 = timer2 + 1
		end
		if Wall2.y < Arena.height/2 then
			Wall2.Move(0,5)
		end
	end
	if A == -1 then
		if Wall2.y > -Arena.height/2 + 10 then
			Wall2.Move(0,-5)
		elseif timer2 >= 15 then
			A = A*(-1)
			timer2 = 0
		else
			timer2 = timer2 + 1
		end
		if Wall1.y < Arena.height/2 then
			Wall1.Move(0,5)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(5)
		elseif bullet.GetVar("Type") == 2 or bullet.GetVar("Type") == 3 then
			Player.Hurt(2,0.2)
		end
	end
    if timer >= 550 then
        EndWave()
    end
end