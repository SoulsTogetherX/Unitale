-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
R = 0

function Update()
    timer = timer + 1
	if timer%100 == 0 then
		local bullet = CreateProjectile("Spike2",-400,200)
		bullet.SetVar("Type",1)
		bullet.SetVar('xspeed', 0)
		bullet.SetVar("Moved",false)
		bullet.sprite.rotation = 90
		Audio.PlaySound("Shoot3")
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike2",400,200)
		bullet.SetVar("Type",1)
		bullet.SetVar('xspeed', 0)
		bullet.SetVar("Moved",false)
		bullet.sprite.rotation = 90
		Audio.PlaySound("Shoot3")
		table.insert(bullets,bullet)
	end
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("Moved") == false then
			local xspeed = bullet.GetVar('xspeed') / 2 + (Player.x - bullet.x) / 50
			bullet.Move(xspeed, 0)
			bullet.SetVar('xspeed', xspeed)
			if Player.x - 10 < bullet.x and Player.x + 10 > bullet.x then
				Audio.PlaySound("Shoot2")
				bullet.SetVar("Moved",true)
			end
		else
			bullet.Move(0, -5)
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
    if timer >= 500 then
        EndWave()
    end
end