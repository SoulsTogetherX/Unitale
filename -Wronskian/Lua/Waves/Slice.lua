timer = 0
bullets = {}

function Update()
	timer = timer + 1
	if timer%20 == 0 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("SmallSpike",Arena.width/2,math.random(-Arena.height/2,Arena.height/2))
		bullet.sprite.rotation = 180
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("SmallSpike",-Arena.width/2,math.random(-Arena.height/2,Arena.height/2))
		bullet.SetVar("Type",2)
		bullet.sprite.yscale = -1
		table.insert(bullets,bullet)
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("Type") == 1 then
				bullet.Move(-5,0)
			elseif bullet.GetVar("Type") == 2 then
				bullet.Move(5,0)
			end
			if bullet.x < -Arena.width/2 or bullet.x > Arena.width/2 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(2,0.2)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(2,0.2)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end