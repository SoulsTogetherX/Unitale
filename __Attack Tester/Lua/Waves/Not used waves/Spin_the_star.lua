timer = 0
bullets = {}
SetGlobal("WaveTime",1600)
WaveTim = GetGlobal("WaveTime")
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
I = 0
R = 0
V = 2
H = 0
VR = math.random(-30,30)
HR = math.random(-30,30)

function Update()
    timer = math.floor(WaveTim - GetGlobal("WaveTime"))
	if timer == 5 then
		Star = CreateProjectile("BigStar", 0, 400)
		Star.SetVar("Type",2)
	elseif timer <= 100 and timer > 5 then
		Star.Move(0,-2)
	end
	if timer >= 150 and timer%16 == 0 then
		I = I + 15
		S = CreateProjectile("Star", 40 * math.cos((timer + I)/30) + Star.x, 40 * math.sin((timer + I)/30) + Star.y)
		S.SetVar("I",I)
		S.SetVar("R",40)
		S.SetVar("H",Star.x)
		S.SetVar("V",Star.y)
		S.SetVar("Type",1)
		S.ppcollision = true
		table.insert(bullets,S)
	end
	if timer >= 150 then
		Star.sprite.rotation = Star.sprite.rotation + R
		if R < 60 then
			R = R + 0.5
		end
		Star.MoveTo((200 + HR)*math.cos((timer - 150)/100 + (math.pi/2)),(200 + VR)*math.sin((timer - 150)/100 + (math.pi/2)))
	end
	for i= 1,#bullets do
		bullet = bullets[i]
		bullet.MoveTo((bullet.GetVar("R") * math.cos((timer + bullet.GetVar("I"))/30)) + bullet.GetVar("H"),(bullet.GetVar("R") * math.sin((timer + bullet.GetVar("I"))/30)) + bullet.GetVar("V"))
		bullet.SetVar("R",bullet.GetVar("R") + 0.5)
	end
	
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 5 then
			Player.Hurt(GetGlobal("BaseDam") + 5)
		elseif bullet.GetVar("Type") == 2 then
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
