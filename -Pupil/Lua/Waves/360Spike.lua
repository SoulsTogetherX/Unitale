-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
R = 0

function Update()
    timer = timer + 1
	if timer%50 == 0 then
		Audio.PlaySound("Shoot3")
		Audio.PlaySound("Shoot3")
		Audio.PlaySound("Shoot3")
		Audio.PlaySound("Shoot3")
		local bullet = CreateProjectile("Spike",Arena.width/2,math.random(-Arena.height/2,Arena.height/2))
		bullet.sprite.rotation = 180
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-Arena.width/2,math.random(-Arena.height/2,Arena.height/2))
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.sprite.yscale = -1
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",math.random(-Arena.width/2,Arena.width/2),Arena.height/2)
		bullet.sprite.rotation = 90
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",math.random(-Arena.width/2,Arena.width/2),-Arena.height/2)
		bullet.sprite.rotation = -90
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		bullet.sprite.yscale = -1
		table.insert(bullets,bullet)
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("M") == 1 then
				bullet.Move(-1,0)
				bullet.sprite.rotation = 180
				if bullet.x < -Arena.width/2 or bullet.x > Arena.width/2 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			elseif bullet.GetVar("M") == 2 then
				bullet.Move(1,0)
				bullet.sprite.rotation = 0
				if bullet.x < -Arena.width/2 or bullet.x > Arena.width/2 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end

			elseif bullet.GetVar("M") == 3 then
				bullet.Move(0,-1)
				bullet.sprite.rotation = 90
				if bullet.x < -Arena.height/2 or bullet.x > Arena.height/2 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			elseif bullet.GetVar("M") == 4 then
				bullet.Move(0,1)
				bullet.sprite.rotation = 270
				if bullet.x < -Arena.height/2 or bullet.x > Arena.height/2 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			end
			if bullet.x < -Arena.width/2 or bullet.x > Arena.width/2 then
				if bullet.isactive == true then
					bullet.remove()
				end
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
    if timer >= 600 then
        EndWave()
    end
end