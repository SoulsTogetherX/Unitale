timer = 0
bullets = {}
Sword1 = CreateProjectile("Sword", -Arena.width/2, Arena.height/2 + 10)
Sword1.sprite.rotation = -90
Sword1.sprite.yscale = 1.3
Sword2 = CreateProjectile("Sword", Arena.width/2, Arena.height/2 + 10)
Sword2.sprite.rotation = 90
Sword2.sprite.yscale = -1.3
fight = 1

function Update()
    timer = timer + 1
	if timer%50 == 0 then
		Knife = CreateProjectile("Knife", 0, Arena.height/2 + 30)
		Knife.sprite.rotation = -180
		Knife.SetVar("Type", 3)
		table.insert(bullets, Knife)
	end
	if timer%60 == 0 then
		Sword1.SetVar("S",math.random(1,2))
		if Sword1.GetVar("S") == 1 then
			Sword1.sprite.color = { 1.00, 0.65, 0.00 } -- Orange
			Sword1.SetVar("Type", 1)
		elseif Sword1.GetVar("S") == 2 then
			Sword1.sprite.color = { 0.02, 0.37, 0.97 } -- Blue
			Sword1.SetVar("Type", 2)
		end
		Sword2.SetVar("S",math.random(1,2))
		if Sword2.GetVar("S") == 1 then
			Sword2.sprite.color = { 1.00, 0.65, 0.00 } -- Orange
			Sword2.SetVar("Type", 1)
		elseif Sword2.GetVar("S") == 2 then
			Sword2.sprite.color = { 0.02, 0.37, 0.97 } -- Blue
			Sword2.SetVar("Type", 2)
		end
		if timer > 60 then
			if S1.isactive == true then
				S1.SetVar("Type",0)
				S1.remove()
			end
			if S2.isactive == true then
				S2.SetVar("Type",0)
				S2.remove()
			end
		end
	end
	if (timer+30)%60 == 0 and timer > 60 then
		fight = fight * (-1)
	end
	if fight == 1 and Sword1.y < Arena.height/2 + 10 then
		Sword1.Move(0,5)
		if Sword1.y == -Arena.height/2 then
			S1 = CreateProjectile("Pixel",-Arena.width/4 - 3,-Arena.height/2)
			S1.SetVar("Type", Sword1.GetVar("Type"))
			S1.sprite.color = Sword1.sprite.color
			S1.sprite.alpha = 0.7
		elseif Sword1.y > -Arena.height/2 then
			S1.sprite.xscale = Arena.width/2 - 6
			S1.Move(0, (4.8/2))
			S1.sprite.yscale = S1.sprite.yscale + 4.8
		end
	end
	if fight == 1 and Sword2.y < Arena.height/2 + 10 then
		Sword2.Move(0,5)
		if Sword2.y == -Arena.height/2 then
			S2 = CreateProjectile("Pixel",Arena.width/4 + 3,-Arena.height/2)
			S2.SetVar("Type", Sword2.GetVar("Type"))
			S2.sprite.color = Sword2.sprite.color
			S2.sprite.alpha = 0.7
		elseif Sword2.y > -Arena.height/2 then
			S2.sprite.xscale = Arena.width/2 - 6
			S2.Move(0, (4.8/2))
			S2.sprite.yscale = S2.sprite.yscale + 4.8
		end
	end
	if fight == -1 and Sword1.y > -Arena.height/2 - 10 then
		Sword1.Move(0,-5)
		if Sword1.y == Arena.height/2 then
			S1 = CreateProjectile("Pixel",-Arena.width/4 - 3,Arena.height/2)
			S1.SetVar("Type", Sword1.GetVar("Type"))
			S1.sprite.color = Sword1.sprite.color
			S1.sprite.alpha = 0.7
		elseif Sword1.y < Arena.height/2 then
			S1.sprite.xscale = Arena.width/2 - 6
			S1.Move(0, -(4.8/2))
			S1.sprite.yscale = S1.sprite.yscale + 4.8
		end
	end
	if fight == -1 and Sword2.y > -Arena.height/2 - 10 then
		Sword2.Move(0,-5)
		if Sword2.y == Arena.height/2 then
			S2 = CreateProjectile("Pixel",Arena.width/4 + 3,Arena.height/2)
			S2.SetVar("Type", Sword2.GetVar("Type"))
			S2.sprite.color = Sword2.sprite.color
			S2.sprite.alpha = 0.7
		elseif Sword2.y < Arena.height/2 then
			S2.sprite.xscale = Arena.width/2 - 6
			S2.Move(0, -(4.8/2))
			S2.sprite.yscale = S2.sprite.yscale + 4.8
		end
	end
	for i=1, #bullets do
		bullet = bullets[i]
		bullet.Move(0,-2)
	end
	function OnHit(bullet)
        if bullet.GetVar("Type") == 1 and not Player.isMoving then
    	   	Player.Hurt(4)
    	elseif bullet.GetVar("Type") == 2 and Player.isMoving then
    	    Player.Hurt(4)
    	elseif bullet.GetVar("Type") == 3 then
    	    Player.Hurt(5)
		end
	end
    if timer >= 500 then
        EndWave() 
    end
end