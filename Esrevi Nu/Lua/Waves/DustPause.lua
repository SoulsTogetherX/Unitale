timer = 0
bullets = {}
Arena.ResizeImmediate(150, 100)
Time = CreateProjectile("pixel",55,0)
Time.sprite.xscale = 40
Time.sprite.yscale = 1
Time.sprite.alpha = 0.5

function Update()
	if Time.sprite.yscale < 100 then
		if Time.isactive == true then
			Time.sprite.yscale = Time.sprite.yscale + 2
		end
	elseif Time.sprite.yscale >= 100 then
		timer = timer + 1
		if timer%60 == 0 then
			local bullet = CreateProjectile("pixel",320,(math.random()*150)-50)
			bullet.sprite.xscale = 3
			bullet.sprite.yscale = 3
			bullet.SetVar("Speed",(math.random()*4)+3)
			bullet.SetVar("Speed2",(math.random()*4))
			bullet.SetVar("Radius",math.random()*70)
			bullet.SetVar("timer",0)
			bullet.SetVar("Type",1)
			table.insert(bullets, bullet)
		end
		if Time.isactive == true then
			Time.MoveTo(55*math.sin(((timer)/50-55)),0)
		end
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if (bullet.x < Time.x - 20 or bullet.x > Time.x + 20) or (bullet.y > 50 or bullet.y < -50) then
			if bullet.isactive == true then
				bullet.SetVar("timer",bullet.GetVar("timer")+1)
				bullet.MoveTo(bullet.x-bullet.GetVar("Speed"),bullet.GetVar("Radius")*math.cos((bullet.GetVar("timer")*bullet.GetVar("Speed2"))/20))
				if bullet.x < -320 then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(15)
		end
	end
	if Time.isColliding() == true then
		Player.SetControlOverride(true)
	else
		Player.SetControlOverride(false)
	end
    if timer >= 800 then
        EndWave()
    end
end