timer = 0
bullets = {}
Beams = {}
SetGlobal("WaveTime",900)
WaveTim = GetGlobal("WaveTime")
SetGlobal("width",Arena.width)
SetGlobal("height",Arena.height)
require "Libraries/Remo"
I = 0
R = 0
V = 2
H = 0
Fire = CreateProjectile("Fire1", 0, 400)
Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
Fire.SetVar("MType",1)
Fire.SetVar("V",-2)
Fire.SetVar("Type",2)
Fire.ppcollision = true
table.insert(bullets,Fire)

function Update()
    timer = math.floor(WaveTim - GetGlobal("WaveTime"))
	if timer%15 == 0 and timer <= 100 then
		local Fire = CreateProjectile("Fire1", timer, -200)
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Fire.SetVar("MType",1)
		Fire.SetVar("V",10)
		Fire.SetVar("Type",1)
		Fire.ppcollision = true
		table.insert(bullets,Fire)
		local Fire = CreateProjectile("Fire1", -timer, -200)
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Fire.SetVar("MType",1)
		Fire.SetVar("V",10)
		Fire.SetVar("Type",1)
		Fire.ppcollision = true
		table.insert(bullets,Fire)
	end
	for i= 1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.Move(0,bullet.GetVar("V"))
			bullet.SetVar("V",bullet.GetVar("V") - 0.1)
		elseif bullet.GetVar("MType") == 2 and timer <= 1050 then
			bullet.MoveTo((bullet.GetVar("R") * math.cos((timer + bullet.GetVar("I"))/15)) + Star.x,(bullet.GetVar("R") * math.sin((timer + bullet.GetVar("I"))/15)) + Star.y)
			bullet.SetVar("R",bullet.GetVar("R") + 1)
		end
	end
	if timer == 250 then
		for i = 1,6 do
			Fire = CreateProjectile("Fire1", i*15 + 2, -200)
			Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
			Fire.SetVar("MType",1)
			Fire.SetVar("V",10)
			Fire.SetVar("Type",1)
			Fire.ppcollision = true
			table.insert(bullets,Fire)
			Fire = CreateProjectile("Fire1", -i*15 - 2, -200)
			Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
			Fire.SetVar("MType",1)
			Fire.SetVar("V",10)
			Fire.SetVar("Type",1)
			Fire.ppcollision = true
			table.insert(bullets,Fire)
		end
	end
	if timer == 250 then
		Star = CreateProjectile("BigStar", 0, 400)
		Star.SetVar("Type",2)
		Star.ppcollision = true
	elseif timer > 250 and timer < 350 then
		Star.Move(0,-2)
	elseif timer >= 370 and timer <= 1050 then
		Star.sprite.rotation = Star.sprite.rotation - R
		Star.ppcollision = true
		if R < 60 then
			R = R + 0.5
		end
		Star.Move(H,V)
		V = V - 0.02
		H = H - 0.001
		if timer%10 == 0 then
			I = I + 15
			S = CreateProjectile("Star", 40 * math.cos((timer + I)/15) + Star.x, 40 * math.sin((timer + I)/15) + Star.y)
			S.SetVar("I",I)
			S.SetVar("R",40)
			S.SetVar("Type",4)
			S.SetVar("MType",2)
			S.ppcollision = true
			table.insert(bullets,S)
		end
	end
	if timer == 630 then
		Warn1 = CreateProjectile("Pixel", 50, 440)
		Warn1.sprite.color = {1, 0, 0}
		Warn1.SetVar("Type",5)
	elseif timer >= 650 then
		Warn1.sprite.alpha = Warn1.sprite.alpha - 0.05
		if Warn1.sprite.alpha <= 0 then
			Warn1.remove()
		end
	elseif timer > 630 then
		if Warn1.sprite.yscale < 640 then
			Warn1.sprite.scale(1,Warn1.sprite.yscale + 64)
			Warn1.Move(0,-32)
		end
	end
	if timer == 660 then
		Warn2 = CreateProjectile("Pixel", -380, Arena.height/2 - 5)
		Warn2.sprite.color = {1, 0, 0}
		Warn2.SetVar("Type",5)
	elseif timer >= 680 then
		Warn2.sprite.alpha = Warn2.sprite.alpha - 0.05
		if Warn2.sprite.alpha <= 0 then
			Warn2.remove()
		end
	elseif timer > 660 then
		if Warn2.sprite.yscale < 640 then
			Warn2.sprite.scale(Warn2.sprite.xscale + 64,1)
			Warn2.Move(32,0)
		end
	end
	if timer >= 680 and timer <= 690 then
		if #Beams < 80 then
			for i=1,40 do
				local Beam = CreateProjectile("BlastBig", 260 - (i*16) + 300, Arena.height/2 - 5 + 300)
				Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
				Beam.sprite.xscale = 0
				Beam.sprite.rotation = 90
				Beam.ppcollision = true
				Beam.SetVar("Type",3)
				table.insert(Beams,Beam)
			end
		end
	end
	if timer >= 650 and timer <= 660 then
		if #Beams < 40 then
			for i=1,40 do
				local Beam = CreateProjectile("BlastBig", 50 + 300, -200 + (i*16) + 300)
				Beam.sprite.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
				Beam.sprite.xscale = 0
				Beam.ppcollision = true
				Beam.SetVar("Type",3)
				table.insert(Beams,Beam)
			end
		end
	elseif timer > 652 and timer <= 750 then
		for i=1,#Beams do
			local Beam = Beams[i]
			if Beam.GetVar("Moved") == nil then
				Beam.Move(-300,-300)
				Beam.SetVar("Moved",true)
			end
			if Beam.sprite.xscale < 1 then
				Beam.sprite.xscale = Beam.sprite.xscale + 0.05
			end
			if Beam.sprite.xscale > 0.2 then
				Beam.SetVar("Type",3)
			end
		end
	elseif timer > 750 then
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
	if GetGlobal("WaveTime") <= 150 then
		Arena.Resize(16, 16)
		remo()
		if Arena.height == 16 and Arena.width == 16 then
			Player.MoveTo(0,0,false)
			SetGlobal("SOUL",1)
		end
	end
	if GetGlobal("WaveTime") <= 100 and GetGlobal("WaveTime") > 20 then
		if White ~= nil then
			White.alpha = White.alpha + (1/30)
		else
			White = CreateSprite("Pixel","Top")
			White.Scale(9999,9999)
			White.alpha = 0
		end
	end
	if GetGlobal("WaveTime") <= 20 then
		if White.isactive == true then
			White.remove()
		end
		SetGlobal("StarFalls",true)
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
		elseif bullet.GetVar("Type") == 5 then
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end