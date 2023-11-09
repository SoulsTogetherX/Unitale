timer = 0
bullets = {}
Sword = CreateProjectile("Knife", -40, 0)
Sword.SetVar("Type",1)
Sword.ppcollision = true
Sword2 = CreateProjectile("Knife", -40, 0)
Sword2.SetVar("Type",1)
Sword2.ppcollision = true
X = 0
Y = 40
R = 0
Gravity = 0.5
function Update()
    timer = timer + 1
	X1 = 20*math.cos(timer/20) + X + 15
	X2 = 20*math.cos((timer + 1)/20) + X + 15
	Y1 = 100*math.sin(timer/20) + Y
	Y2 = 100*math.sin((timer + 1)/20) + Y
	
	X3 = 20*math.cos(timer/20) + X - 15
	X4 = 20*math.cos((timer + 1)/20) + X - 15
	Y3 = 100*math.sin(timer/20) + Y
	Y4 = 100*math.sin((timer + 1)/20) + Y
	Sword.MoveTo(X1,Y1)
	Sword.sprite.rotation = math.deg(math.atan(X1 - X2, Y1 - Y2)) + 270
	Sword2.MoveTo(X3,Y4)
	Sword2.sprite.rotation = math.deg(math.atan(X3 - X4, Y3 - Y4)) - 90
	Sword2.sprite.xscale = -1
	if Player.x > X then
		X = X + Gravity
	elseif Player.x < X then
		X = X - Gravity
	end
	if Player.y > Y then
		Y = Y + Gravity
	elseif Player.y < Y then
		Y = Y - Gravity
	end
	function OnHit(bullet)
        if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(3)
		end
	end
    if timer >= 500 then
        EndWave() 
    end
end