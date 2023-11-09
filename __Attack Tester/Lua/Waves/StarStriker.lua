-- Move to the bottom left corner and try to doge the bullets by moving in a clock-wise circle
timer = 0
bullets = {}
SetGlobal("WaveTime",700)
WaveTim = GetGlobal("WaveTime")
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
function Update()
    timer = timer + 1
	if timer%60 == 0 then
		for i=1,3 do
			local Star = CreateProjectile("Star", 320, -100 + (i*50))
			Star.ppcollision = true
			table.insert(bullets,Star)
			Star.SetVar("Type",1)
			Star.SetVar("M",1)
		end
	elseif (timer+30)%60 == 0 then
		for i=1,3 do
			local Star = CreateProjectile("Star", 320, -75 + (i*50))
			Star.ppcollision = true
			table.insert(bullets,Star)
			Star.SetVar("Type",1)
			Star.SetVar("M",1)
		end
	end
	if timer%60 == 0 then
		for i=1,3 do
			local Star = CreateProjectile("Star", 110 - (i*50), 320)
			Star.ppcollision = true
			table.insert(bullets,Star)
			Star.SetVar("Type",1)
			Star.SetVar("M",2)
		end
	elseif (timer+30)%60 == 0 then
		for i=1,3 do
			local Star = CreateProjectile("Star", 85 - (i*50), 320)
			Star.ppcollision = true
			table.insert(bullets,Star)
			Star.SetVar("Type",1)
			Star.SetVar("M",2)
		end
	end
	for i= 1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("M") == 1 then
			if bullet.x > Arena.width/2 + 18 then
				bullet.Move(-6,0)
			else
				bullet.Move(-3,0)
			end
		elseif bullet.GetVar("M") == 2 then
			if bullet.y > Arena.height/2 + 18 then
				bullet.Move(0,-6)
			else
				bullet.Move(0,-3)
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