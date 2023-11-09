-- The only thing I can say is fit through the gaps. It's the same pattern everytime.
timer = 0
bullets = {}
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
SetGlobal("WaveTime",800)
WaveTim = GetGlobal("WaveTime")
Y = 230
R = 1
function Update()
    timer = timer + 1
	if Y > 0 then
		Y = 230 - timer
	end
	if timer%15 == 0 and timer <= 200 then
		for i=1,3 do
			local Star = CreateProjectile("Star", 0, 200)
			Star.SetVar("R",0)
			Star.SetVar("timer",0)
			Star.SetVar("r",i*2)
			Star.SetVar("Type",1)
			Star.ppcollision = true
			table.insert(bullets,Star)
		end
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		if timer <= 250 then
			bullet.SetVar("R",bullet.GetVar("R") + 1.5)
			bullet.SetVar("timer",bullet.GetVar("timer") + 1)
		end
		bullet.MoveTo((bullet.GetVar("R")*R)*math.cos(bullet.GetVar("timer")/50 + bullet.GetVar("r")),bullet.GetVar("R")*math.sin(bullet.GetVar("timer")/50 + bullet.GetVar("r")) + Y)
	end
	if timer >= 200 then
		R = math.cos((timer-200)/100)
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") then
			Player.Hurt(GetGlobal("BaseDam") + 0,0.5)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
