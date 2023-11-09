timer = 0
bullets = {}
SetGlobal("WaveTime",900)
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")

function Update()
    timer = timer + 1
	if timer%10 == 0 then
		local bullet = CreateProjectile("Star", Arena.width/2 * math.cos(timer/20), Arena.height/2 + 50)
		bullet.SetVar("MType",1)
		bullet.SetVar("Type",1)
		bullet.ppcollision = true
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Star", Arena.width/2 * math.cos(timer/20), -Arena.height/2 - 50)
		bullet.SetVar("MType",2)
		bullet.SetVar("Type",1)
		bullet.ppcollision = true
		table.insert(bullets,bullet)
	end
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.Move(0,-5)
		elseif bullet.GetVar("MType") == 2 then
			bullet.Move(0,5)
		end
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