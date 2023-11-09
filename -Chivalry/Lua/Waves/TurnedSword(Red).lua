timer = 0
bullets = {}
R = math.random() * 6.2
Fire = CreateProjectile("Fire", 400 * math.cos(R), 400 * math.sin(R))
local distance = math.sqrt((Player.x - Fire.x)^2 + (Player.y - Fire.y)^2)
SetGlobal("distance_x", ((Player.x - Fire.x) / distance)*15)
SetGlobal("distance_y", ((Player.y - Fire.y) / distance)*15)
Fire.SetVar("time", 50)
Fire.SetVar("Type", 1)
Fire.sprite.color = { 1.00, 0.00, 0.00 }
table.insert(bullets, Fire)
Sword = CreateProjectile("Knife", 400 * math.cos(R), 400 * math.sin(R))
Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 270
Sword.SetVar("time", 0)
Sword.sprite.color = { 1.00, 0.00, 0.00 }
r = 100

function Update()
    timer = timer + 1
	if timer%10 == 0 and timer < 25 then
		Audio.PlaySound("alarm")
	end
	Sword.SetVar("time", Sword.GetVar("time") + 1)
	if timer%2 == 0 then
		if Fire.isactive == true and timer > 5 then
			Fire = CreateProjectile("Fire", GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y)
			Fire.sprite.color = { 1.00, 0.00, 0.00 }
			Sword.MoveTo(GetGlobal("distance_x") + Fire.x, GetGlobal("distance_y") + Fire.y-5)
			Sword.SendToTop()
			Fire.SetVar("time", 50)
			Fire.SetVar("Type", 1)
			table.insert(bullets, Fire)
		end
		if (Sword.GetVar("time") + 40)%r == 0 then
			if Fire.isactive == true then
				r = 50
				R = math.random() * 6.2
				local distance = math.sqrt((Player.x - Fire.x)^2 + (Player.y - Fire.y)^2)
				SetGlobal("distance_x", ((Player.x - Fire.x) / distance)*15)
				SetGlobal("distance_y", ((Player.y - Fire.y) / distance)*15)
				Fire.SetVar("time", 100)
				Fire.SetVar("Type", 1)
				table.insert(bullets, Fire)
				Sword.sprite.rotation = math.deg(math.atan2(Player.y - Fire.y, Player.x - Fire.x)) + 270
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
			Player.Hurt(99)
		end
	end
    if timer >= 500 then
        EndWave() 
    end
end