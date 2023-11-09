timer = 0
bullets = {}
Pole1 = CreateProjectile("Pole1",390,0)
Pole1.sprite.rotation = -90
Wall1 = CreateProjectile("WallSpike",150,0)
Wall1.sprite.rotation = 180
Wall1.SetVar("Type",1)
Pole2 = CreateProjectile("Pole1",-390,0)
Pole2.sprite.rotation = 90
Wall2 = CreateProjectile("WallSpike",-150,0)
Wall2.SetVar("Type",1)
A = 0

function Update()
	timer = timer + 1
	Pole1.MoveTo(Wall1.x + 240,Wall1.y)
	Pole2.MoveTo(Wall2.x - 240,Wall2.y)
	if A == 0 and timer%40 == 0 then
		A = 1
	end
	if A == 0 then
		if Wall1.y > Player.y then
			Wall1.Move(0,-2)
		elseif Wall1.y < Player.y then
			Wall1.Move(0,2)
		end
		if Wall2.y > Player.y then
			Wall2.Move(0,-2)
		elseif Wall2.y < Player.y then
			Wall2.Move(0,2)
		end
	end
	if A == 1 then
		if Wall1.x > 11 then
			Wall1.Move(-5,0)
		elseif Wall1.x < 11 then
			A = 2
		end
		if Wall2.x < -11 then
			Wall2.Move(5,0)
		elseif Wall2.x > -11 then
			A = 2
		end
	end
	if A == 2 then
		if Wall1.x < 150 then
			Wall1.Move(5,0)
		elseif Wall1.x == 150 then
			A = 0
		end
		if Wall2.x > -150 then
			Wall2.Move(-5,0)
		elseif Wall2.x == 150 then
			A = 0
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(5,0.5)
		end
	end
    if timer >= 550 then
        EndWave()
    end
end