-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
local bullet = CreateProjectile("Spike",120,0)
bullet.SetVar("R",0)
bullet.sprite.color = { 1.00, 1.00, 0.00}
bullet.SetVar("Type",1)
S = false
table.insert(bullets,bullet)

function Update()
    timer = timer + 1
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.sprite.rotation  = bullet.GetVar("R") * 90
		if bullet.GetVar("R") == 1 or bullet.GetVar("R") == 3 then
			if bullet.y + 4 >= Player.y and bullet.y - 4 <= Player.y then
				if bullet.x > Player.x then
					bullet.sprite.color = { 1.00, 1.00, 1.00}
					if bullet.GetVar("B") == nil then
						Audio.PlaySound("Shoot4")
						local B = CreateProjectile("Spike",bullet.x,bullet.y)
						B.sprite.color = { 1.00, 1.00, 0.00}
						bullet.SetVar("B",1)
						B.SetVar("R",0)
						B.SetVar("Type",1)
						table.insert(bullets,B)
					end
					S = true
				elseif bullet.x < Player.x then
					bullet.sprite.color = { 1.00, 1.00, 1.00}
					if bullet.GetVar("B") == nil then
						Audio.PlaySound("Shoot4")
						local B = CreateProjectile("Spike",bullet.x,bullet.y)
						B.sprite.color = { 1.00, 1.00, 0.00}
						bullet.SetVar("B",1)
						B.SetVar("R",2)
						B.SetVar("Type",1)
						table.insert(bullets,B)
					end
					S = true
				end
			end
		elseif bullet.GetVar("R") == 0 or bullet.GetVar("R") == 2 then
			if bullet.x + 4 >= Player.x and bullet.x - 4 <= Player.x then
				if bullet.y > Player.y then
					bullet.sprite.color = { 1.00, 1.00, 1.00}
					if bullet.GetVar("B") == nil then
						Audio.PlaySound("Shoot4")
						local B = CreateProjectile("Spike",bullet.x,bullet.y)
						B.sprite.color = { 1.00, 1.00, 0.00}
						bullet.SetVar("B",1)
						B.SetVar("R",1)
						B.SetVar("Type",1)
						table.insert(bullets,B)
					end
					S = true
				elseif bullet.y < Player.y then
					bullet.sprite.color = { 1.00, 1.00, 1.00}
					if bullet.GetVar("B") == nil then
						Audio.PlaySound("Shoot4")
						local B = CreateProjectile("Spike",bullet.x,bullet.y)
						B.sprite.color = { 1.00, 1.00, 0.00}
						bullet.SetVar("B",1)
						B.SetVar("R",3)
						B.SetVar("Type",1)
						table.insert(bullets,B)
					end
					S = true
				end
			end
		end
		if bullet.GetVar("B") ~= nil then
			bullet.SetVar("B",bullet.GetVar("B") + 1)
			if bullet.GetVar("B") >= 100 then
				--bullet.SetVar("B",nil)
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
			bullet.Move(-1.5,0)
		elseif bullet.GetVar("R") == 1 then
			bullet.Move(0,-1.5)
		elseif bullet.GetVar("R") == 2 then
			bullet.Move(1.5,0)
		elseif bullet.GetVar("R") == 3 then
			bullet.Move(0,1.5)
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