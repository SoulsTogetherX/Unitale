-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
local bullet = CreateProjectile("Spike",200,0)
bullet.SetVar("R",0)
bullet.SetVar("Type",1)
S = false

function Update()
    timer = timer + 1
    bullet.sprite.rotation  = bullet.GetVar("R") * 90
	if bullet.GetVar("R") == 1 or bullet.GetVar("R") == 3 then
		if bullet.y + 4 >= Player.y and bullet.y - 4 <= Player.y then
			if bullet.x > Player.x then
				bullet.SetVar("R",0)
				S = true
			elseif bullet.x < Player.x then
				bullet.SetVar("R",2)
				S = true
			end
		end
	elseif bullet.GetVar("R") == 0 or bullet.GetVar("R") == 2 then
		if bullet.x + 4 >= Player.x and bullet.x - 4 <= Player.x then
			if bullet.y > Player.y then
				bullet.SetVar("R",1)
				S = true
			elseif bullet.y < Player.y then
				bullet.SetVar("R",3)
				S = true
			end
		end
	end
	if (bullet.x > Arena.width/2 or bullet.x < -Arena.width/2 or bullet.y > Arena.height/2 or bullet.y < -Arena.height/2) and S == true then
		if bullet.GetVar("R") == 0 then
			bullet.SetVar("R",2)
		elseif bullet.GetVar("R") == 1 then
			bullet.SetVar("R",3)
		elseif bullet.GetVar("R") == 2 then
			bullet.SetVar("R",0)
		elseif bullet.GetVar("R") == 3 then
			bullet.SetVar("R",1)
		end
	end
	if bullet.GetVar("R") == 0 then
		bullet.Move(-2,0)
	elseif bullet.GetVar("R") == 1 then
		bullet.Move(0,-2)
	elseif bullet.GetVar("R") == 2 then
		bullet.Move(2,0)
	elseif bullet.GetVar("R") == 3 then
		bullet.Move(0,2)
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.6)
		elseif bullet.isactive == true and Player.isHurting == false then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 400 then
        EndWave()
    end
end