timer = 0
bullets = {}
M_R = (math.pi)*(math.random())
function Update()
	timer = timer + 1
	if timer > 50 then
		if timer%5 == 0 then
			local bullet = CreateProjectile("Star",400*math.cos(M_R),400*math.sin(M_R))
			bullet.SetVar("timer",0)
			bullet.SetVar("radius",400)
			bullet.SetVar("Type",1)
			table.insert(bullets, bullet)
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			if timer < 250 then
				bullet.SetVar("radius",bullet.GetVar("radius") - 2)
			end
			bullet.SetVar("timer",bullet.GetVar("timer") + 0.07)
			local T = bullet.GetVar("timer")
			bullet.MoveTo((bullet.GetVar("radius") * math.cos(M_R + T)),(bullet.GetVar("radius") * math.sin(M_R + T)))
		end
	end
	
	function OnHit(bullet)
		if bullet.GetVar("Type") == nil then 
		elseif bullet.GetVar("Type") == 1 then 
			Player.Hurt(15)
        elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
    	   	Player.Hurt(15)
    	elseif bullet.GetVar("Type") == 3 and Player.isMoving then
    	    Player.Hurt(15)
    	end
	end
	if timer > 800 then
        EndWave()
    end
end