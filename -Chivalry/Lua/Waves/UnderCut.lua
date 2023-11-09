require "Libraries/Blue"
blue.WaveStart()
timer = 0
bullets = {}
bullets2 = {}
blue.SetSprite("BlueSoul")
blue.inAir = true

function Update()
    timer = timer + 1
	blue.TurnBlue(true)
	blue.HandleMovement()
	blue.Draw()
	if timer%100 == 0 then
		local bullet = CreateProjectile("Sword",-Arena.width/2 + 20, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("MType",1)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 - 20, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("MType",1)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
	end
	if (timer + 10)%200 == 0 and timer > 10 then
		local bullet = CreateProjectile("Knife",-400, -Arena.height/2 + 10)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",2)
		bullet.ppcollision = true
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife",-400, 0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",2)
		bullet.ppcollision = true
		table.insert(bullets, bullet)
	end
	if (timer + 60)%150 == 0 then
		local bullet = CreateProjectile("Knife",400, -Arena.height/2 + 10)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",3)
		bullet.ppcollision = true
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife",400, 0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",3)
		bullet.ppcollision = true
		table.insert(bullets, bullet)
	end
	if (timer)%50 == 0 then
		local bullet = CreateProjectile("Knife",-400, -Arena.height/2 + 32)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",4)
		bullet.ppcollision = true
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife",400, -Arena.height/2 + 32)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",5)
		bullet.ppcollision = true
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
	end
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("MType") == 1 then
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 90
				local R2 = 360 - math.abs(R)
				if Player.y - bullet.y > 0 and Player.x - bullet.x < 0 then
					R2 = 360 - R2
				end
				if bullet.GetVar("timer") >= 80 then
					if bullet.GetVar("timer") == 80 then
						Audio.PlaySound("Shoot2") 
					end
					bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
				else
					local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
					bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
					bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
					if bullet.GetVar("timer") <= 36 then
						bullet.sprite.rotation = bullet.sprite.rotation + 10
					elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
						bullet.sprite.rotation = R2
					elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) and bullet.GetVar("MType") == 1 then
						bullet.sprite.rotation = bullet.sprite.rotation + 10
					end
				end
			elseif bullet.GetVar("MType") == 2 then
				bullet.sprite.rotation = -90
				bullet.Move(5,math.cos(timer/20))
			elseif bullet.GetVar("MType") == 3 then
				bullet.sprite.rotation = 90
				bullet.Move(-5,math.cos(timer/20))
			elseif bullet.GetVar("MType") == 4 then
				bullet.sprite.rotation = -90
				bullet.Move(12,0)
			elseif bullet.GetVar("MType") == 5 then
				bullet.sprite.rotation = 90
				bullet.Move(-12,0)
			end
			if bullet.x < -400 or bullet.x > 400 or bullet.y < -200 or bullet.y > 400 then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(5)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(99)
		end
	end
    if timer >= 750 then
        EndWave() 
    end
end