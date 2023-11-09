timer = 0
bullets = {}
bullets2 = {}
bullets3 = {}
bullets4 = {}
bullets5 = {}
I = 1
R1 = 2
R2 = 2
R3 = 2
Arena.ResizeImmediate(155, 155)
Player.MoveTo(0,0,false)

function Update()
    timer = timer + 1
	if timer%20 == 0 and timer <= (6*20)then
		local bullet = CreateProjectile("Knife",Arena.width/2 - (I*20) + 20, -Arena.height/2 - 30)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife",-Arena.width/2 - 30, Arena.height/2 - (I*20) + 20)
		bullet.sprite.rotation = -90
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		table.insert(bullets2, bullet)
		I = I + 1
	end
	if timer == (8*20) then
		local bullet = CreateProjectile("Sword",-Arena.width/2 - 30, -Arena.height/2 - 30)
		bullet.ppcollision = true
		bullet.SetVar("Type",2)
		bullet.sprite.rotation = -45
		bullet.SetVar("timer",0)
		table.insert(bullets3, bullet)
	end
	for i=1, #bullets do
		local bullet = bullets[i]
		bullet.SetVar("timer", bullet.GetVar("timer") + 1)
		if bullet.GetVar("timer") < 10 then
			bullet.Move(0,(-2*math.cos(bullet.GetVar("timer")/20)))
		else
			if R1 < 4 then
				R1 = R1 + 0.2
			end
			bullet.Move(0,R1)
		end
	end
	for i=1, #bullets2 do
		local bullet = bullets2[i]
		bullet.SetVar("timer", bullet.GetVar("timer") + 1)
		if bullet.GetVar("timer") < 10 then
			bullet.Move((-2*math.cos(bullet.GetVar("timer")/20)),0)
		else
			if R2 < 4 then
				R2 = R2 + 0.2
			end
			bullet.Move(R2,0)
		end
	end
	for i=1, #bullets3 do
		local bullet = bullets3[i]
		bullet.SetVar("timer", bullet.GetVar("timer") + 1)
		if bullet.GetVar("timer") < 80 then
			bullet.Move((-2*math.cos(bullet.GetVar("timer")/20)),-2*math.cos(bullet.GetVar("timer")/20))
			I = 0
		elseif bullet.GetVar("timer") < 200 and timer%20 == 0 then
			local bullet = CreateProjectile("Knife",Arena.width/2 - (I*20), -Arena.height/2 + 10)
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			table.insert(bullets4, bullet)
			local bullet = CreateProjectile("Knife",-Arena.width/2 + 10, Arena.height/2 - (I*20))
			bullet.sprite.rotation = -90
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			table.insert(bullets5, bullet)
			I = I + 1
		elseif bullet.GetVar("timer") > 160 then
			if R3 < 6 then
				R3 = R3 + 0.4
			end
			bullet.Move(R3,R3)
		end
	end
	function OnHit(bullet)
        if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(3, 0.2)
        elseif bullet.GetVar("Type") == 2 then
    	   	Player.Hurt(5)
		end
	end
	if timer == 420 then
		bullets = bullets4
		bullets2 = bullets5
	end
    if timer >= 500 then
        EndWave() 
    end
end