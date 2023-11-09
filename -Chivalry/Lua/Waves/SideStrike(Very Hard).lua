timer = 0
bullets = {}

function Update()
    timer = timer + 1
	if timer%100 == 0 then
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Knife",-320, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",2)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Knife",320, Player.y)
		bullet.ppcollision = true
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",1)
		bullet.SetVar("MType",3)
		bullet.sprite.color = { 1.00, 0.00, 0.00 }
		table.insert(bullets, bullet)
	end
	if (timer + 75)%100 == 0 then
		for i=1,#bullets do
			bullet = bullets[i]
			bullet.SetVar("MType",1)
		end
	end
	
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 90
			local R2 = 360 - math.abs(R)
			if Player.y - bullet.y > 0 and Player.x - bullet.x < 0 then
				R2 = 360 - R2
			end
			if bullet.GetVar("timer") >= 80 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
				if bullet.GetVar("timer") == 80 then
					Audio.PlaySound("Shoot2") 
				end
			else
				local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*6)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*6)
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
			bullet.Move(12,0)
		elseif bullet.GetVar("MType") == 3 then
			bullet.sprite.rotation = 90
			bullet.Move(-12,0)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(99)
		end
	end
    if timer >= 575 then
        EndWave() 
    end
end