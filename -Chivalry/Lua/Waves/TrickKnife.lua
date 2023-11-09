require "Libraries/Blue"
blue.WaveStart()
timer = 0
bullets = {}
blue.SetSprite("BlueSoul")
blue.inAir = true

function Update()
    timer = timer + 1
	blue.TurnBlue(true)
	blue.HandleMovement()
	blue.Draw()
	for i=1,5 do 
		if timer == (i*20) then
			local bullet = CreateProjectile("Knife",-Arena.width/2 - 20, -Arena.height/2 + (i*10))
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",1)
			table.insert(bullets, bullet)
			local bullet = CreateProjectile("Knife",Arena.width/2 + 20, Arena.height/2 - (i*10))
			bullet.ppcollision = true
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			bullet.SetVar("MType",1)
			table.insert(bullets, bullet)
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
    	   	Player.Hurt(3)
		end
	end
    if timer >= 250 then
        EndWave() 
    end
end