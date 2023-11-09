-- Try to move to the bottom, then try to move to the top/bottom when needed through the gaps within the stars.
timer = 0
bullets = {}
SetGlobal("WaveTime",1000)
WaveTim = GetGlobal("WaveTime")
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
S = 0
Gravity = 0.012

function Update()
    timer = timer + 1
	if timer == 200 then
		Planet = CreateProjectile("Planet", 0, 200)
		Planet.sprite.Scale(0,0)
	elseif timer > 200 then
		for i= 1,#bullets do
			bullet = bullets[i]
			if bullet.isactive == true then
				distance = math.sqrt((Planet.x - bullet.x)^2 + (Planet.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Planet.x - bullet.x) / distance)*3)
				bullet.SetVar("distance_y", ((Planet.y - bullet.y) / distance)*3)
				if bullet.GetVar("distance_x") < bullet.GetVar("H") then
					bullet.SetVar("H",bullet.GetVar("H")-Gravity)
				elseif bullet.GetVar("distance_x") > bullet.GetVar("H") then
					bullet.SetVar("H",bullet.GetVar("H")+Gravity)
				end
				if bullet.GetVar("distance_y") < bullet.GetVar("V") then
					bullet.SetVar("V",bullet.GetVar("V")-Gravity)
				elseif bullet.GetVar("distance_y") > bullet.GetVar("V") then
					bullet.SetVar("V",bullet.GetVar("V")+Gravity)
				end
				if bullet.x < -320 then
					bullet.remove()
				end
			end
		end
		if S < 1 then
			S = S + 0.02
		end
		Planet.sprite.Scale(S,S)
		if Planet.sprite.xscale >= 1 then
			Planet.MoveTo(200*math.cos((timer-250)/75 + (math.pi/2)),200*math.sin((timer-250)/75 + (math.pi/2)))
		end
	end
	if timer%10 == 0 and timer%50 ~= 0 then
		for i=1,3 do
			local Star = CreateProjectile("Star", 320, -100 + (i*50))
			Star.ppcollision = true
			Star.SetVar("V",0)
			Star.SetVar("H",-4)
			Star.SetVar("Type",4)
			table.insert(bullets,Star)
		end
	end
	for i= 1,#bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			bullet.Move(bullet.GetVar("H"),bullet.GetVar("V"))
			if bullet.x < -320 then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") then
			Player.Hurt(GetGlobal("BaseDam"),0.4)
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 12 then
			Player.Hurt(GetGlobal("BaseDam") + 12,0.5)
		elseif bullet.GetVar("Type") == 3 and Player.hp > GetGlobal("BaseDam") + 32 then
			Player.Hurt(GetGlobal("BaseDam") + 32,0.75)
		elseif bullet.GetVar("Type") == 4 and Player.hp > GetGlobal("BaseDam") - 5 then
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
