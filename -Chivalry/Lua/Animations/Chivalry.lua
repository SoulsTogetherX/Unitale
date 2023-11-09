timer4 = 0
timer3 = 0
timer2 = 0
timer = 0
tim = 0
T = 8
a = 0
G = 0
X = 0.01
X2 = 320
Y = 2
Y2 = 380
Z1 = 0
Z2 = 0
V1 = 0
V2 = 0
D = 0
P = false
G = false
SetGlobal("Sweat",0)
SetGlobal("DEAD",false)
Body = CreateSprite("Chivalry_Body")
Body.MoveTo(320,280)
Body.Scale(3,3)

Push = CreateSprite("Wave")
Push.MoveTo(Body.x,Body.y + 33)
Push.Scale(3,3)
Push.SendToBottom()

Head = CreateSprite("Head1")
Head.MoveTo(Body.x,Body.y + 100)
Head.Scale(3,3)
Head.SetParent(Body)

Hand = CreateSprite("Hand2")
Hand.MoveTo(360,320)
Hand.Scale(2,2)

Sword = CreateSprite("Sword")
Sword.MoveTo(Hand.x,Hand.y + 6)
Sword.Scale(1,1)
Sword.rotation = 90 + Hand.rotation 
Sword.SetPivot(0.5, 0.1)
Sword.SetParent(Hand)

Hand2 = CreateSprite("Hand3")
Hand2.MoveTo(Hand.x,Hand.y)
Hand2.Scale(2,2)
Hand2.rotation = Hand.rotation 
Hand2.SetParent(Hand)

Hand3 = CreateSprite("Hand1")
Hand3.MoveTo(280,320)
Hand3.Scale(2,2)

Hand.rotation = -90

SetGlobal("A",false) 
SetGlobal("B",false) 

function Animate()
	timer = timer + 1
	if GetGlobal("SPARE") ~= true then
		if GetCurrentState() == "ENEMYDIALOGUE" then
			if GetGlobal("Face") == 1 then
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
			end
		end
		if GetCurrentState() ~= "DEFENDING" and Player.sprite.color32 ~= {0, 60, 255} then
			Player.sprite.color32 = {255, 0, 0}
		end
		if GetGlobal("DEAD") == false then
			if enemies[1].GetVar("Mad1") == true and GetCurrentState() == "ENEMYDIALOGUE" then
				enemies[1].SetVar("Mad", true)
				enemies[1].SetVar("Mad1", false)
			end
			if GetGlobal("Sweat") == 1 and D == 0 then
				Sweat = CreateSprite("Sweat1")
				Sweat.MoveTo(Head.absx,Head.absy)
				Sweat.Scale(3,3)
				Sweat.SetParent(Head)
				D = 1
			elseif GetGlobal("Sweat") == 2 then
				Sweat.Set("Sweat2")
			elseif GetGlobal("Sweat") == 3 then
				Sweat.Set("Sweat3")
			elseif GetGlobal("Sweat") == 4 then
				enemies[1].SetVar("comments",{"..."})
				enemies[1].SetVar("commands",{"Check"})
				enemies[1].SetVar("canspare",true)
				if Sweat.isactive == true then
					Sweat.remove()
				end
			end
			if GetGlobal("GenEnd") == false then
				if GetCurrentState() ~= "ENEMYDIALOGUE" then
					if enemies[1].GetVar("HasSword") == true then
						Head.Set("Head1")
					elseif enemies[1].GetVar("HasSword") == false and enemies[1].GetVar("Mad") == false then
						Head.Set("Head2")
					elseif enemies[1].GetVar("HasSword") == false and enemies[1].GetVar("Mad") == true then
						Head.Set("Head4")
					end
				end
				if GetGlobal("A") == false and GetGlobal("B") == false then
					if enemies[1].GetVar("HasSword") == true then
						timer2 = timer2 + 1
						if a == 1 then
							if timer2 == 1 then
								Sword.alpha = 1
								Sword.rotation = 0
								Hand.rotation = -90
								Sword.MoveTo(4000,-4000)
							end
							if timer2 > 10 and timer2 < 120 then
								Hand.MoveTo(2 + Hand.absx, -3 + Hand.absy)
							elseif timer2 <= 190 and timer2 >= 120 then
								Hand.MoveTo((-3 * (timer2 - 100)) + 630, (4 * (timer2 - 100)) - 40)
								Sword.MoveTo(0,0)
								Hand.Set("Hand2")
								Hand2.alpha = 1
								Hand.rotation = -90
								Sword.rotation = 0
							end
							if timer2 > 190 then
								Hand.rotation = -110 + 20*math.cos(timer/80)
								Hand.MoveTo(360,320 + (2*math.cos(timer/40)))
							end
						else
							Hand.rotation = -110 + 20*math.cos(timer/80)
							Hand.MoveTo(360,320 + (2*math.cos(timer/40)))
						end
					end
					Push.MoveTo(320,280 + 60 - (40*math.cos((timer - tim)/40)))
					if timer%80 == 0 then
						tim = timer
					end
					if enemies[1].GetVar("HasSword") == false then
						timer2 = 0
						Hand.rotation = -5*math.cos(timer/100)
						Hand.MoveTo(360,320 + (5*math.cos(timer/40)))
						Hand.Set("Hand1")
						Sword.alpha = 0
						Hand2.alpha = 0
						a = 1
					end
					Head.MoveTo(0,100 + (10*math.cos(timer/40)))
					Hand3.rotation = 5*math.cos(timer/100)
					Hand3.MoveTo(280,320 + (5*math.cos(timer/40)))
				end
				if GetGlobal("A") == true then
					T = T - 0.1
					timer3 = timer3 + 1
					Body.MoveTo(320+(T*math.cos(timer3/2)),280)
					Head.MoveTo(0-(T*math.cos(timer3/2)),100 + (10*math.cos(timer/40)))
					Push.MoveTo(320,280 + 60 - (40*math.cos((timer - tim)/40)))
					Hand3.rotation = 5*math.cos(timer/100)
					Hand3.MoveTo(280,320 + (5*math.cos(timer/40)))
					if timer%80 == 0 then
						tim = timer
					end
					if T <= 0 then
						T = 8
						timer3 = 0
						SetGlobal("A",false)
					end
				end
				if GetGlobal("B") == true then
					timer3 = timer3 + 1
					if timer3 == 1 then
						Hand.rotation = math.random(-20,70)
						Hand.SendToTop()
					end
					Head.Set("Head1")
					Head.MoveTo(0,100 + (10*math.cos(timer/40)))
					Push.MoveTo(320,280 + 60 - (40*math.cos((timer - tim)/40)))
					Hand3.rotation = 5*math.cos(timer/100)
					Hand3.MoveTo(280,320 + (5*math.cos(timer/40)))
					if timer3 >= 104 then
						timer3 = 0
						SetGlobal("B",false)
					end
				end
			end
		elseif GetCurrentState() ~= "ENEMYDIALOGUE" then
			timer3 = timer3 + 1
			State("ACTIONSELECT")
			if G == false then
				Head.Dust(playDust == true, removeObject == false)
				G = true
			end
			if timer3 >= 200 then
				State("DONE")
			end
		else
			timer3 = 0
		end
	end
end



