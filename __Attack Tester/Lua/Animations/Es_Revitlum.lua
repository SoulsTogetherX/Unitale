sprites1 = {}
sprites2 = {}
sprites3 = {}
Head = CreateSprite("Es RevitlumHead","BelowUI")
Head.Scale(2,2)
Face = CreateSprite("face01","BelowUI")
Face.Scale(2,2)
Face.SetParent(Head)
LHand = CreateSprite("Es RevitlumLHand","BelowUI")
LHand.SetParent(Head)
LHand.Scale(2,2)
RHand = CreateSprite("Es RevitlumRHand","BelowUI")
RHand.SetParent(Head)
RHand.Scale(2,2)
Head.MoveTo(320,320)
A10 = false
A11 = false
Shield = false
ShieldT = 0
R = 0
S = 1
L = 10
U = false
V = 0.4
ab = 0
TIMER = 0
TIMER2 = 0
TIM = 8
R1 = 0
R2 = 0
R3 = 0
R4 = 0
TT = 0
function Animate()
	if enemies[1].GetVar("Shield") == 2 then 
		ShieldT = ShieldT + 1
		if ShieldT == 1 then
			if SP == nil then
				SP = CreateSprite("shield","Top")
				SP.MoveTo(320,285)
				SP.alpha = 0
				SP.Scale(3,3)
			else
				SP.alpha = 0 
			end
		elseif ShieldT == 20 then
			SP.remove()
			SP1 = CreateSprite("ShieldPiece1","Top")
			SP1.MoveTo(166,350)
			SP1.alpha = 0.5
			SP1.Scale(3,3)
			SP2 = CreateSprite("ShieldPiece2","Top")
			SP2.MoveTo(330,367)
			SP2.alpha = 0.5
			SP2.Scale(3,3)
			SP3 = CreateSprite("ShieldPiece3","Top")
			SP3.MoveTo(435,350)
			SP3.alpha = 0.5
			SP3.Scale(3,3)
		elseif ShieldT == 40 then
			SP1.alpha = 0
			SP2.alpha = 0
			SP3.alpha = 0
		elseif ShieldT == 41 then
			SP1.alpha = 0.5
			SP2.alpha = 0.5
			SP3.alpha = 0.5
		elseif ShieldT == 50 then
			SP1.alpha = 0
			SP2.alpha = 0
			SP3.alpha = 0
		elseif ShieldT == 51 then
			SP1.alpha = 0.5
			SP2.alpha = 0.5
			SP3.alpha = 0.5
		elseif ShieldT >= 70 then
			S = S*(51/50)
			R = R + (1/2)
			L = L*(49/50)
			SP1.MoveTo(166 - (ShieldT - 70)*L,350 - S)
			SP1.rotation = -R
			SP1.alpha = SP1.alpha - (1/50)
			SP2.MoveTo(330, 367 + (ShieldT - 70)*10)
			SP2.alpha = SP1.alpha - (1/50)
			SP3.MoveTo(435 + (ShieldT - 70)*L,350 - S)
			SP3.rotation = R
			SP3.alpha = SP1.alpha - (1/50)
		end
		if SP ~= nil then
			if SP.isactive == true and SP.alpha < 0.5 then
				SP.alpha = SP.alpha + 0.1
			end
		end
	elseif enemies[1].GetVar("Shield") == 1 then
		ShieldT = ShieldT + 1
		if ShieldT == 1 then
			if SP == nil then
				SP = CreateSprite("shield","Top")
				SP.MoveTo(320,285)
				SP.alpha = 0
				SP.Scale(3,3)
			else
				SP.alpha = 0 
			end
		end
		if SP ~= nil and ShieldT <= 20 and SP.isactive == true and SP.alpha < 0.5 then
			SP.alpha = SP.alpha + 0.1
		elseif SP ~= nil and ShieldT > 20 and SP.isactive == true and SP.alpha > 0 then
			SP.alpha = SP.alpha - 0.01
		end
		if SP ~= nil and SP.alpha <= 0 and ShieldT > 20 then
			enemies[1].SetVar("Shield",0)
			ShieldT = 0
		end
	end
	if GetGlobal("ChangeS") == true then
		TT = TT + 1
		if TT == 1 then

		elseif TT < 30 then
		end
	end
	if GetGlobal("ATTACKED") == true then
		TIM = TIM - 0.1
		TIMER2 = TIMER2 + 1
		Face.Set("face08")
		Head.MoveToAbs(320+(TIM*math.cos(TIMER2/2)),320)
		if R1 == 0 then
			R1 = (math.random()*2 - 1)*4
		end
		if R2 == 0 then
			R2 = (math.random()*2 - 1)*4
		end
		if R3 == 0 then
			R3 = (math.random()*2 - 1)*4
		end
		if R4 == 0 then
			R4 = (math.random()*2 - 1)*4
		end
		LHand.MoveToAbs(320-(TIM*math.cos(TIMER2/R1)),320 +(TIM*math.cos(TIMER2/R2)))
		RHand.MoveToAbs(320-(TIM*math.cos(TIMER2/R3)),320 -(TIM*math.cos(TIMER2/R4)))
		if TIM <= 0 then
			TIM = 8
			R1 = 0
			R2 = 0
			R3 = 0
			R4 = 0
			TIMER2 = 0
			SetGlobal("ATTACKED",false)
		end
	else
		if GetCurrentState() ~= "ENEMYDIALOGUE" and GetCurrentState() ~= "DEFENDING" and GetCurrentState() ~= "DIALOGRESULT" and U == false then
			TIMER = TIMER + 1
			if GetGlobal("Angel") == false then
				if TIMER%1600 == 0 then
					SetGlobal("Face",1)
				elseif (TIMER-700)%1600 == 0 then
					SetGlobal("Face",4)
				elseif (TIMER-950)%1600 == 0 then
					SetGlobal("Face",3)
				end
			else
				if TIMER%900 == 0 then
					SetGlobal("Face",1)
				elseif (TIMER-800)%900 == 0 then
					SetGlobal("Face",2)
				end
			end
		elseif (GetCurrentState() == "DEFENDING" or GetCurrentState() == "DIALOGRESULT") and U == false then
			SetGlobal("Face",1)
			TIMER = 0
		else
			TIMER = 0
		end
		if GetGlobal("Face") == 1 then
			Face.Set("face01")
		elseif GetGlobal("Face") == 2 then
			Face.Set("face02")
		elseif GetGlobal("Face") == 3 then
			Face.Set("face03")
		elseif GetGlobal("Face") == 4 then
			Face.Set("face04")
		elseif GetGlobal("Face") == 5 then
			Face.Set("face05")
		elseif GetGlobal("Face") == 6 then
			Face.Set("face06")
		elseif GetGlobal("Face") == 7 then
			Face.Set("face07")
		elseif GetGlobal("Face") == 8 then
			Face.Set("face08")
		elseif GetGlobal("Face") == 9 then
			Face.Set("face09")
		elseif GetGlobal("Face") == 10 then
			Face.Set("face10")
		elseif GetGlobal("Face") == 11 then
			Face.Set("face11")
		elseif GetGlobal("Face") == 12 then
			Face.Set("face12")
		end
		if (enemies[1].GetVar("Attack") == 31 or enemies[1].GetVar("Attack") == 32) and GetCurrentState() == "ACTIONSELECT" then
			U = true
		elseif U == true then
			Face.alpha = Face.alpha - 0.01
			LHand1 = CreateSprite("Es RevitlumLHand","BelowUI")
			LHand1.MoveTo(LHand.absx,LHand.absy)
			LHand1.Scale(2,2)
			LHand.remove()
			LHand = LHand1
			RHand1 = CreateSprite("Es RevitlumRHand","BelowUI")
			RHand1.MoveTo(RHand.absx,RHand.absy)
			RHand1.Scale(2,2)
			RHand.remove()
			RHand = RHand1
			if Face.alpha <= 0 then
				V = V*(51/50)
				Head.MoveToAbs(Head.absx + 1,Head.absy - V)
				Head.rotation = Head.rotation - 0.2
				LHand.MoveToAbs(LHand.absx,LHand.absy - (V*1.4))
				LHand.rotation = LHand.rotation + 0.1
				RHand.MoveToAbs(RHand.absx,RHand.absy - (V*1.2))
				RHand.rotation = RHand.rotation - 0.1
			end
			if Head.absy <= -3000 and ab == 0 then
				cover = CreateSprite("Pixel","Top")
				cover.Scale(99999,99999)
				cover.MoveTo(320,255)
				cover.color = {0,0,0}
				ab = 1
			elseif Head.absy <= -20000 and ab == 1 then
				Audio.PlaySound("levelup")
				ab = 2
			elseif Head.absy <= -50000 then
				State("DONE")
			end
		end
		if GetCurrentState() == "DEFENDING" then
			A10 = true
		end
		if A10 == true then
			if U == false then
				Head.MoveTo(320, 320 + 5*math.sin(timer0/60))
				RHand.MoveTo(10*math.cos(timer0/20),10*math.sin(timer0/20))
				LHand.MoveTo(10*math.sin(timer0/20),10*math.cos(timer0/20))
				if timer0%20 == 0 and #sprites1 <= 6 then
					local sprite = CreateSprite("pixel","BelowUI")
					local R = math.random(1,10)
					sprite.Scale(R,R)
					sprite.MoveTo(RHand.absx + ((math.random()*40)-20) + 115,RHand.absy + (math.random()*(-20)) - 70) 
					table.insert(sprites1,sprite)
				end
				if (timer0+10)%20 == 0 and #sprites2 <= 6 then
					local sprite = CreateSprite("pixel","BelowUI")
					local R = math.random(1,10)
					sprite.Scale(R,R)
					sprite.MoveTo(LHand.absx + ((math.random()*40)-20) - 115,LHand.absy + (math.random()*(-20)) - 70)
					table.insert(sprites2,sprite)
				end
				if timer0%30 == 0 and #sprites3 <= 6 then
					local sprite = CreateSprite("pixel","BelowUI")
					local R = math.random(1,10)
					sprite.Scale(R,R)
					sprite.MoveTo(Head.absx + ((math.random()*40)-20),Head.absy + (math.random()*(-20)) - 10) 
					table.insert(sprites3,sprite)
				end
			end
			for i = 1,#sprites1 do
				sprite = sprites1[i]
				if sprite.isactive == true then
					sprite.Move(0,-2)
					sprite.alpha = sprite.alpha - 0.01
					if sprite.alpha <= 0 then
						local R = math.random(1,10)
						sprite.Scale(R,R)
						sprite.MoveTo(RHand.absx + ((math.random()*40)-20) + 115,RHand.absy + (math.random()*(-20)) - 70) 
						sprite.alpha = 1
					end
				end
			end
			for i = 1,#sprites2 do
				sprite = sprites2[i]
				if sprite.isactive == true then
					sprite.Move(0,-2)
					sprite.alpha = sprite.alpha - 0.01
					if sprite.alpha <= 0 then
						local R = math.random(1,10)
						sprite.Scale(R,R)
						sprite.MoveTo(LHand.absx + ((math.random()*40)-20) - 115,LHand.absy + (math.random()*(-20)) - 70)
						sprite.alpha = 1
					end
				end
			end
			for i = 1,#sprites3 do
				sprite = sprites3[i]
				if sprite.isactive == true then
					sprite.Move(0,-2)
					sprite.alpha = sprite.alpha - 0.01
					if sprite.alpha <= 0 then
						local R = math.random(1,10)
						sprite.Scale(R,R)
						sprite.MoveTo(Head.absx + ((math.random()*40)-20),Head.absy + (math.random()*(-20)) - 10) 
						sprite.alpha = 1
					end
				end
			end
		else
			Head.MoveTo(320, 320 + 5*math.sin(timer0/100))
			RHand.MoveTo(0,10*math.sin(timer0/50))
			LHand.MoveTo(0,10*math.cos(timer0/50))
		end
	end
end



