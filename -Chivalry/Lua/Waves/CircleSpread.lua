timer = 0
bullets = {}
bullets2 = {}
bullets3 = {}
I = 1
R = math.random() * 6.2
Fire = CreateProjectile("Fire", 400 * math.cos(R), 400 * math.sin(R))
local distance = math.sqrt((0 - Fire.x)^2 + (0 - Fire.y)^2)
SetGlobal("distance_x", ((0 - Fire.x) / distance)*20)
SetGlobal("distance_y", ((0 - Fire.y) / distance)*20)
Fire.SetVar("time", 100)
Fire.SetVar("Type", 1)
table.insert(bullets, Fire)
Sword = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
Sword.sprite.rotation = math.deg(math.atan2(Fire.y, Fire.x)) + 90
Sword.SetVar("Type", 1)

function Update()
    timer = timer + 1
	if timer%2 == 0 then
		if Fire.isactive == true and timer > 5 then
			if Fire.x > 2 or Fire.x < -2 then
				if Fire.y > 2 or Fire.y < -2 then
					Fire = CreateProjectile("Fire", GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y)
					Sword.MoveTo(GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y-5)
					Sword.SendToTop()
					Fire.SetVar("time", 100)
					Fire.SetVar("Type", 1)
					table.insert(bullets, Fire)
				else
					C = CreateProjectile("Fire", Fire.x, Fire.y)
					C.SetVar("time", 100)
					C.SetVar("Type", 1)
					table.insert(bullets, C)
					Fire.remove()
				end
			else
				C = CreateProjectile("Fire", Fire.x, Fire.y)
				C.SetVar("time", 100)
				C.SetVar("Type", 1)
				table.insert(bullets, C)
				Fire.remove()
			end
		else
			Sword.MoveTo(GetGlobal("distance_x") + Sword.x, GetGlobal("distance_y") + Sword.y)
			Sword.SendToTop()
		end
		if Fire.isactive == true then
			if Fire.x < -500 or Fire.x > 500 or Fire.y < -500 or Fire.y > 500 then
				if Fire.isactive == true then
					Fire2 = Fire
					R = math.random() * 6.2
					Fire = CreateProjectile("Fire", 400 * math.cos(R), 400 * math.sin(R))
					local distance = math.sqrt((0 - Fire.x)^2 + (0 - Fire.y)^2)
					SetGlobal("distance_x", ((0 - Fire.x) / distance)*20)
					SetGlobal("distance_y", ((0 - Fire.y) / distance)*20)
					Fire.SetVar("time", 100)
					Fire.SetVar("Type", 1)
					table.insert(bullets, Fire)
					Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 90
					Fire2.remove()
				end
			end
		end
	end
	if timer > 70 and timer < 900 then
		if timer%100 == 0 and timer < 800 then
			for i=1,math.random(3,8) do
				local bullet = CreateProjectile("Fire", 0, 0)
				bullet.sprite.Scale(0.7,0.7)
				bullet.SetVar("Type", 1)
				bullet.SetVar("r", 0)
				bullet.SetVar("R", i*120)
				table.insert(bullets2, bullet)
			end
		end
		for i=1,#bullets2 do
			local bullet = bullets2[i]
			if bullet.GetVar("r") < 150 then
				bullet.SetVar("r", bullet.GetVar("r") + 0.5)
			end
			bullet.SetVar("R", i*120 + (timer/40))
			bullet.MoveTo(bullet.GetVar("r") * math.cos(bullet.GetVar("R")),bullet.GetVar("r") * math.sin(bullet.GetVar("R")))
		end
	end
	if timer > 900 then
		local bullet = bullets2[I]
		if timer%20 == 0 and I <= #bullets2 then
			local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
			bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
			bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
			I = I + 1
			Audio.PlaySound("Shoot3")
			table.insert(bullets3, bullet)
		end
		for i=1,#bullets3 do
			local bullet = bullets3[i]
			bullet.MoveTo(bullet.GetVar("distance_x") + bullet.x, bullet.GetVar("distance_y") + bullet.y)
		end
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("time", bullet.GetVar("time") - 1)
		bullet.sprite.alpha =  bullet.GetVar("time")/20
		if bullet.GetVar("time") <= 20 and bullet.isactive == true then
			bullet.SetVar("Type", 0)
		end
		if bullet.GetVar("time") <= 1 and bullet.isactive == true then
			bullet.remove()
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(4)
		end
	end
    if timer >= 1200 then
        EndWave() 
    end
end