timer = 0
bullets1 = {}
bullets2 = {}
bullets3 = {}
Arena.Resize(300, 80)

function Update()
    timer = timer + 1
	if timer%100 == 0 then
		local bullet = CreateProjectile("Sword", -Arena.width/2, Arena.height/2)
		bullet.SetVar("Type",1)
		bullet.sprite.xscale = -1
		bullet.sprite.rotation = 180
		table.insert(bullets1, bullet)
	end
	if (timer+50)%100 == 0 then
		local bullet = CreateProjectile("Sword", Arena.width/2, -Arena.height/2)
		bullet.SetVar("Type",1)
		bullet.sprite.xscale = -1
		bullet.sprite.rotation = 0
		table.insert(bullets2, bullet)
	end
	for i=1, #bullets1 do
		local bullet = bullets1[i]
		if bullet.isactive == true then
			bullet.Move(2,0)
			if timer%2 == 0 then
				S = CreateProjectile("Pixel", bullet.x, bullet.y - 40)
				S.sprite.Scale(4, 10)
				S.SetVar("timer",0)
				S.SetVar("Type",2)
				table.insert(bullets3, S)
			end
			if bullet.x > Arena.width/2 then
				bullet.remove()
			end
		end
	end
	for i=1, #bullets2 do
		local bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.Move(-2,0)
			if timer%2 == 0 then
				S = CreateProjectile("Pixel", bullet.x, bullet.y + 40)
				S.sprite.Scale(4, 10)
				S.SetVar("timer",0)
				S.SetVar("Type",2)
				table.insert(bullets3, S)
			end
			if bullet.x < -Arena.width/2 then
				bullet.remove()
			end
		end
	end
	for i=1, #bullets3 do
		bullet = bullets3[i]
		if bullet.isactive == true then
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
			if bullet.GetVar("timer") >= 30 then
				bullet.sprite.alpha = bullet.sprite.alpha - 0.05
			end
			if bullet.sprite.alpha <= 0 then
				bullet.SetVar("Type",0)
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
        if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(5)
        elseif bullet.GetVar("Type") == 2 then
    	   	Player.Hurt(3,0.2)
		end
	end
    if timer >= 600 then
        EndWave() 
    end
end