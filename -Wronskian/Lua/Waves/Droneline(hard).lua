timer = 0
bullets = {}
Arena.Move(0, 100, true, false) 
Shoot1 = CreateProjectile("Shooter",0,250)
Shoot2 = CreateProjectile("Shooter",150,100)
Shoot2.sprite.rotation = -90
Shoot3 = CreateProjectile("Shooter",-150,100)
Shoot3.sprite.rotation = 90
Shoot4 = CreateProjectile("Shooter",0,-50)
Shoot4.sprite.rotation = 180
A = -1

function Update()
	timer = timer + 1

	if timer > 50 then
		if timer%35 == 1 then
			A = A * (-1)
		end
	end
	if A ~= 1 then
		if Shoot1.x > Player.x then
			Shoot1.Move(-2,0)
		elseif Shoot1.x < Player.x then
			Shoot1.Move(2,0)
		end
		if Shoot2.y > Player.y then
			Shoot2.Move(0,-2)
		elseif Shoot2.y < Player.y then
			Shoot2.Move(0,2)
		end
		if Shoot3.y > Player.y then
			Shoot3.Move(0,-1)
		elseif Shoot3.y < Player.y then
			Shoot3.Move(0,1)
		end
		if Shoot4.x > Player.x then
			Shoot4.Move(-1,0)
		elseif Shoot4.x < Player.x then
			Shoot4.Move(1,0)
		end
	else
		if Shoot1.x > Player.x then
			Shoot1.Move(-1,0)
		elseif Shoot1.x < Player.x then
			Shoot1.Move(1,0)
		end
		if Shoot2.y > Player.y then
			Shoot2.Move(0,-1)
		elseif Shoot2.y < Player.y then
			Shoot2.Move(0,1)
		end
		if Shoot3.y > Player.y then
			Shoot3.Move(0,-0.5)
		elseif Shoot3.y < Player.y then
			Shoot3.Move(0,0.5)
		end
		if Shoot4.x > Player.x then
			Shoot4.Move(-0.5,0)
		elseif Shoot4.x < Player.x then
			Shoot4.Move(0.5,0)
		end
	end
	if A == 1 and timer%5 == 0 then
		Audio.PlaySound("Shoot1")
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Pixel",Shoot1.x, Shoot1.y - 15)
		bullet.SetVar("Type",2)
		bullet.sprite.Scale(4,4)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Pixel",Shoot2.x - 15, Shoot2.y)
		bullet.SetVar("Type",1)
		bullet.sprite.Scale(4,4)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Pixel",Shoot3.x + 15, Shoot3.y)
		bullet.SetVar("Type",3)
		bullet.sprite.Scale(4,4)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Pixel",Shoot4.x, Shoot4.y - 15)
		bullet.SetVar("Type",4)
		bullet.sprite.Scale(4,4)
		table.insert(bullets,bullet)
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("Type") == 1 then
				bullet.Move(-10, 0)
			elseif bullet.GetVar("Type") == 2 then
				bullet.Move(0,-10)
			elseif bullet.GetVar("Type") == 3 then
				bullet.Move(10,0)
			elseif bullet.GetVar("Type") == 4 then
				bullet.Move(0,10)
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		Player.Hurt(2,0.2)
	end
    if timer >= 550 then
        EndWave()
    end
end