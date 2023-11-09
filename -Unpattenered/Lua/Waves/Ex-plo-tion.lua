Arena.ResizeImmediate(200, 200)
Player.MoveTo(0,80,false)
timer = 0
R = 0
n = 0
bullets = {}
Bomb = CreateProjectile('bomb',0,0)
Bomb.SetVar("Type",1)
Number = CreateProjectile('Three',-5,-5)
Number.sprite.color = {1.00, 0.00, 0.00}
number = 3
Ex = false

function Update()
    timer = timer + 1
	if number ~= 0 then
	    Bomb.sprite.xscale = (math.sin(timer)/10)+1
	    Bomb.sprite.yscale = (math.sin(timer)/10)+1
	end
    if (timer+10)%30 == 0 and number > 0 then
	    number = number - 1
	end
	if number == 3 then
	    Number.sprite.Set("Three")
		if n == 0 then
			Audio.PlaySound("alarm")
			n = 1
		end
	elseif number == 2 then
	    Number.sprite.Set("Two")
		if n == 1 then
			Audio.PlaySound("alarm")
			n = 2
		end
	elseif number == 1 then
	    Number.sprite.Set("One")
		if n == 2 then
			Audio.PlaySound("alarm")
			n = 3
		end
	elseif number == 0 then
	    if Number.sprite.isactive == true then
			Audio.PlaySound("000029f8")
	        Number.sprite.Remove()
		end
	    Bomb.sprite.Set("Boom")
		Bomb.sprite.alpha = 1/(timer-(3*30))
		Bomb.sprite.xscale = (timer-(3*30))/10
	    Bomb.sprite.yscale = (timer-(3*30))/10
		Bomb.SetVar("Type", -1)
		Ex = true
	end
	if R <= 180 then
	    R = R + (10*math.random())
		local bullet = CreateProjectile('bulletA',(50 * math.cos((R) / 25)),(-50 * math.sin((R) / 25) + 0))
		bullet.SetVar("R",R)
        table.insert(bullets, bullet)
		bullet.SetVar("Type", 1)
	end
	if Ex == true then
        for i=1,#bullets do
		    local bullet = bullets[i]
			local R = bullet.GetVar("R")
			bullet.MoveTo(((50+(timer-(3*30))*10) * math.cos((R) / 25)),(-(50+(timer-(3*30))*10) * math.sin((R) / 25) + 0))
		end
    end	
    function OnHit(bullet)
        if bullet.isactive then
        	if bullet.GetVar("Type") == 1 then
    	    	Player.Hurt(5)
    	    end
        end
    end
    if timer >= 150 then
        EndWave()
    end
end
