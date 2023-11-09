-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
R = 0

function Update()
    timer = timer + 1
	if timer%10 == 0 then
		if timer%20 == 0 then
			Audio.PlaySound("Shoot2")
		end
		R = R + 35
		local bullet = CreateProjectile("Spike",400*math.cos(R/60),400*math.sin(R/60))
		bullet.SetVar("timer",0)
		local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
		bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*15)
		bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*15)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		local R = math.deg(math.atan2(Player.y - bullet.y, Player.x - bullet.x)) - 180
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
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
			if bullet.GetVar("timer") <= 36 then
				bullet.sprite.rotation = bullet.sprite.rotation + 10
			elseif bullet.sprite.rotation >= R2 - 10 and bullet.sprite.rotation <= R2 + 10 then
				bullet.sprite.rotation = R2
			elseif (bullet.sprite.rotation <= R2 - 10 or bullet.sprite.rotation >= R2 + 10) then
				bullet.sprite.rotation = bullet.sprite.rotation + 10
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 800 then
        EndWave()
    end
end