timer = 0
bullets = {}
bullets2 = {}
for i=1,50 do
	local bullet = CreateProjectile("Knife",100, 100)
	bullet.SetVar("Rx",math.random(10,300))
	bullet.SetVar("Ry",math.random(10,300))
	bullet.SetVar("Speed",math.random(80,300))
	bullet.SetVar("Type",1)
	bullet.ppcollision = true
	table.insert(bullets, bullet)
end

function Update()
    timer = timer + 1
	for i=1,#bullets do
		local bullet = bullets[i]
		local X = bullet.GetVar("Rx")*math.cos(timer/bullet.GetVar("Speed"))
		local Y = bullet.GetVar("Ry")*math.sin(timer/bullet.GetVar("Speed"))
		bullet.MoveTo(X,Y)
		local R = math.deg(math.atan2((Y + (bullet.GetVar("Ry")*math.sin((timer + 1)/bullet.GetVar("Speed")))) - Y, (X + (bullet.GetVar("Rx")*math.cos((timer + 1)/bullet.GetVar("Speed")))) - X))
		bullet.sprite.rotation = R
	end
	if timer%100 == 0 then
		local bullet = CreateProjectile("Sword",-Arena.width/2 + 20, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.sprite.scale(0.5,0.5)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",1)
		table.insert(bullets2, bullet)
		local bullet = CreateProjectile("Sword",Arena.width/2 - 20, Arena.height/2 + 60)
		bullet.ppcollision = true
		bullet.sprite.Scale(0.5,0.5)
		bullet.SetVar("timer",0)
		bullet.SetVar("Type",2)
		bullet.SetVar("MType",1)
		table.insert(bullets2, bullet)
	end
	for i = 1,#bullets2 do
		local bullet = bullets2[i]
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
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(1)
		elseif bullet.GetVar("Type") == 2 then
    	   	Player.Hurt(4)
		end
	end
    if timer >= 1000 then
        EndWave() 
    end
end