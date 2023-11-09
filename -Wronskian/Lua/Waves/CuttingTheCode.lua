timer = 0
bullets = {}

function Update()
	timer = timer + 1
	if (timer - 80)%200 == 0 and timer ~= 80 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer%200 == 0 then
		for i=0,19 do
			local bullet = CreateProjectile("SmallSpike_up",50*math.cos(math.rad(36*i)) + Player.x,50*math.sin(math.rad(36*i)) + Player.y)
			bullet.sprite.rotation = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 90
			bullet.SetVar("Targetx",Player.x)
			bullet.SetVar("Targety",Player.y)
			bullet.SetVar("MType",1)
			bullet.SetVar("Type",1)
			bullet.SetVar("timer",0)
			table.insert(bullets,bullet)
		end
	end
	if timer%20 == 0 then
		local R = (200*math.random()) + 150
		local R2 = math.random() * ((400/6.2) * (R/1))
		local bullet = CreateProjectile("Zero",R * math.cos(R2),R * math.sin(R2))
		local M = math.random(1,2)
		if M == 1 then
			bullet.sprite.SetAnimation({"Zero","One"},1) 
			local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			local distance_x = ((Player.x - bullet.x) / distance)*5
			local distance_y = ((Player.y - bullet.y) / distance)*5
			bullet.SetVar("distance_x", distance_x)
			bullet.SetVar("distance_y", distance_y)
			bullet.SetVar("Type",2)
			bullet.SetVar("MType",2)
			table.insert(bullets,bullet)
		elseif M == 2 then
			bullet.sprite.SetAnimation({"One","Zero"},1)
			local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			local distance_x = ((Player.x - bullet.x) / distance)*5
			local distance_y = ((Player.y - bullet.y) / distance)*5
			bullet.SetVar("distance_x", distance_x)
			bullet.SetVar("distance_y", distance_y)
			bullet.SetVar("Type",2)
			bullet.SetVar("MType",2)
			table.insert(bullets,bullet)
		end
	end
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			local R = math.deg(math.atan2(bullet.GetVar("Targety") - bullet.y, bullet.GetVar("Targetx") - bullet.x)) - 90
			local R2 = 360 - math.abs(R)
			if bullet.GetVar("Targety") - bullet.y > 0 and bullet.GetVar("Targetx") - bullet.x < 0 then
				R2 = 360 - R2
			end
			if bullet.GetVar("timer") >= 80 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			else
				local distance = math.sqrt((bullet.GetVar("Targetx") - bullet.x)^2 + (bullet.GetVar("Targety") - bullet.y)^2)
				bullet.SetVar("distance_x", ((bullet.GetVar("Targetx") - bullet.x) / distance)*10)
				bullet.SetVar("distance_y", ((bullet.GetVar("Targety") - bullet.y) / distance)*10)
				bullet.sprite.rotation = R2
				bullet.Move(bullet.GetVar("distance_x")*(-0.05*math.cos(bullet.GetVar("timer")/80)), bullet.GetVar("distance_y")*(-0.05*math.cos(bullet.GetVar("timer")/80)))
			end
		elseif bullet.isactive == true and bullet.GetVar("MType") == 2 then
			bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(4,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(5,0.5)
		end
	end
    if timer >= 650 then
        EndWave()
    end
end