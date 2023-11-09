timer = 0
Warns = {}
Exs = {}
Beams = {}
SetGlobal("WaveTime",1600)
WaveTim = GetGlobal("WaveTime")
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
Arena.ResizeImmediate(160, 160)
a = 1
b = 0
R1 = 1
function Update()
    timer = timer + 1
	if GetGlobal("WaveTime") <= 2 then
		for i=1,#Warns do
			local Warning = Warns[i]
			local Ex = Exs[i]
			if Warning.isactive == true then
				Warning.remove()
			end
			if Ex.isactive == true then
				Ex.remove()
			end
		end
		SetGlobal("WaveTime",100)
		State("ACTIONSELECT")
	end
	if timer%250 == 0 then
		R1 = math.random(1,2)
		if R1 == 1 then
			R = math.random(1,5)
			for i=1,5 do
				if i ~= R then
					local Warning = CreateSprite("WarningLong1", "BelowBullet")
					Warning.MoveTo(255 +((i-1)*32),175)
					table.insert(Warns,Warning)
					local Ex = CreateSprite("!1", "BelowBullet")
					Ex.MoveTo(Warning.absx,Warning.absy)
					table.insert(Exs,Ex)
				end
			end
			Arrow = CreateSprite("TurnArrow", "BelowBullet")
			Arrow.Scale(2,2)
			Arrow.MoveTo(400,300)
		elseif R1 == 2 then
			R = math.random(1,5)
			for i=1,5 do
				if i ~= R then
					local Warning = CreateSprite("WarningLong1", "BelowBullet")
					Warning.MoveTo(320,110 + ((i-1)*32))
					Warning.rotation = 90
					table.insert(Warns,Warning)
					local Ex = CreateSprite("!1", "BelowBullet")
					Ex.MoveTo(Warning.absx,Warning.absy)
					table.insert(Exs,Ex)
				end
			end
			Arrow = CreateSprite("TurnArrow", "BelowBullet")
			Arrow.Scale(-2,2)
			Arrow.MoveTo(200,300)
		end
	end
	if (timer+100)%250 == 0 then
		if Arrow ~= nil and Arrow.isactive == true then
			Arrow.remove()
		end
		if R1 == 1 then
			for i=1,#Warns do
				local Warning = Warns[i]
				local Ex = Exs[i]
				if Warning.isactive == true then
					for i=1,50 do
						local Beam = CreateProjectileAbs("Blast", -280 + (i*16), Warning.x - 145)
						Beam.sprite.xscale = 0
						Beam.sprite.yscale = 2
						Beam.sprite.rotation = 90
						Beam.ppcollision = true
						table.insert(Beams,Beam)
					end
					Ex.remove()
					Warning.remove()
				end
			end
		elseif R1 == 2 then
			for i=1,#Warns do
				local Warning = Warns[i]
				local Ex = Exs[i]
				if Warning.isactive == true then
					for i=1,50 do
						local Beam = CreateProjectileAbs("Blast", Warning.y + 145, -320 + (i*16))
						Beam.sprite.xscale = 0
						Beam.sprite.yscale = 2
						Beam.ppcollision = true
						table.insert(Beams,Beam)
					end
					Ex.remove()
					Warning.remove()
				end
			end
		end
		b = 1
	elseif b == 1 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.sprite.xscale < 1 then
				Beam.sprite.xscale = Beam.sprite.xscale + 0.05
			end
			if Beam.sprite.xscale > 0.2 then
				Beam.SetVar("Type",1)
			end
		end
		if (timer+200)%250 == 0 then
			b = 2
		end
	elseif b == 2 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.isactive == true then
				if Beam.sprite.xscale > 0 then
					Beam.sprite.xscale = Beam.sprite.xscale - 0.05
				end
				if Beam.sprite.xscale <= 0 then
					Beam.remove()
				elseif Beam.sprite.xscale <= 0.2 then
					Beam.SetVar("Type",0)
				end
			end
		end
	end
	if timer%8 == 0 then
		a = a*(-1)
	end
	for i=1,#Warns do
		local Warning = Warns[i]
		local Ex = Exs[i]
		if Warning.isactive == true then
			if a == 1 then
				Warning.Set("WarningLong1")
				Ex.Set("!1")
				if Arrow ~= nil and Arrow.isactive == true then
					Arrow.color32 = {250, 0, 0}
				end
			elseif a == -1 then
				Warning.Set("WarningLong2")
				Ex.Set("!2")
				if Arrow ~= nil and Arrow.isactive == true then
					Arrow.color32 = {250, 250, 0}
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 25 then
			Player.Hurt(GetGlobal("BaseDam") + 25,0.75)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end