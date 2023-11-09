timer = 0
bullets = {}
Beams = {}
Beams2 = {}
SetGlobal("WaveTime",500)
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
Arena.Resize(150, 150) 
R = CreateProjectile("Wall",Arena.width/2 - 10,10)
R.sprite.rotation = 0
R.sprite.color = { 0.02, 0.37, 0.97 }
R.SetVar("Type",1)
L = CreateProjectile("Wall",-Arena.width/2 + 10,10)
L.sprite.rotation = 0
L.sprite.color = { 0.02, 0.37, 0.97 }
L.SetVar("Type",1)

function Update()
    timer = timer + 1
	if timer > 50 then
		R.MoveTo((Arena.width/2 - 20) * math.cos((timer - 51)/30),0)
		L.MoveTo(-(Arena.width/2 - 20) * math.cos((timer - 51)/30),0)
	end
	if timer == 150 then
		Warn = CreateProjectile("Pixel", 0, 440)
		Warn.sprite.color = {1, 0, 0}
		Warn.SetVar("Type",3)
	elseif timer >= 200 then
		Warn.sprite.alpha = Warn.sprite.alpha - 0.05
		if Warn.sprite.alpha <= 0 then
			Warn.remove()
		end
	elseif timer > 150 then
		if Warn.sprite.yscale < 640 then
			Warn.sprite.scale(1,Warn.sprite.yscale + 64)
			Warn.Move(0,-32)
		end
	end
	if timer == 200 then
		for i=1,40 do
			local Beam = CreateProjectile("BlastBig", 0, -200 + (i*16))
			Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
			Beam.sprite.xscale = 0
			Beam.ppcollision = true
			table.insert(Beams,Beam)
		end
	elseif timer > 200 and timer <= 250 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.GetVar("Moved") == nil then
				Beam.SetVar("Moved",true)
			end
			if Beam.sprite.xscale < 1 then
				Beam.sprite.xscale = Beam.sprite.xscale + 0.05
			end
			if Beam.sprite.xscale > 0.2 then
				Beam.SetVar("Type",2)
			end
		end
	elseif timer > 250 and timer <= 300 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.isactive == true then
				if Beam.sprite.xscale > 0 then
					Beam.sprite.xscale = Beam.sprite.xscale - 0.05
				else
					Beam.remove()
				end
			end
		end
	end
	if timer == 280 then
		Warn1 = CreateProjectile("Pixel", -50, 440)
		Warn1.sprite.color = {1, 0, 0}
		Warn1.SetVar("Type",3)
		Warn2 = CreateProjectile("Pixel", 50, 440)
		Warn2.sprite.color = {1, 0, 0}
		Warn2.SetVar("Type",3)
	elseif timer >= 330 then
		Warn1.sprite.alpha = Warn.sprite.alpha - 0.05
		if Warn1.sprite.alpha <= 0 then
			Warn1.remove()
		end
		Warn2.sprite.alpha = Warn.sprite.alpha - 0.05
		if Warn2.sprite.alpha <= 0 then
			Warn2.remove()
		end
	elseif timer > 280 and Warn1.sprite.yscale < 640 then
		Warn2.sprite.scale(1,Warn2.sprite.yscale + 64)
		Warn2.Move(0,-32)
		Warn1.sprite.scale(1,Warn1.sprite.yscale + 64)
		Warn1.Move(0,-32)
	end
	if timer == 330 then
		for i=1,40 do
			local Beam = CreateProjectile("BlastBig", -50, -200 + (i*16))
			Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
			Beam.sprite.xscale = 0
			Beam.ppcollision = true
			table.insert(Beams2,Beam)
			local Beam = CreateProjectile("BlastBig", 50, -200 + (i*16))
			Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
			Beam.sprite.xscale = 0
			Beam.ppcollision = true
			table.insert(Beams2,Beam)
		end
	elseif timer > 330 and timer <= 390 then
		for i=1,#Beams2 do
			local Beam = Beams2[i]
			if Beam.isactive == true then
				if Beam.GetVar("Moved") == nil then
					Beam.SetVar("Moved",true)
				end
				if Beam.sprite.xscale < 1 then
					Beam.sprite.xscale = Beam.sprite.xscale + 0.05
				end
				if Beam.sprite.xscale > 0.2 then
					Beam.SetVar("Type",2)
				end
			end
		end
	elseif timer > 390 and timer <= 440 then
		for i=1,#Beams2 do
			local Beam = Beams2[i]
			if Beam.isactive == true then
				if Beam.sprite.xscale > 0 then
					Beam.sprite.xscale = Beam.sprite.xscale - 0.05
				else
					Beam.remove()
				end
			end
		end
	end
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.Move(0,-5)
		elseif bullet.GetVar("MType") == 2 then
			bullet.Move(-5,0)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 20 then
			if GetGlobal("Moving") == true then
				Player.Hurt(GetGlobal("BaseDam") + 20,0.5)
			end
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 32 then
			Player.Hurt(GetGlobal("BaseDam") + 32,0.75)
		elseif bullet.GetVar("Type") == 3 then
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
