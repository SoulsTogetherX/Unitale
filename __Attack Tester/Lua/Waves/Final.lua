-- Figure it out...
require "Libraries/Basics"
require "Libraries/Remo"
timer = 0
bullets = {}
SetGlobal("WaveTime",math.huge)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
Arena.Move(0, 100, true, false)

Cover = CreateSprite("Pixel","BelowPlayer")
Cover.MoveTo(320,255)
Cover.Scale(640,510)
Cover.color = {0,0,0}
Cover.alpha = 0
SetGlobal("barrier",true)
VM1 = 1.5
VM2 = 0
VM3 = 1
VM4 = 5
VM5 = 0
Ss = {}
Beams = {}
Beams2 = {}
Beams3 = {}
R = 0
C = 0
B = 1
I = 0
Z = false
function Update()
    timer = timer + 1
	if angel ~= nil and angel.isactive == true then
		angel.rotation = 0
		angel.alpha = 0
	end
	if timer == 50 then
		Arena1 = CreateSprite("arena_P1","Top")
		Arena1.MoveTo(320,260)
		Arena2 = CreateSprite("arena_P2","Top")
		Arena2.MoveTo(245,260)
		Arena2.SetPivot(0.05, 0.5)
		Arena3 = CreateSprite("arena_P3","Top")
		Arena3.MoveTo(346,323)
		Arena3.SetPivot(0.65, 0.95)
		Arena4 = CreateSprite("arena_P4","Top")
		Arena4.MoveTo(320,260)
		Arena5 = CreateSprite("arena_P5","Top")
		Arena5.MoveTo(320,260)
	elseif timer > 50 and timer < 100 then
		Cover.alpha = Cover.alpha + 0.02
	elseif timer == 100 then
		Arena.ResizeImmediate(640, 510)
		Arena.Move(0, -200, false, true)
	elseif timer == 200 then
		Shine = CreateSprite("Shine0","Top")
		Shine.color32 = {66,252,255}
		Shine.MoveTo(340,385)
		Shine.loopmode = "ONESHOTEMPTY"
		Shine.SetAnimation({"Shine0","Shine1","Shine2","Shine3","Shine4","Shine5","Blank"},1/8) 
		Audio.PlaySound("00002a52")
		Fist = CreateProjectileAbs("Fist",280,400)
		Fist.sprite.Scale(2,2)
		Fist.sprite.rotation = 180
		Fist.sprite.alpha = 0
		Fist.SetVar("Type",1)
	elseif timer == 250 then
		Shine.remove()
		Cover.remove()
	end
	if timer > 220 and timer < 280 then
		if timer <= 270 then
			Fist.sprite.alpha = Fist.sprite.alpha + 0.05
		end
		Fist.sprite.MoveToAbs(280 + ((math.random()*8)-4),400 + ((math.random()*8)-4))
	elseif timer > 220 and timer <= 295 then
		Fist.MoveToAbs(280,400 - (12*(timer - 280)))
	elseif timer > 295 and timer <= 305 then
		Fist.MoveToAbs(280,220 + (1*(timer - 280)))
	elseif timer > 330 and timer <= 360 then
		Fist.sprite.rotation = (3)*(timer - 330) - 180
		Fist.MoveToAbs(Fist.absx - 2*math.cos((timer - 330)/30),Fist.absy + 1*math.cos((timer - 330)/30))
	elseif timer > 380 and timer <= 419 then
		Fist.MoveToAbs(Fist.absx + 12,Fist.absy)
	elseif timer == 460 then
		Fist.remove()
		Pointer = CreateSprite("Point","Top")
		Pointer.MoveTo(450,260)
		Pointer.Scale(2,2)
		Pointer.alpha = 0
	elseif timer > 460 and timer <= 470 then
		Pointer.alpha = Pointer.alpha + 0.1
	elseif timer >= 500 and timer < 2320 then
		Player.sprite.rotation = 180
		SetGlobal("DegreeAngle",180)
		if angel ~= nil and angel.isactive == true then
			angel.rotation = 180
		end
		if SOUL == nil then
			SOUL = CreateSprite("Heart0","BelowBullet")
			SOUL.color32 = {0, 60, 255}
			SOUL.rotation = 180
			SOUL.Scale(3,3)
			SOUL.alpha = 0.1
			Audio.PlaySound("Change")
		elseif SOUL ~= nil then
			if SOUL.isactive == true then
				SOUL.color32 = {0, 60, 255}
				if SOUL.xscale > 1 then
					SOUL.alpha = SOUL.alpha + 0.0225
					SOUL.Scale(SOUL.xscale - 0.05,SOUL.yscale - 0.05)
				else
					Player.sprite.color32 = {0, 60, 255}
				end
				if GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "DIALOGRESULT" then
					SOUL.MoveTo(Player.absx,Player.absy)
				else
					SOUL.MoveTo(99999,99999)
				end
			else
				SOUL = CreateSprite("Heart0","BelowBullet")
				SOUL.color32 = {0, 60, 255}
				SOUL.rotation = 180
				SOUL.Scale(3,3)
				SOUL.alpha = 0.1
				Audio.PlaySound("Change")
			end
		end
		if timer < 590 then
			VM2 = VM2 + 0.1
			Pointer.MoveTo(Pointer.x, Pointer.y - VM2)
			Arena5.MoveTo(Arena5.x, Arena5.y - VM2)
			Arena1.MoveTo(Arena1.x, Arena1.y - VM2)
			SetGlobal("barrier",false)
		end
	end
	if timer >= 285 then
		if timer <= 295 then
			Arena1.MoveTo(Arena1.x, Arena1.y - 12)
		elseif timer < 500 then
			if timer <= 420 then
				VM1 = VM1 - 0.05
				Arena1.MoveTo(Arena1.x - 0.1,Arena1.y + VM1)
				if timer < 310 then
					Arena1.rotation = Arena1.rotation + 0.2
				elseif timer >= 330 and timer <= 342 then
					Arena1.rotation = Arena1.rotation - 0.2
				end
				if Arena1.y <= 130 then
					VM1 = VM1*2/3
					Arena1.MoveTo(Arena1.x,130)
				end
			end
		end
		if timer >= 290 and timer < 590 then
			if timer <= 313 then
				Arena2.MoveTo(Arena2.x,Arena2.y - 3*math.sin(math.pi*(timer-295)/23))
				Arena2.rotation = Arena2.rotation - 5
			elseif timer <= 330 then
				Arena2.rotation = Arena2.rotation + 4*math.cos(math.pi*(timer-313)/47)
				Arena2.MoveTo(Arena2.x,Arena2.y - 2)
			elseif timer <= 600 then
				VM3 = VM3 - 0.1
				Arena2.rotation = Arena2.rotation + math.abs((VM3-1)*0.8)
				Arena2.MoveTo(Arena2.x - 0.2,Arena2.y + VM3)
			end
		end
		if timer >= 290 and timer < 590 then
			VM4 = VM4 - 0.15
			Arena3.MoveTo(Arena3.x - 1,Arena3.y + VM4)
			Arena3.rotation = Arena3.rotation + 5
		end
		if timer >= 393 and timer < 590 then
			VM5 = VM5 - 0.02
			Arena4.MoveTo(Arena4.x + 12,Arena4.y + VM5)
			Arena4.rotation = Arena4.rotation - 1
		end
	end
	if timer == 590 then
		Arena1.remove()
		Arena2.remove()
		Arena3.remove()
		Arena4.remove()
		Arena5.remove()
		Pointer.remove()
		SetGlobal("ChangeS",true)
		B1.color = {0, 60, 255}
		B2.color = {0, 60, 255}
		B3.color = {0, 60, 255}
		for i=1,100 do
			local S = CreateSprite("Pixel","BelowPlayer")
			S.MoveTo(math.random(0,640),math.random(0,520))
			local M = math.random(1,4)
			S.Scale(M, M)
			S.SetVar("Sparkle", math.random()*3000 + timer + 1)
			S.alpha = 0
			table.insert(Ss,S)
		end
	end
	if timer >= 591 then
		for i=1,#Ss do
			local S = Ss[i]
			if S.isactive == true then
				if S.alpha < 0.7 then
					S.alpha = S.alpha + 0.01
				end
				S.MoveToAbs(S.absx,S.absy - 0.02)
				if timer >= S.GetVar("Sparkle") then 
					S.SetAnimation({"Pixel", "StarSparkle1", "StarSparkle2","StarSparkle3","Pixel","Pixel","Pixel"},1/10) 
					S.loopmode = "ONESHOT"
					S.SetVar("Sparkle", math.random()*3000 + timer)
				end
				if S.absy < 0 then
					S.MoveToAbs(S.absx,520)
				end
				if S.x < (-Arena.currentwidth/2) + Arena.currentx or S.x > (Arena.currentwidth/2) + Arena.currentx or S.y < (-Arena.currentheight/2) + Arena.currenty + 250 or S.y > (Arena.currentheight/2) + Arena.currenty + 270 then
					if S.isactive == true then
						S.remove()
					end
				end
			end
		end
	end
	if timer == 650 then
		local Fist = CreateProjectileAbs("Fist",220,380)
		Fist.sprite.Scale(2,2)
		Fist.sprite.alpha = 0
		Fist.SetVar("Type",1)
		Fist.SetVar("M",1)
		Fist.SetVar("timer",0)
		Fist.SetVar("x",Fist.absx)
		Fist.SetVar("y",Fist.absy)
		table.insert(bullets,Fist)
	end
	if timer == 680 then
		local Fist = CreateProjectileAbs("Fist",420,380)
		Fist.sprite.Scale(2,2)
		Fist.sprite.alpha = 0
		Fist.SetVar("Type",1)
		Fist.SetVar("M",1)
		Fist.SetVar("timer",0)
		Fist.SetVar("x",Fist.absx)
		Fist.SetVar("y",Fist.absy)
		table.insert(bullets,Fist)
	end
	for i=1,#Beams do
		local Beam = Beams[i]
		if Beam.isactive == true then
			if timer <= Beam.GetVar("timer") and timer < 2130 then
				if Beam.sprite.xscale < 1 then
					Beam.sprite.xscale = Beam.sprite.xscale + 0.05
				end
				if Beam.sprite.xscale > 0.2 then
					Beam.SetVar("Type",3)
				end
			elseif timer <= Beam.GetVar("timer") and timer > 2500 then
				if Beam.sprite.xscale < 1.5 then
					Beam.sprite.xscale = Beam.sprite.xscale + 0.05
				end
				if Beam.sprite.xscale > 0.2 then
					Beam.SetVar("Type",3)
				end
			else
				if Beam.sprite.xscale > 0 then
					Beam.sprite.xscale = Beam.sprite.xscale - 0.05
				else
					Beam.remove()
				end
			end
		end
	end
	for i = 1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("MType") == 1 then
			
			else
			
			end
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