timer = 0
bullets = {}
Arena.Move(0, 100, true, false) 
Shoot1 = CreateProjectile("Shooter",0,250)
Shoot2 = CreateProjectile("Shooter",150,100)
Shoot2.sprite.rotation = -90
A = 1

function Update()
	timer = timer + 1

	if timer > 25 then
		if timer%50 == 1 then
			A = A * (-1)
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
		end
		if A == 1 and timer%10 == 0 then
			if timer%10 == 0 then
				Audio.PlaySound("Shoot1")
				local bullet = CreateProjectile("Pixel",Shoot1.x, Shoot1.y - 15)
				bullet.SetVar("Type",2)
				bullet.sprite.Scale(4,4)
				table.insert(bullets,bullet)
				local bullet = CreateProjectile("Pixel",Shoot2.x - 15, Shoot2.y)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(4,4)
				table.insert(bullets,bullet)
			end
		end
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("Type") == 1 then
				bullet.Move(-5, 0)
			elseif bullet.GetVar("Type") == 2 then
				bullet.Move(0,-5)
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
    if timer >= 600 then
        EndWave()
    end
end