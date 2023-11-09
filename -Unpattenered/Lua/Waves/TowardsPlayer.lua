timer = 1
a = CreateProjectile('Arrow05',-200,200)
b = CreateProjectile('Arrow05',200,200)
bullets = {}

function Update()
    timer = timer + 1
	if (timer+10)%30 == 0 then 
	    local bullet = CreateProjectile('bulletA', a.x, a.y)
		bullet.SetVar("btimer",0)
		bullet.SetVar("RL",(a.x-Player.x))
		bullet.SetVar("UD",(a.y-Player.y))
		bullet.SetVar("Creator",a)
		table.insert(bullets, bullet)
	end
	a.sprite.rotation = -70*(math.atan((b.x+Player.x)/(Player.y-b.y)))-100
	if (timer+10)%30 == 0 then 
	    local bullet = CreateProjectile('bulletA', b.x, b.y)
		bullet.SetVar("btimer",0)
		bullet.SetVar("RL",(b.x-Player.x))
		bullet.SetVar("UD",(b.y-Player.y))
		bullet.SetVar("Creator",b)
		Audio.PlaySound("00002a24")
		table.insert(bullets, bullet)
	end
	b.sprite.rotation = -70*(math.atan((b.x-Player.x)/(b.y-Player.y)))-80
    for i=1,#bullets do
        local bullet = bullets[i]
    	local UD = bullet.GetVar("UD")
    	local RL = bullet.GetVar("RL")
    	local Creator = bullet.GetVar("Creator")
		if Creator.x > Player.x then
		    X = -1
		elseif Creator.x < Player.x then
		    X = 1
		end
		if Creator.y > Player.y then
		    Y = 1
		elseif Creator.y < Player.y then
		    Y = -1
		end
        bullet.SetVar("btimer",(bullet.GetVar("btimer")+1))
        bullet.MoveTo(((Creator.x)+((bullet.GetVar("btimer")*X))),((b.y)+((bullet.GetVar("btimer"))*((UD/RL)*Y*X)))/1)
	    bullet.sprite.rotation = timer
	    bullet.sprite.xscale = 0.9
	    bullet.sprite.yscale = 0.9
	end
    if timer >= 650 then
        EndWave()
    end
end