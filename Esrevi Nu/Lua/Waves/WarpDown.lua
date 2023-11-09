timer = 0
bullets = {}
Arena.Resize(155, 130)

function Update()
	timer = timer + 1
	if timer%20 == 0 then
		local bullet = CreateProjectile("Pixel",math.random(-77.5,77.5),(Arena.height/2))
		bullet.sprite.xscale = 3
		bullet.sprite.yscale = 5
		bullet.SetVar("Speed",1)
		bullet.SetVar("Back",false)
		bullet.SetVar("Type",1)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
		local bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("Back") == true then
				bullet.sprite.yscale = bullet.sprite.yscale - bullet.GetVar("Speed")
				bullet.Move(0, -(bullet.GetVar("Speed")/2))
				bullet.SetVar("Speed",bullet.GetVar("Speed")+1)
				if bullet.sprite.yscale <= 0 then
					bullet.remove()
				end
			elseif bullet.sprite.yscale < Arena.height and bullet.GetVar("Back") == false then
				bullet.sprite.yscale = bullet.sprite.yscale + bullet.GetVar("Speed")
				bullet.Move(0, -(bullet.GetVar("Speed")/2))
				bullet.SetVar("Speed",bullet.GetVar("Speed")+0.25)
			elseif bullet.sprite.yscale > Arena.height and bullet.GetVar("Back") == false then
				bullet.sprite.yscale = Arena.height
				bullet.MoveTo(bullet.x,0)
			elseif bullet.sprite.yscale == Arena.height then
				bullet.SetVar("Speed",1)
				bullet.SetVar("Back",true)
			end
		end
	end
	
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(12)
		elseif bullet.GetVar("Type") == 2 then
			Player.Hurt(6,0.1)
		end
	end
    if timer >= 600 then
        EndWave()
    end
end