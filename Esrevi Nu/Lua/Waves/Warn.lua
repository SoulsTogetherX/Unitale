timer2 = 0
timer = 0
bullets = {}
WarningStars = {}
Actions = {}
I = 1
Warnings = 4 -- number of attacks, put it to 100 if you want hard mode, but... don't try a number like 99999 you will crash the game. At 1000 you will lag out the game as well.
I2 = 1

for i=1,Warnings do
	local bullet = CreateProjectile("pixel",10000,0)
	local Color = math.random()*5
	if Color > 0 and Color <= 1 then --Fill up will all white
		bullet.MoveTo(10000, 0.25*Arena.height)
		bullet.sprite.xscale = Arena.width
		bullet.sprite.yscale = Arena.height/2
		bullet.SetVar("Warn", 1)
	elseif Color > 1 and Color <= 2 then --Fill down will all white
		bullet.MoveTo(10000, (-0.25*Arena.height))
		bullet.sprite.xscale = Arena.width
		bullet.sprite.yscale = Arena.height/2
		bullet.SetVar("Warn", 2)
	elseif Color > 2 and Color <= 3 then --Fill mid will all white
		bullet.MoveTo(10000, 0)
		bullet.sprite.xscale = Arena.width
		bullet.sprite.yscale = Arena.height/2
		bullet.SetVar("Warn", 3)
	elseif Color > 3 and Color <= 4 then --fill box with orange
    	bullet.sprite.color = { 1.00, 0.65, 0.00 }
		bullet.MoveTo(10000, 0)
		bullet.sprite.xscale = Arena.width
		bullet.sprite.yscale = Arena.height
		bullet.SetVar("Warn", 4)
	elseif Color > 4 and Color <= 5 then --fill box with blue
    	bullet.sprite.color = { 0.02, 0.37, 0.97 }
		bullet.MoveTo(10000, 0)
		bullet.sprite.xscale = Arena.width
		bullet.sprite.yscale = Arena.height
		bullet.SetVar("Warn", 5)
	end
	table.insert(WarningStars, bullet)
end

function Update()
	for i=1,#WarningStars do
		bullet = WarningStars[i]
		bullet.sprite.alpha = timer2/40
		if i == I and bullet.isactive then
			if bullet.GetVar("Warn") == 1 then
				bullet.MoveTo(0, 0.25*Arena.height)
				if timer2 >= 40 then
					bullet.remove()
					table.insert(Actions, 1)
					timer2 = 0
					I = I + 1
				end
			elseif bullet.GetVar("Warn") == 2 then
				bullet.MoveTo(0, (-0.25*Arena.height))
				if timer2 >= 40 then
					bullet.remove()
					table.insert(Actions, 2)
					timer2 = 0
					I = I + 1
				end
			elseif bullet.GetVar("Warn") == 3 then
				bullet.MoveTo(0, 0)
				if timer2 >= 40 then
					bullet.remove()
					table.insert(Actions, 3)
					timer2 = 0
					I = I + 1
				end
			elseif bullet.GetVar("Warn") == 4 then
				bullet.MoveTo(0, 0)
				if timer2 >= 40 then
					bullet.remove()
					table.insert(Actions, 4)
					timer2 = 0
					I = I + 1
				end
			elseif bullet.GetVar("Warn") == 5 then
				bullet.MoveTo(0, 0)
				if timer2 >= 40 then
					bullet.remove()
					table.insert(Actions, 5)
					timer2 = 0
					I = I + 1
				end
			end
		end
	end
	if I < Warnings + 1 then
		timer2 = timer2 + 1
	elseif I == Warnings + 1 then
		if timer == 0 then
			timer2 = 0
			I2 = 1
		end
		timer = timer + 1
		if timer > 10 then
			timer2 = timer2 + 1
			if Actions[I2] == 1 then
				if timer2 < 50 then
					local bullet = CreateProjectile("Star",Arena.width/2,math.random(0,(Arena.height/2)))
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				end
			elseif Actions[I2] == 2 then
				if timer2 < 50 then
					local bullet = CreateProjectile("Star",Arena.width/2,math.random(0,-(Arena.height/2)))
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				end
			elseif Actions[I2] == 3 then
				if timer2 < 50 then
					local bullet = CreateProjectile("Star",Arena.width/2,math.random(-(Arena.height/4),(Arena.height/4)))
					bullet.SetVar("Type",1)
					table.insert(bullets, bullet)
				end
			elseif Actions[I2] == 4 then
				if timer2 < 50 then
					local bullet = CreateProjectile("Star",Arena.width/2,math.random(-(Arena.height/2),(Arena.height/2)))
					bullet.sprite.color = { 1.00, 0.65, 0.00 }
					bullet.SetVar("Type",2)
					table.insert(bullets, bullet)
				end
			elseif Actions[I2] == 5 then
				if timer2 < 50 then
					local bullet = CreateProjectile("Star",Arena.width/2,math.random(-(Arena.height/2),(Arena.height/2)))
					bullet.sprite.color = { 0.02, 0.37, 0.97 }
					bullet.SetVar("Type",3)
					table.insert(bullets, bullet)
				end
			end
			for i=1,#bullets do 
				local bullet = bullets[i]
				if bullet.isactive == true then
					bullet.MoveTo(bullet.x-5,bullet.y)
					if bullet.x <= -Arena.width/2 then
						bullet.remove()
					end
				end
			end
			if timer2 > 70 then 
				if I2 > #Actions and timer2 > 80 then
					EndWave()
				elseif I2 <= #Actions then
					timer2 = 0
					I2 = I2 + 1
				end
			end
		end
	end
	
	function OnHit(bullet)
		if bullet.GetVar("Type") == nil then 
		elseif bullet.GetVar("Type") == 1 then 
			Player.Hurt(12)
        elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
    	   	Player.Hurt(15)
    	elseif bullet.GetVar("Type") == 3 and Player.isMoving then
    	    Player.Hurt(15)
    	end
	end
    if timer >= 99999 then
        EndWave()
    end
end