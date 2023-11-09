-- Figure it out...
require "Animations/Es_Revitlum"
timer = 0
bullets = {}
SetGlobal("WaveTime",math.huge)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
Arena.Move(0, 100, true, false)


function Update()
    timer = timer + 1

	for i = 1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
		
			if bullet.x < -340 or bullet.x > 440 or bullet.y < -290 or bullet.y > 270 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") then
			Player.Hurt(GetGlobal("BaseDam") + 70,1)
		elseif bullet.GetVar("Type") == 2 then
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