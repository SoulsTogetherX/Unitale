-- Move to the top left corner and move to the adjacent corner when needed. 
timer = 0
bullets = {}
SetGlobal("WaveTime",750)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")

function Update()
    timer = timer + 1
	if timer%15 == 0 then
		local Fire = CreateProjectile("Fire1", -400, 100*math.cos(timer/100))
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Fire.SetVar("V",5)
		Fire.SetVar("H",7.85)
		Fire.SetVar("Type",1)
		Fire.ppcollision = true
		table.insert(bullets,Fire)
		local Fire = CreateProjectile("Fire1", 400, -100*math.cos(timer/100))
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Fire.SetVar("V",5)
		Fire.SetVar("H",-7.8)
		Fire.SetVar("Type",1)
		Fire.ppcollision = true
		table.insert(bullets,Fire)
	end
	if timer%25 == 0 and timer >= 50 then
		local Fire = CreateProjectile("Fire1", math.abs(90*math.cos(timer/90)), -200)
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Fire.SetVar("H",0)
		Fire.SetVar("V",9.8)
		Fire.SetVar("Type",1)
		Fire.ppcollision = true
		table.insert(bullets,Fire)
		local Fire = CreateProjectile("Fire1", -math.abs(90*math.cos(timer/90)), -200)
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Fire.SetVar("H",0)
		Fire.SetVar("V",9.8)
		Fire.SetVar("Type",1)
		Fire.ppcollision = true
		table.insert(bullets,Fire)
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			bullet.SetVar("V",bullet.GetVar("V")-0.2)
			bullet.Move(bullet.GetVar("H"),bullet.GetVar("V"))
			if bullet.y < -250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 5 then
			Player.Hurt(GetGlobal("BaseDam") + 5,0.5)
			bullet.SetVar("Boom",true)
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 10 then
			Player.Hurt(GetGlobal("BaseDam") + 10,0.5)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
