timer = 0
bullets = {}
BigStar = CreateProjectile("BigStar",0,400)
Gravity = 0.025

function Update()
	timer = timer + 1
	if BigStar.isactive == true and timer > 110 then
		BigStar.sprite.color32 = {255, 225-(timer*25.5), 225-(timer*25.5)}
	end
	if timer < 100 then
		BigStar.MoveTo(0,BigStar.y-2)
	elseif timer < 150 and timer >= 125 then
		BigStar.sprite.xscale = 1-((timer-125)/50)
		BigStar.sprite.yscale = 1-((timer-125)/50)
	elseif timer == 150 then
		if BigStar.isactive == true then
			BigStar.remove()
		end
		for i=1,40 do
			local bullet = CreateProjectile("Star",0,200)
			bullet.SetVar("VSpeed",(math.random()*6)-2)
			bullet.SetVar("HSpeed",(math.random()*10)-5)
			bullet.SetVar("Rotaion",math.random()*25)
			bullet.SetVar("Type",1)
			table.insert(bullets, bullet)
		end
	elseif timer > 150 then
		for i=1,#bullets do
			bullet = bullets[i]
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
			if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-Gravity)
			elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+Gravity)
			end
			if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-Gravity)
			elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+Gravity)
			end
			bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == nil then 
		elseif bullet.GetVar("Type") == 1 then 
			Player.Hurt(12)
        elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
    	   	Player.Hurt(12)
    	elseif bullet.GetVar("Type") == 3 and Player.isMoving then
    	    Player.Hurt(12)
    	end
	end
    if timer >= 400 then
        EndWave()
    end
end