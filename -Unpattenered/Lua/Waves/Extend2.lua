U1 = CreateProjectile('bulletA', 0, 130)
U1.SetVar("Y",130)
U2 = CreateProjectile('bulletA', 0, 130)
U2.SetVar("Y",110)
U3 = CreateProjectile('bulletA', 0, 130)
U3.SetVar("Y",90)
U4 = CreateProjectile('bulletA', 0, 130)
U4.SetVar("Y",70)
U5 = CreateProjectile('bulletA', 0, 130)
U5.SetVar("Y",50)
U6 = CreateProjectile('bulletA', 0, 130)
U6.SetVar("Y",30)
U7 = CreateProjectile('bulletA', 0, 130)
U7.SetVar("Y",10)
U8 = CreateProjectile('bulletA', 0, 130)
U8.SetVar("Y",-10)
U9 = CreateProjectile('bulletA', 0, 130)
U9.SetVar("Y",-30)
U10 = CreateProjectile('bulletA', 0, 130)
U10.SetVar("Y",-50)
BulletU = {U1, U2, U3, U4, U5, U6, U7, U8, U9, U10}
D1 = CreateProjectile('bulletA', 0, -57)
D1.SetVar("Y",-97)
D2 = CreateProjectile('bulletA', 0, -57)
D2.SetVar("Y",-77)
D3 = CreateProjectile('bulletA', 0, -57)
D3.SetVar("Y",-57)
D4 = CreateProjectile('bulletA', 0, -57)
D4.SetVar("Y",-37)
D5 = CreateProjectile('bulletA', 0, -57)
D5.SetVar("Y",-17)
D6 = CreateProjectile('bulletA', 0, -57)
D6.SetVar("Y",13)
D7 = CreateProjectile('bulletA', 0, -57)
D7.SetVar("Y",33)
D8 = CreateProjectile('bulletA', 0, -57)
D8.SetVar("Y",53)
D8.sprite.color = {1.00, 0.00, 0.00}
BulletD = {D1, D2, D3, D4, D5, D6, D7, D8}
Arena.Resize(16, 200)
timer = -100
Timer2 = 0
T = 0
for i=1,#BulletU do
	bullet = BulletU[i]
    bullet.SetVar("Type",0)
end
for i=1,#BulletD do
	bullet = BulletD[i]
    bullet.SetVar("Type",0)
end

function Update()
    timer = timer + 1
	if timer >= 50 then
	    Timer2 = Timer2 + 1
	    if (Timer2)%100 == 0 then
	        if T < 4 then
	            T = T + 1
	    	elseif T >= 5 then
	            T = 0
		    end
	    end
	end
	if timer >= 0 then
	    if T == 0 then
	        for i=1,#BulletD do
		        bullet = BulletD[i]
		    	local Y = bullet.GetVar("Y")
		    	if bullet.y <= Y then
		    	    bullet.MoveTo(0,bullet.y + ((Y-bullet.y)/10))
			    end
            end
		D8.sprite.color = {1.00, 1.00, 1.00}
		U10.sprite.color = {1.00, 0.00, 0.00}
	    elseif T == 1 then
		    for i=1,#BulletD do
		        bullet = BulletD[i]
		    	bullet.MoveTo(0,bullet.y - 5)
            end
	    elseif T == 2 then
	        for i=1,#BulletU do
		        bullet = BulletU[i]
		    	local Y = bullet.GetVar("Y")
	    		if bullet.y >= Y then
		    	    bullet.MoveTo(0,bullet.y + ((Y-bullet.y)/10))
		    	end
            end
	   	U10.sprite.color = {1.00, 1.00, 1.00}
	    elseif T == 3 then
	        for i=1,#BulletU do
		        bullet = BulletU[i]
	    		bullet.MoveTo(0, bullet.y + 5)
            end
	    end
	end
    function OnHit(bullet)
	    if bullet.GetVar("Type") == 0 then
		    Player.Hurt(3)
	    end
    end
    if timer >= 400 then
        EndWave() 
    end
end