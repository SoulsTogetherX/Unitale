timer = 0
w = 0
I = 0
T = 99999
R = 0
Fast = 16
Done = false
Stop = false
bullets = {}
bullets2 = {}
SetGlobal("Animate",true) -- KEEP THIS
for i=1,8 do
	local bullet = CreateProjectile("Pixel", Arena.width+(i*20)-245, Arena.height/2)
	bullet.sprite.xscale = 18
	bullet.SetVar("Type",1)
	bullet.SetVar("Go_down",false)
	bullet.SetVar("Go_Right",false)
	bullet.SetVar("Done",false)
	table.insert(bullets,bullet)
end

function Update()
    timer = timer + 1
	if timer%5 == 0 and timer > 35 and w < #bullets then
		w = w + 1
		for i=1,#bullets do
			local bullet = bullets[i]
			if i == w then
				bullet.SetVar("Go_down",true)
			end
		end
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("Go_down") == true and bullet.sprite.yscale < Arena.height - 32 then
			bullet.sprite.yscale = bullet.sprite.yscale + Fast
			bullet.MoveTo(bullet.x,bullet.y-(Fast/2))
		elseif bullet.GetVar("Go_down") == true and bullet.sprite.yscale >= Arena.height - 32 and bullets[w] == bullet and Stop == false then
			Done = true
			Stop = true
		end
	end
	if Done == true then
		Audio.PlaySound("Change")
		for i=1,#bullets do
			local bullet = bullets[i]
			local isOrange = math.random() >= 0.5
			if isOrange then
				bullet.sprite.color = { 1.00, 0.65, 0.00 }
				bullet.SetVar("Type", 2)
			else
				bullet.sprite.color = { 0.02, 0.37, 0.97 }
				bullet.SetVar("Type", 3)
			end
		end
		T = timer
		Fast = -2
		Done = false
	end
	if timer >= T + 50 and timer < T + 150 then
		Fast = Fast + 0.1
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.sprite.yscale < Arena.height then
				bullet.sprite.yscale = bullet.sprite.yscale + Fast
				bullet.Move(0,-(Fast/2))
			end
		end
	end
	if timer == T + 150 then
		Fast = 0
		w = #bullets
		I = #bullets
	end
	if timer > T + 150 and timer < T + 170 then
		Fast = Fast + 0.1
		for i=1,#bullets do
			local bullet = bullets[i]
			bullet.sprite.yscale = bullet.sprite.yscale - Fast
			bullet.MoveTo(bullet.x,bullet.y+(Fast/2))
		end
	end
	if timer > T + 170 and timer < T + 270 then
		if timer == T + 171 then
			Audio.PlaySound("Shoot2")
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.x < Arena.width/2+10 then
				bullet.Move(2,0)
			elseif bullet.sprite.yscale < Arena.height then
				bullet.sprite.yscale = bullet.sprite.yscale + 6
				bullet.Move(0,-(3))
			end
		end
	end
	if timer > T + 270 then
		w = I
	end
	if timer > T + 270 and timer%20 == 0 then
		I = I - 1
		if I > -1 then
			Audio.PlaySound("Shoot2")
			for i=1,#bullets do
				local bullet = bullets[w]
				bullet.SetVar("Go_Right",true)
			end
		end
	end
	if timer > T + 270 and timer%18 == 0 then
		R = R + 1
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Star",250*math.cos(R),250*math.sin(R))
		local distance = math.sqrt((0 - bullet.x)^2 + (0 - bullet.y)^2)
		bullet.SetVar("distance_x", (((0+(math.random()*50)) - bullet.x) / distance)*5)
		bullet.SetVar("distance_y", (((0+(math.random()*50)) - bullet.y) / distance)*5)
		bullet.SetVar("Type", 1)
		table.insert(bullets2,bullet)
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("Go_Right") == true then
			bullet.Move(-10,0)
		end
	end
	for i=1,#bullets2 do
		local bullet = bullets2[i]
		if bullet.isactive then
			bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
		end
		if bullet.x < -320 or bullet.y < -250 then
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	end
    function OnHit(bullet)
        if bullet.isactive then
		    if bullet.GetVar("Type") == 1 then
			    Player.Hurt(12,0.3)
        	elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
    	    	Player.Hurt(15,0.3)
    	    elseif bullet.GetVar("Type") == 3 and Player.isMoving then
    		    Player.Hurt(15,0.3)
    	    end
        end
    end
    if timer >= 600 then
		Audio.LoadFile("Space-Trip")
		Audio.Volume(0.6)
		Audio.Pitch(1)
		SetGlobal("A",false)
        EndWave()
    end
end