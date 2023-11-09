timer = 0
timer2 = 0
T = 8
SetGlobal("Face",1)
SetGlobal("Spare",false)
SetGlobal("Death",false)
SetGlobal("STOP",false)
SetGlobal("A",false)
Legs = CreateSprite("Legs")
Legs.MoveTo(320,300)
Legs.Scale(2,2)

Face = CreateSprite("Head1")
Face.SetParent(Legs)
Face.MoveTo(0,0)
Face.Scale(2,2)

AJR = CreateSprite("ArmJointRight")
AJR.SetParent(Face)
AJR.MoveTo(0,0)
AJR.Scale(2,2)

HandRight = CreateSprite("HandRight")
HandRight.SetParent(AJR)
HandRight.MoveTo(0,0)
HandRight.Scale(2,2)

AJL = CreateSprite("ArmJointLeft")
AJL.SetParent(Face)
AJL.MoveTo(0,0)
AJL.Scale(2,2)

HandLeft = CreateSprite("HandLeft")
HandLeft.SetParent(AJL)
HandLeft.MoveTo(0,0)
HandLeft.Scale(2,2)

function Animate()
	timer = timer + 1
	if GetGlobal("STOP") == false then
		Legs.Scale(2,1.2+(0.8*math.abs(math.cos(timer/120))))
		Legs.MoveTo(320,290+(0.8*math.abs(math.cos(timer/120)))*4)
		AJR.MoveTo(0 + math.cos(timer/60),0 + math.cos(timer/60))
		HandRight.MoveTo(0 - math.cos(timer/60),0 - math.cos(timer/60))
		HandRight.rotation = -2.5 * math.cos(timer/60)
		AJL.MoveTo(0 - math.cos(timer/60),0 + math.cos(timer/60))
		HandLeft.MoveTo(0 + math.cos(timer/60),0 - math.cos(timer/60))
		HandLeft.rotation = 2.5 * math.cos(timer/60)
	end
	if GetGlobal("Face") == 1 then
		Face.Set("Head1")
	elseif GetGlobal("Face") == 2 then
		Face.Set("Head2")
	elseif GetGlobal("Face") == 3 then
		Face.Set("Head3")
	elseif GetGlobal("Face") == 4 then
		Face.Set("Head4")
	elseif GetGlobal("Face") == 5 then
		Face.Set("Head5")
	elseif GetGlobal("Face") == 6 then
		Face.Set("Head6")
	elseif GetGlobal("Face") == 7 then
		Face.Set("Head7")
	end
	if GetCurrentState() ~= "ENEMYDIALOGUE" and GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "DIALOGRESULT" and GetGlobal("STOP") == false then
		SetGlobal("Face",1)
	end
	if GetGlobal("A") == true then
		T = T - 0.1
		SetGlobal("Face",5)
		timer2 = timer2 + 1
		Legs.MoveTo(320+(T*math.cos(timer2/2)),Legs.y)
		if T <= 0 then
			T = 8
			timer2 = 0
			SetGlobal("A",false)
		end
	end
	if GetGlobal("Spare") == true and GetCurrentState() ~= "ENEMYDIALOGUE" then
		SetGlobal("STOP",true)
		AJR.Set("S1")
		HandLeft.Set("S2")
		HandRight.Set("S3")
		AJL.Set("S4")
		Face.Set("S5")
		Legs.Set("S6")
	end
	if GetGlobal("Death") == true and GetCurrentState() ~= "ENEMYDIALOGUE" then
		SetGlobal("STOP",true)
		AJR.MoveTo(0,0)
		HandLeft.MoveTo(0,0)
		HandLeft.rotation = 0
		HandRight.MoveTo(0,0)
		HandRight.rotation = 0
		AJL.MoveTo(0,0)
		Face.MoveTo(0,0)
		Legs.MoveTo(320,300)
		Legs.Scale(2,2)
		SetGlobal("Death",1)
	elseif GetGlobal("Death") == 1 and GetCurrentState() ~= "ENEMYDIALOGUE" and GetCurrentState() ~= "ATTACKING" then
		AJR.Dust(true, false)
		HandLeft.Dust(true, false)
		HandRight.Dust(true, false)
		AJL.Dust(true, false)
		Face.Dust(true, false)
		Legs.Dust(true, false)
		SetGlobal("Death",false)
	end
end



