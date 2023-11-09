timer = 0
bullets = {}
Beams = {}
SetGlobal("WaveTime",math.huge)
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
	end
	if timer == 100 then
		Warn = CreateProjectile("Pixel", 340, 340)
		Warn.sprite.color = {1, 0, 0}
		Warn.sprite.rotation = -45
		Warn.SetVar("Type",3)
	elseif timer >= 150 then
		Warn.sprite.alpha = Warn.sprite.alpha - 0.05
		if Warn.sprite.alpha <= 0 then
			Warn.remove()
		end
	elseif timer > 100 then
		if Warn.sprite.yscale < 800 then
			Warn.sprite.scale(1,Warn.sprite.yscale + 64)
			Warn.Move(-16,-16)
		end
	end
	if timer >= 150 and timer <= 160 then
		if #Beams < 40 then
			for i=1,70 do
				local Beam = CreateProjectile("BlastBig", 340 - (i*8), 340 - (i*8))
				Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
				Beam.sprite.xscale = 0
				Beam.sprite.rotation = -45
				Beam.ppcollision = true
				Beam.SetVar("Type",3)
				table.insert(Beams,Beam)
				Beam.SendToBottom()
			end
		end
	elseif timer > 152 and timer <= 250 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.sprite.xscale < 2 then
				Beam.sprite.xscale = Beam.sprite.xscale + 0.05
			end
			if Beam.sprite.xscale > 0.2 then
				Beam.SetVar("Type",2)
			end
		end
	elseif timer > 250 and timer < 300 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.isactive == true then
				if Beam.sprite.xscale > 0 then
					Beam.sprite.xscale = Beam.sprite.xscale - 0.1
				else
					Beam.remove()
				end
			end
		end
	end
	if timer == 270 then
		Warn = CreateProjectile("Pixel", 0, 440)
		Warn.sprite.color = {1, 0, 0}
		Warn.SetVar("Type",3)
	elseif timer >= 350 then
		Warn.sprite.alpha = Warn.sprite.alpha - 0.05
		if Warn.sprite.alpha <= 0 then
			Warn.remove()
		end
	elseif timer > 270 then
		if Warn.sprite.yscale < 640 then
			Warn.sprite.scale(1,Warn.sprite.yscale + 64)
			Warn.Move(0,-32)
		end
	end
	if timer == 300 then
		for i=1,40 do
			local Beam = CreateProjectile("BlastBig", 0, -200 + (i*16))
			Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
			Beam.sprite.xscale = 0
			Beam.ppcollision = true
			Beam.SetVar("Type",3)
			table.insert(Beams,Beam)
			Beam.SendToBottom()
		end
	elseif timer > 302 and timer <= 400 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.isactive == true then
				if Beam.sprite.xscale < 1.8 then
					Beam.sprite.xscale = Beam.sprite.xscale + 0.05
				end
				if Beam.sprite.xscale > 0.2 then
					Beam.SetVar("Type",2)
				end
			end
		end
	end
	if timer == 450 then
		for i=1,40 do
			local Beam = CreateProjectile("BlastBig", 50, -200 + (i*16))
			Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
			Beam.sprite.xscale = 0
			Beam.ppcollision = true
			Beam.SetVar("Type",3)
			table.insert(Beams,Beam)
			Beam.SendToBottom()
			local Beam = CreateProjectile("BlastBig", -50, -200 + (i*16))
			Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
			Beam.sprite.xscale = 0
			Beam.ppcollision = true
			Beam.SetVar("Type",3)
			table.insert(Beams,Beam)
			Beam.SendToBottom()
		end
	elseif timer > 452 and timer <= 550 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.isactive == true then
				Beam.sprite.xscale = Beam.sprite.xscale + 0.1
				if Beam.sprite.xscale > 2 then
					Beam.SetVar("Type",4)
				end
			end
		end
	end
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
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") - 2 then
			Player.Hurt(GetGlobal("BaseDam") - 2,0.4)
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 16 then
			Player.Hurt(GetGlobal("BaseDam") + 16,0.4)
		elseif bullet.GetVar("Type") == 3 then
		elseif Player.ishurting == false and bullet.GetVar("Type") ~= -1 then
			Audio.Stop()
			SetGlobal("Angel",true)
		end
	end
end