timer = 0

XCountDown1 = 0
YCountDown1 = 0
local Bullet1 = CreateProjectile('bulletA',50,50)
XMove1 = (2*math.random()) + 0.7
YMove1 = (2*math.random()) + 0.7

XCountDown2 = 0
YCountDown2 = 0
local Bullet2 = CreateProjectile('bulletA',-50,-50)
XMove2 = (-2*math.random()) - 0.7
YMove2 = (-2*math.random()) - 0.7

function Update()
    timer = timer + 1
	Bullet1.MoveTo((Bullet1.x + XMove1), (Bullet1.y + YMove1))
	if ((-Arena.width) / 2 > Bullet1.x or Arena.width / 2 < Bullet1.x) and XCountDown1 == 0 then
	    XMove1 = XMove1 * (-1)
	    XCountDown1 = 10
	end
	if ((-Arena.height) / 2 > Bullet1.y or Arena.height / 2 < Bullet1.y) and YCountDown1 == 0 then
	    YMove1 = YMove1 * (-1)
	    YCountDown1 = 10
	end
	if XCountDown1 > 0 then
	    XCountDown1 = XCountDown1 - 1
	end
	if YCountDown1 > 0 then
	    YCountDown1 = YCountDown1 - 1
	end

	Bullet2.MoveTo((Bullet2.x + XMove2), (Bullet2.y + YMove2))
	if ((-Arena.width) / 2 > Bullet2.x or Arena.width / 2 < Bullet2.x) and XCountDown2 == 0 then
	    XMove2 = XMove2 * (-1)
	    XCountDown2 = 10
	end
	if ((-Arena.height) / 2 > Bullet2.y or Arena.height / 2 < Bullet2.y) and YCountDown2 == 0 then
	    YMove2 = YMove2 * (-1)
	    YCountDown2 = 10
	end
	if XCountDown2 > 0 then
	    XCountDown2 = XCountDown2 - 1
	end
	if YCountDown2 > 0 then
	    YCountDown2 = YCountDown2 - 1
	end
	
    if timer >= 550 then
        EndWave()
    end
end