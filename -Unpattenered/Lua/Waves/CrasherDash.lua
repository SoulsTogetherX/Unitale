b1 = CreateProjectile('bulletA', 100, 100)
b1.SetVar("X",100)
b2 = CreateProjectile('bulletA', 100, 50)
b2.SetVar("X",100)
b3 = CreateProjectile('bulletA', 100, 0)
b3.SetVar("X",100)
b4 = CreateProjectile('bulletA', 100, -50)
b4.SetVar("X",100)
b5 = CreateProjectile('bulletA', -100, 100)
b5.SetVar("X",-100)
b6 = CreateProjectile('bulletA', -100, 50)
b6.SetVar("X",-100)
b7 = CreateProjectile('bulletA', -100, 0)
b7.SetVar("X",-100)
b8 = CreateProjectile('bulletA', -100, -50)
b8.SetVar("X",-100)
Bullets = {b1, b2, b3, b4, b5, b6, b7, b8}
timer = 0
X = 0
Y = 0
for i=1,#Bullets do
	bullet = Bullets[i]
    bullet.SetVar('xspeed', 0)
    bullet.SetVar('yspeed', 0)
end
function Update()
    timer = timer + 1
	Arena.Resize((200-(timer/3)), 200)
	if (timer)%50 == 0 then
	    for i=1,#Bullets do
	        bullet = Bullets[i]
            bullet.SetVar('Y', ((math.sin(math.random()*360))*100))
            bullet.SetVar('X', (bullet.GetVar("X"))*(-1))
		end
	end
	if timer > 50 then
	    for i=1,#Bullets do 
	        bullet = Bullets[i]
	        local Y = bullet.GetVar("Y")
	        local X = bullet.GetVar("X")
	        local xdifference = X - bullet.x
            local ydifference = Y - bullet.y
            local xspeed = (xdifference / 50)
            local yspeed = (ydifference / 50)
            bullet.Move(xspeed, yspeed)
            bullet.SetVar('xspeed', xspeed)
            bullet.SetVar('yspeed', yspeed)
	    end
	end
    if timer >= 360 then
         EndWave() 
    end
end