timer = 0
tim = 0
bullets = {}
Arena.Move(0, 100, true, false) 
Arena.Resize(200, 130)
Shoot = CreateProjectile("Shooter",0,250)
Shoot.SetVar("R",0)
Shoot2 = CreateProjectile("Shooter",0,-50)
Shoot2.SetVar("R",0)
Shoot2.sprite.rotation  = 180
A = 1
B = math.random(25,110)
c = false
function Update()
	timer = timer + 1
	if c == true then
		tim = tim + 1
		if tim >= 20 then
			c = false
			tim = 0
		end
	end
	if timer > 25 then
		Shoot.SetVar("R",Shoot.GetVar("R") + (2*A))
		Shoot.MoveTo(Shoot.GetVar("R"),150)
		Shoot2.SetVar("R",Shoot.GetVar("R") + (2*A))
		Shoot2.MoveTo(-Shoot.GetVar("R"),-150)
		if (timer%B == 0 or Shoot.x < (-Arena.width/2 + 10) or Shoot.x > (Arena.width/2 - 10)) and c ~= true then
			A = A * (-1)
			B = math.random(25,110)
			c = true
		end
		if timer%8 == 0 then
			Audio.PlaySound("Shoot3")
			local bullet = CreateProjectile("Pixel",Shoot.x,Shoot.y - 15)
			bullet.SetVar("Type",1)
			bullet.sprite.Scale(2,2)
			table.insert(bullets,bullet)
			local bullet = CreateProjectile("Pixel",Shoot2.x,Shoot2.y + 15)
			bullet.SetVar("Type",2)
			bullet.sprite.Scale(2,2)
			table.insert(bullets,bullet)
		end
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("Type") == 1 then
				bullet.Move(0,-5)
			elseif bullet.GetVar("Type") == 2 then
				bullet.Move(0,5)
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(2,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(2,0.2)
		end
	end
    if timer >= 750 then
        EndWave()
    end
end