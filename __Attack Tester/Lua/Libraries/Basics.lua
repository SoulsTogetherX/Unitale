FuncStart = false
SetGlobal("SOUL",0)
SetGlobal("WaveTime",100)
MType = 0
SetGlobal("Blank",false)
SetGlobal("Blank2",false)
SetGlobal("Angel",false)
SetGlobal("Moving",false)
SetGlobal("REVIVE",0)
AnTimer = 0
ForEver = 0
CutTimer = 0
V = 1
B1 = CreateSprite("Pixel","BelowUI")
B1.Scale(640,30)
B1.MoveTo(320,0)
B1.color = {0, 60, 255}
B1.alpha = 0
B2 = CreateSprite("Pixel","BelowUI")
B2.Scale(640,20)
B2.MoveTo(320,0)
B2.color = {0, 60, 255}
B2.alpha = 0
B3 = CreateSprite("Pixel","BelowUI")
B3.Scale(640,10)
B3.MoveTo(320,0)
B3.color = {0, 60, 255}
B3.alpha = 0
SetGlobal("DEBUG",true)
Vol = 1
SetGlobal("barrier",false)
SetGlobal("DegreeAngle",0)

function FPS()
	if GetGlobal("DEBUG") == true then
		if Input.Menu == 1 then
			SetGlobal("Angel",true)
		end
	end
	if angel ~= nil and angel.isactive == true then
		angel.rotation = GetGlobal("DegreeAngle")
	end
	function EnteringState(newstate, oldstate)
		if oldstate == "DEFENDING" then
			FuncStart = false
		elseif newstate == "DEFENDING" then
			FuncStart = true
		end
	end
	if not (GetGlobal("REVIVE") == 0 and GetGlobal("Angel") == true) then
		B1.Scale(640,30+math.abs(150*math.cos(timer0/100)))
		B2.Scale(640,20+math.abs(100*math.cos(timer0/100)))
		B3.Scale(640,10+math.abs(50*math.cos(timer0/100)))
	else
		B1.Scale(1,1)
		B2.Scale(1,1)
		B3.Scale(1,1)
	end
	if V < 1 then
		V = V + 0.01
	end
	Audio.Volume(V)
	if GetGlobal("Angel") == true then
		if ForEver == 0 then
			SetGlobal("StarFalls",false)
			SetGlobal("META",-1)
			cover = CreateSprite("Cover3","Top")
			cover.MoveTo(320,255)
			C = CreateSprite("Pixel","Top")
			C.MoveTo(320,255)
			C.color = {1,1,1}
			C.Scale(99999,99999)
			SetGlobal("Blank",true)
			Audio.Stop()
			Player.sprite.alpha = 0
			BattleDialog({"[noskip][w:40][waitall:3]...","[noskip]The Universe seems to warp\raround you...","[noskip]You cannot understand what you\rare seeing.","[noskip]But...","[noskip]You do know that [waitall:3]everything\r[waitall:5]hurts.","[noskip]This god...","[noskip]He...","[noskip]...won't[w:20] go down.","[noskip]Everything you try leads to\rnothing but pain...","[noskip]You start to lose hope.","[noskip][waitall:3]...","[noskip][waitall:2]...but you prop yourself up on\ryour hands[w:6], anyway..."})
			State("DIALOGRESULT")
			ForEver = 1
		end
		if C.isactive == true then
			if (ForEver == 1 or ForEver == 2) and GetCurrentState() == "DIALOGRESULT" and C.alpha > 0 then
				C.alpha = C.alpha - 0.01
			elseif C.alpha <= 0 then
				C.remove()
			end
		end
		if ForEver == 1 or ForEver == 2 then
			if Input.Menu == 1 then
				State("ENEMYDIALOGUE")
				ForEver = 3
				Player.SetControlOverride(true)
				cover.remove()
				cover = CreateSprite("Cover1","Top")
				cover.MoveTo(320,255)
				if C ~= nil and C.isactive == true then
					C.remove()
				end
			end	
		elseif ForEver == 2 then
			if Input.Menu == 2 then
				State("ENEMYDIALOGUE")
			end	
		end
		if ForEver == 1 and GetCurrentState() ~= "DIALOGRESULT" then
			Audio.LoadFile("Marching_Pirates")
			Audio.Pitch(1)
			Audio.Volume(Vol)
			BattleDialog({"[noskip]Despite everything, it's still\ryou...","[noskip]...against him.","[noskip]It has always been that.","[noskip]Sans[w:10], Undyne[w:10], Asgore...","[noskip]You have proven that[w:10], no matter\rthe enemy...","[noskip]...you survive.","[noskip]You grip your knife harder...","[noskip]This world is kill or be killed.","[noskip]...and you are not going to be\rkilled!","[noskip]Not today...","[noskip]Because you...","[noskip]ARE DETERMINED!","[noskip]...and nothing will get past you!","[noskip]You stand up.","[noskip]Gods... [w:20]Kings...","[noskip]It doesn't matter...","[noskip]They were never in control...","[noskip]Never...","[noskip][color:ff0000]Never...[color:ffffff]","[noskip]Nothing will stop your will!","[noskip]Which is growning bigger...","[noskip]...and bigger.","[noskip][color:ff0000][waitall:8]...AND BIGGER![color:ffffff]","You will win!","[noskip][waitall:3]...","[noskip][waitall:3]...","[noskip]You let everything you have out...","[next]"})
			State("DIALOGRESULT")
			ForEver = 2
		elseif ForEver == 2 and GetCurrentState() ~= "DIALOGRESULT" then
			State("ENEMYDIALOGUE")
			Player.SetControlOverride(true)
			cover.remove()
			cover = CreateSprite("Cover1","Top")
			cover.MoveTo(320,255)
			ForEver = 3
		end
		if ForEver == 3 then
			AnTimer = AnTimer + 1
			Vol = Vol - 0.05
			Audio.Volume(Vol)
			Player.sprite.alpha = 1
			if Vol <= 0 then
				Audio.Stop()
			end
			if AnTimer == 80 then
				cover2 = CreateSprite("Pixel","Top")
				cover2.Scale(99999,99999)
				cover2.MoveTo(320,255)
			end
			if AnTimer == 100 then
				angel = CreateSprite("Angel of Death00","BelowBullet")
				angel.MoveTo(Player.absx,Player.absy)
				angel.loopmode = "ONESHOT"
				cover2.alpha = 0
			end
			if AnTimer == 140 then
				angel.SetAnimation({"Angel of Death00", "Angel of Death01", "Angel of Death02","Angel of Death03", "Angel of Death04", "Angel of Death05","Angel of Death06", "Angel of Death07", "Angel of Death08","Angel of Death09","Angel of Death10"},1/8) 
			end
			if AnTimer >= 200 and AnTimer <= 220 then
				cover2.color = {0,0,0}
				cover2.alpha = cover2.alpha + 0.05
			end
			if AnTimer == 260 then
				cover2.alpha = 0
				Player.name = "Chara"
				Audio.PlaySound("00002a52")
				Shine = CreateSprite("Shine0","Top")
				Shine.color = {1,0,0}
				Shine.MoveTo(104,80)
				Shine.loopmode = "ONESHOTEMPTY"
				Shine.SetAnimation({"Shine0","Shine1","Shine2","Shine3","Shine4","Shine5","Blank"},1/8) 
				cover.Set("Cover2")
			end
			if AnTimer == 275 then
				Audio.PlaySound("omegaflowey_laugh")
			end
			if AnTimer == 313 then
				if Shine ~= nil then
					if Shine.isactive == true then
						Shine.remove()
					end
				end
			end
			if AnTimer == 500 then
				LF = CreateSprite("LF3","Top")
				LF.MoveTo(330,255)
				cover2.alpha = 1
				cover.remove()
			end
			if AnTimer >= 520 and AnTimer <= 600 then
				cover2.color = {((AnTimer - 520)/40),((AnTimer - 520)/80),((AnTimer - 520)/80)}
			end
			if AnTimer == 610 then
				cover2.remove()
				Player.sprite.alpha = 0
				SetGlobal("Blank",false)
				Audio.Pitch(1)
				Audio.LoadFile("LOVE")
				SetGlobal("SOUL",0)
				SetGlobal("StarFalls",true)
				if SOUL ~= nil then
					if SOUL.isactive == true then
						SOUL.remove()
					end
				end
				SetGlobal("REVIVE",3)
				if GetGlobal("DEBUG") == true then
					SetGlobal("REVIVE",math.huge)
				end
				if Button ~= nil then
					if Button.isactive == true then
						Button.remove()
					end
				end
				for i = 1,#bullets do
					bullet = bullets[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				X = -100
				Shoot = false
				timer3 = 0
				possible_attacks = {"SpaceFight"}
				if GetGlobal("DEBUG") == true then
					possible_attacks = Debug
				end
				B1.color = {255, 0, 0}
				B2.color = {255, 0, 0}
				B3.color = {255, 0, 0}
				Player.ForceHP(Player.maxhp)
				angel.Set("Angel of Death10")
				ForEver = 4
				AnTimer = 611
			end
		end
		if ForEver == 4 then
			if GetGlobal("REVIVE") == 3 then
				LF.Set("LF3")
			elseif GetGlobal("REVIVE") == 2 then
				LF.Set("LF2")
			elseif GetGlobal("REVIVE") == 1 then
				LF.Set("LF1")
			elseif GetGlobal("REVIVE") == 0 then
				LF.Set("LF0")
			end
			if GetGlobal("CUTSCENE") == true then
				CutTimer = CutTimer + 1
				if CutTimer == 1 then
					Player.sprite.alpha = 0
					if SOUL ~= nil then
						if SOUL.isactive == true then
							SOUL.remove()
						end
					end
					Audio.Pause()
					enemies[1].SetVar('currentdialogue', {"[noskip][w:124][next]"})
					State("ENEMYDIALOGUE")
					cover2 = CreateSprite("Pixel","BelowBullet")
					cover2.alpha = 0
					cover2.Scale(100,50)
					cover2.MoveTo(560,70)
					cover2.color = {0,0,0}
					cover = CreateSprite("Cover4","Top")
					cover.alpha = 0
				elseif CutTimer <= 21 then
					cover.alpha = (CutTimer-1)/20
					cover2.alpha = (CutTimer-1)/20
				elseif CutTimer == 100 then
					Audio.PlaySound("heartbeatbreaker")
					angel.alpha = 0
					angelP1 = CreateSprite("Angel of Death11","Top")
					angelP1.MoveTo(angel.x,angel.y)
					angelP2 = CreateSprite("Angel of Death12","Top")
					angelP2.MoveTo(angel.x,angel.y)
				elseif CutTimer >= 120 and CutTimer <= 190 then
					angelP1.MoveTo(angel.x + ((2*math.random())-1),angel.y + ((2*math.random())-1))
					angelP2.MoveTo(angel.x + ((2*math.random())-1),angel.y + ((2*math.random())-1))
				elseif CutTimer == 191 then
					Audio.PlaySound("Shoot3")
					angelP1.remove()
					angelP2.remove()
					angel.alpha = 1
					Player.ForceHP(Player.maxhp)
				elseif CutTimer > 241 and cover.alpha > 0 then
					cover2.alpha = cover.alpha - 0.05
					cover.alpha = cover.alpha - 0.05
				elseif CutTimer == 262 then
					if cover ~= nil then
						cover.remove()
					end
					if cover2 ~= nil then
						cover2.remove()
					end
					CutTimer = 0
					SetGlobal("CUTSCENE",false)
					V = 0
					Audio.Volume(0)
					Audio.Unpause()
					Player.sprite.alpha = 1
				end
			end
			if angel ~= nil then
				if GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "DIALOGRESULT" then
					angel.MoveTo(Player.absx,Player.absy)
				else
					angel.MoveTo(99999,99999)
				end
			else
				angel = CreateSprite("Angel of Death00","BelowBullet")
				angel.MoveTo(Player.absx,Player.absy)
			end
		end
	end
	if FuncStart == true and GetGlobal("SOUL") == 0 then
		Player.SetControlOverride(true)
		if SOUL ~= nil then
			if SOUL.isactive == true then
				SOUL.remove()
			end
		end
		Player.sprite.color32 = {255, 0, 0}
		if GetGlobal("Blank") == false and GetGlobal("barrier") == false then
			if Input.Up > 0 then
				if angel ~= nil then
					if Player.y + 8 < GetGlobal("height")/2 then
						angel.MoveTo(Player.absx,Player.absy + 2,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x,Player.y + 2,false)
			end
			if Input.Down > 0 then
				if angel ~= nil then
					if Player.y - 8 > -GetGlobal("height")/2 then
						angel.MoveTo(Player.absx,Player.absy - 2,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x,Player.y - 2,false)
			end
			if Input.Right > 0 then
				if angel ~= nil then
					if Player.x + 8 < GetGlobal("width")/2 then
						angel.MoveTo(Player.absx + 2,Player.absy,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x + 2,Player.y,false)
			end
			if Input.Left > 0 then
				if angel ~= nil then
					if Player.x - 8 > -GetGlobal("width")/2 then
						angel.MoveTo(Player.absx - 2,Player.absy,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x - 2,Player.y,false)
			end
			if Input.Up > 0 or Input.Down > 0 or Input.Right > 0 or Input.Left > 0 then
				SetGlobal("Moving",true)
			else
				SetGlobal("Moving",false)
			end
		elseif GetGlobal("Blank") == false and GetGlobal("barrier") == true then
			Player.SetControlOverride(true)
			if SOUL ~= nil then
				if SOUL.isactive == true then
					SOUL.remove()
				end
			end
			if Input.Up > 0 and Player.y + 2 < GetGlobal("height")/2 + 10 - 5 then
				if angel ~= nil then
					if Player.y + 8 < GetGlobal("height")/2 then
						angel.MoveTo(Player.absx,Player.absy + 2,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x,Player.y + 2,false)
			end
			if Input.Down > 0 and Player.y - 2 > -GetGlobal("height")/2 + 10 + 5 then
				if angel ~= nil then
					if Player.y - 8 > -GetGlobal("height")/2 then
						angel.MoveTo(Player.absx,Player.absy - 2,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x,Player.y - 2,false)
			end
			if Input.Right > 0 and Player.x + 2 < GetGlobal("width")/2 - 5 then
				if angel ~= nil then
					if Player.x + 8 < GetGlobal("width")/2 then
						angel.MoveTo(Player.absx + 2,Player.absy,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x + 2,Player.y,false)
			end
			if Input.Left > 0 and Player.x - 2 > -GetGlobal("width")/2 + 5 then
				if angel ~= nil then
					if Player.x - 8 > -GetGlobal("width")/2 then
						angel.MoveTo(Player.absx - 2,Player.absy,false)
					else
						angel.MoveTo(Player.absx,Player.absy,false)
					end
				end
				Player.MoveTo(Player.x - 2,Player.y,false)
			end
			if Input.Up > 0 or Input.Down > 0 or Input.Right > 0 or Input.Left > 0 then
				SetGlobal("Moving",true)
			else
				SetGlobal("Moving",false)
			end
		end
		if GetGlobal("WaveTime") > 0 then
			SetGlobal("WaveTime",GetGlobal("WaveTime") - (1/Time.mult))
		else
			SetGlobal("FinishedAtk",true)
			State("ACTIONSELECT")
			SetGlobal("WaveTime",100)
		end
	elseif FuncStart == true and GetGlobal("SOUL") == 1 then
		Player.SetControlOverride(true)
		if Input.Up > 0 and not (Input.Right > 0 or Input.Left > 0) then
			MType = 1
		elseif Input.Down > 0 and not (Input.Right > 0 or Input.Left > 0) then
			MType = 2
		elseif Input.Right > 0 and not (Input.Up > 0 or Input.Down > 0) then
			MType = 3
		elseif Input.Left > 0 and not (Input.Up > 0 or Input.Down > 0) then
			MType = 4
		elseif Input.Up > 0 and Input.Right > 0 then
			MType = 5
		elseif Input.Up > 0 and Input.Left > 0 then
			MType = 6
		elseif Input.Down > 0 and Input.Right > 0 then
			MType = 7
		elseif Input.Down > 0 and Input.Left > 0 then
			MType = 8
		end
		if MType == 1 then
			Player.MoveTo(Player.x,Player.y + 2,false)
			if Player.y + 2 >= GetGlobal("height")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx,Player.absy + 1,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 2 then
			Player.MoveTo(Player.x,Player.y - 2,false)
			if Player.y - 2 <= -GetGlobal("height")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx,Player.absy - 1,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 3 then
			Player.MoveTo(Player.x + 2,Player.y,false)
			if Player.x + 2 >= GetGlobal("width")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx + 1,Player.absy,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 4 then
			Player.MoveTo(Player.x - 2,Player.y,false)
			if Player.x - 2 <= -GetGlobal("width")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx - 1,Player.absy,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 5 then
			Player.MoveTo(Player.x + 2,Player.y + 2,false)
			if Player.x + 2 >= GetGlobal("width")/2 and Player.y + 2 >= GetGlobal("height")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx + 1,Player.absy + 1,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 6 then
			Player.MoveTo(Player.x - 2,Player.y + 2,false)
			if Player.x - 2 <= -GetGlobal("width")/2 and Player.y + 2 >= GetGlobal("height")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx - 1,Player.absy + 1,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 7 then
			Player.MoveTo(Player.x + 2,Player.y - 2,false)
			if Player.x + 2 >= GetGlobal("width")/2 and Player.y - 2 <= -GetGlobal("height")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx + 1,Player.absy - 1,false)
				end
				SetGlobal("Moving",true)
			end
		elseif MType == 8 then
			Player.MoveTo(Player.x - 2,Player.y - 2,false)
			if Player.x - 2 <= -GetGlobal("width")/2 and Player.y - 2 <= -GetGlobal("height")/2 then
				SetGlobal("Moving",false)
			else
				if angel ~= nil then
					angel.MoveTo(Player.absx - 1,Player.absy - 1,false)
				end
				SetGlobal("Moving",true)
			end
		end
		if SOUL == nil then
			SOUL = CreateSprite("Heart0","BelowBullet")
			SOUL.color32 = {252, 166, 0}
			SOUL.Scale(3,3)
			SOUL.alpha = 0.1
			Audio.PlaySound("Change")
		elseif SOUL ~= nil then
			if SOUL.isactive == true then
				SOUL.color32 = {252, 166, 0}
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
				SOUL.color32 = {252, 166, 0}
				SOUL.Scale(3,3)
				SOUL.alpha = 0.1
				Audio.PlaySound("Change")
			end
		end
		
		if GetGlobal("WaveTime") > 0 then
			SetGlobal("WaveTime",GetGlobal("WaveTime") - 1)
		else
			SetGlobal("FinishedAtk",true)
			State("ACTIONSELECT")
			MType = 0
			SetGlobal("WaveTime",100)
		end
	elseif FuncStart == true and GetGlobal("SOUL") == 2 then
		Player.SetControlOverride(true)
		if SOUL == nil then
			SOUL = CreateSprite("Heart0","BelowBullet")
			SOUL.color32 = {66, 252, 252}
			SOUL.Scale(3,3)
			SOUL.alpha = 0.1
			Audio.PlaySound("Change")
		elseif SOUL ~= nil then
			if SOUL.isactive == true then
				SOUL.color32 = {66, 252, 252}
				if SOUL.xscale > 1 then
					SOUL.alpha = SOUL.alpha + 0.0225
					SOUL.Scale(SOUL.xscale - 0.05,SOUL.yscale - 0.05)
				end
			else
				SOUL = CreateSprite("Heart0","BelowBullet")
				SOUL.color32 = {66, 252, 252}
				SOUL.Scale(3,3)
				SOUL.alpha = 0.1
				Audio.PlaySound("Change")
			end
		end
		if GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "DIALOGRESULT" then
			SOUL.MoveTo(Player.absx,Player.absy)
		else
			SOUL.MoveTo(99999,99999)
		end
		
		if GetGlobal("WaveTime") > 0 then
			SetGlobal("WaveTime",GetGlobal("WaveTime") - 1)
		else
			SetGlobal("FinishedAtk",true)
			State("ACTIONSELECT")
			SetGlobal("WaveTime",100)
		end
	else
		Player.SetControlOverride(false)
		if SOUL ~= nil then
			if SOUL.isactive == true then
				if GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "DIALOGRESULT" then
					SOUL.MoveTo(Player.absx,Player.absy)
				else
					SOUL.MoveTo(99999,99999)
				end
			end
		end
	end
end
function Reset()
	FuncStart = false
	Player.SetControlOverride(false)
	SetGlobal("Bravory",false)
	SOUL.remove()
end
function NormalSoul()
	SetGlobal("Bravory",false)
	SOUL.remove()
end