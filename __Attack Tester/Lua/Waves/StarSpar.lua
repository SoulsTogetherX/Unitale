--There is a subtle pattern in the middle of everything. Stay where you are and move slightly up when the stars come at you...when you see the opening, move back to where you were.
timer = 0
bullets = {}
Beams = {}
SetGlobal("WaveTime",1000)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
R = 0
C = 0
B = 1
function Update()
    timer = timer + 1
	if timer%2 == 0 then
		B = B * (-1)
	end
	C = C + 0.5
	R = R + (50 * B)
	bullet = CreateProjectile("Star",300*math.cos(R),50*math.sin(R))
	local distance = math.sqrt((350*math.cos(C) - bullet.x)^2 + (300*math.sin(C) - bullet.y)^2)
	bullet.SetVar("distance_x", ((350*math.cos(C) - bullet.x) / distance)*2)
	bullet.SetVar("distance_y", ((350*math.sin(C) - bullet.y) / distance)*2.5)
	bullet.SetVar("Type", 1)
	bullet.SetVar("M", 1)
	table.insert(bullets, bullet)
	bullet = CreateProjectile("Star",-300*math.cos(R),50*math.sin(R))
	local distance = math.sqrt((-350*math.cos(C) - bullet.x)^2 + (300*math.sin(C) - bullet.y)^2)
	bullet.SetVar("distance_x", ((-350*math.cos(C) - bullet.x) / distance)*2)
	bullet.SetVar("distance_y", ((350*math.sin(C) - bullet.y) / distance)*2.5)
	bullet.SetVar("Type", 1)
	bullet.SetVar("M", 1)
	table.insert(bullets, bullet)
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("M") == 1 then
				bullet.Move(bullet.GetVar("distance_x"), bullet.GetVar("distance_y"))
			end
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") - 5 then
			Player.Hurt(GetGlobal("BaseDam") - 5,0.1)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end