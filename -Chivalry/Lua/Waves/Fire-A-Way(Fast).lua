timer = 0
bullets = {}
R = math.random() * 6.2
Fire = CreateProjectile("Fire", 400 * math.cos(R), 400 * math.sin(R))
local distance = math.sqrt((Player.x - Fire.x)^2 + (Player.y - Fire.y)^2)
SetGlobal("distance_x", ((Player.x - Fire.x) / distance)*37)
SetGlobal("distance_y", ((Player.y - Fire.y) / distance)*37)
Fire.SetVar("time", 100)
Fire.SetVar("Type", 1)
table.insert(bullets, Fire)
Sword = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 270

function Update()
    timer = timer + 1
	if timer <= 20 then
		if timer%4 == 0 then
			Audio.PlaySound("alarm")
		end
	end
	if timer > 50 then
		if timer%2 == 0 then
			if Fire.isactive == true and timer > 5 then
				Fire = CreateProjectile("Fire", GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y)
				Sword.MoveTo(GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y-5)
				Sword.SendToTop()
				Fire.SetVar("time", 100)
				Fire.SetVar("Type", 1)
				Fire.ppcollision = true
				table.insert(bullets, Fire)
			end
			if Fire.x < -500 or Fire.x > 500 or Fire.y < -500 or Fire.y > 500 then
				if Fire.isactive == true then
					Fire2 = Fire
					R = math.random() * 6.2
					Fire = CreateProjectile("Fire", 400 * math.cos(R), 400 * math.sin(R))
					local distance = math.sqrt((Player.x - Fire.x)^2 + (Player.y - Fire.y)^2)
					SetGlobal("distance_x", ((Player.x - Fire.x) / distance)*37)
					SetGlobal("distance_y", ((Player.y - Fire.y) / distance)*37)
					Fire.SetVar("time", 100)
					Fire.SetVar("Type", 1)
					table.insert(bullets, Fire)
					Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 270
					Fire2.remove()
				end
			end
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
			Player.Hurt(5)
		end
	end
    if timer >= 530 then
        EndWave() 
    end
end