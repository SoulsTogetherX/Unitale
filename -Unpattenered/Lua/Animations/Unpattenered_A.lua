Timer = 0
timer = 0
T = 8
Ti = 0
A = 0
B = 1
C = 1
X = 320
Y = 336
SetGlobal("A",false)
SetGlobal("Face",1)
SetGlobal("DUST",0)
SetGlobal("SPARE",0)
SetGlobal("SpeedFactor",1)
Body = CreateSprite("Body")
Head = CreateSprite("Head0")
--Waist = CreateSprite("Waist")
Legs = CreateSprite("Legs")
Arms = CreateSprite("Arms")

Body.MoveTo(320,336)
Head.MoveTo(320,405)
--Waist.MoveTo(320,336)
Legs.MoveTo(320,336)
Arms.MoveTo(320,336)

Legs.SetParent(Body) 
--Waist.SetParent(Body)  
Arms.SetParent(Body)
Head.SetParent(Body)

--Waist.SendToBottom()
function AnimateUnpat()
	--SetGlobal("Face",math.abs((math.floor(math.cos(Timer/100)*11))))
	Timer = Timer + 1
	if (GetCurrentState() ~= "ENEMYDIALOGUE" and GetGlobal("SPARE") == 0 and GetGlobal("Turn") ~= 27) and enemies[1].GetVar("hp") > 1 then
		if Timer%180 == 0 then
			SetGlobal("Face",0)
		elseif (Timer-150)%180 == 0 then
			SetGlobal("Face",9)
		end
		if B == 1 then
			SetGlobal("Face",0)
			B = 0
		end
	elseif GetGlobal("Turn") == 27 and GetGlobal("attack") <= 0 then
		Head.Set("Head11")
	elseif GetCurrentState() == "ENEMYDIALOGUE" then
		Legs.Scale(1,1)
		B = 1
	end
	if GetGlobal("A") == false and GetGlobal("SPARE") == 0 and enemies[1].GetVar("hp") > 1 then
		Arms.MoveTo(0,0+(3*math.sin((Timer/50)*GetGlobal("SpeedFactor"))))
		Body.MoveTo(322+(2*math.sin((Timer/50)*GetGlobal("SpeedFactor"))),340+(2*math.cos((Timer/50)*GetGlobal("SpeedFactor")))-(4.2+4.2*math.cos(Timer/100)))
		Legs.MoveTo(0-(2*math.sin((Timer/50)*GetGlobal("SpeedFactor"))),0-(2*math.cos((Timer/50)*GetGlobal("SpeedFactor"))))
		--Waist.MoveTo(0-(2*math.sin((Timer/50)*GetGlobal("SpeedFactor"))),0-(2*math.cos((Timer/50)*GetGlobal("SpeedFactor"))))
		Head.MoveTo(0,69+(1.5*math.sin((Timer/50)*(GetGlobal("SpeedFactor")-1))))
		Legs.Scale(1,0.9+(0.05-0.05*math.cos(Timer/100)))
	end
	if GetGlobal("Face") == 0 then
		Head.Set("Head0")
	elseif GetGlobal("Face") == 1 then
		Head.Set("Head1")
	elseif GetGlobal("Face") == 2 then
		Head.Set("Head2")
	elseif GetGlobal("Face") == 3 then
		Head.Set("Head3")
	elseif GetGlobal("Face") == 4 then
		Head.Set("Head4")
	elseif GetGlobal("Face") == 5 then
		Head.Set("Head5")
	elseif GetGlobal("Face") == 6 then
		Head.Set("Head6")
	elseif GetGlobal("Face") == 7 then
		Head.Set("Head7")
	elseif GetGlobal("Face") == 8 then
		Head.Set("Head8")
	elseif GetGlobal("Face") == 9 then
		Head.Set("Head9")
	elseif GetGlobal("Face") == 10 then
		Head.Set("Head10")
	elseif GetGlobal("Face") == 11 then
		Head.Set("Head11")
	end
	if GetGlobal("A") == true then
		T = T - 0.1
		timer = timer + 1
		Head.Set("Head0")
		Arms.MoveTo(0,0)
		Legs.MoveTo(0,0)
		Legs.Scale(1,1)
		--Waist.MoveTo(0,0)
		Body.MoveTo(322+(T*math.cos(timer/2)),340)
		if T <= 0 then
			T = 8
			timer = 0
			SetGlobal("A",false)
		end
	end
	if GetGlobal("SPARE") == 1 then
		Arms.MoveTo(0,0)
		Legs.MoveTo(0,0)
		--Waist.MoveTo(0,0)
		Body.MoveTo(322,340)
		Arms.Set("Spare0")
		Body.Set("Spare1")
		Head.Set("Spare2")
		Legs.Scale(1,1)
		--Waist.Set("Spare3")
		Legs.Set("Spare4")
	end
	if GetGlobal("DUST") == 1 and A == 0 then
		Head.Dust(playDust == true, removeObject == true)
		Body.Dust(playDust == true, removeObject == true)
		Arms.Dust(playDust == true, removeObject == true)
		--Waist.Dust(playDust == true, removeObject == true)
		Legs.Scale(1,1)
		Legs.Dust(playDust == true, removeObject == true)
		A = 1
	end
	if enemies[1].GetVar("hp") == 1 then 
		if C == 1 then
			Cross = CreateSprite("Cross")
			Cross.SetPivot(0.5, 0.5)
			Cross.MoveTo(X,Y)
			Body.Set("Body2")
			C = 0
		end
		Ti = Ti - 1
		if Ti <= -20 then
			B = -1
		end
		if C == 0 then
			Y = Y - (0.1*((Ti/5)*B))
			Cross.MoveTo(X,Y)
			Cross.rotation = math.abs(Ti)+20
		end
		if Cross.y <= 100 then
			Cross.Set("Blank")
			SetGlobal("Z",0)
		end
		--Cross.sprite.rotation = Ti/40
	end
end