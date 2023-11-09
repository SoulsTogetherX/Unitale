enemies[1].SetVar("MoveScreen", false)
timer = 0
timer2 = 0
timer3 = 0
timer4 = 0
timer5 = 0
tim = 0
T = 8
a = false
S = false
SetGlobal("SPARE",false)

Push = CreateSprite("Push", "BelowArena")
Arms = CreateSprite("Arms", "BelowArena")
Legs = CreateSprite("Legs", "BelowArena")
Body = CreateSprite("Body", "BelowArena")
Head = CreateSprite("WronskianHead1", "BelowArena")
Head.Scale(2,2)
Screen = CreateSprite("ScreenBlank", "BelowArena")
ScreenB = CreateSprite("ScreenBorders", "BelowArena")
ScreenT = CreateSprite("ScreenText1", "BelowArena")
ShieldB = CreateSprite("Shield1", "BelowArena")
Shield = CreateSprite("Shield2", "BelowArena")

Arms.SetParent(Body)
Arms.MoveTo(0, 0)
Legs.SetParent(Body)
Legs.MoveTo(0, 0)
Body.MoveTo(320, 320)
Head.MoveTo(320, 320)
Head.SetParent(Body)
Push.MoveTo(320, 320)

ShieldB.MoveTo(320, 1000)
ShieldB.Scale(2,2)
Shield.MoveTo(320, 1000)
Shield.SetParent(ShieldB)
Shield.Scale(2,2)
Shield.alpha = 0.2

ScreenB.MoveTo(380, 350)
ScreenB.Scale(3,3)
Screen.MoveTo(380, 350)
Screen.Scale(3,3)
Screen.alpha = 0.5
Screen.SetParent(ScreenB)
ScreenT.MoveTo(380, 350)
ScreenT.Scale(3,3)
ScreenT.SetAnimation({"ScreenText1", "ScreenText2", "ScreenText3","ScreenText4"},1)
ScreenT.SetParent(ScreenB)
Sca = 0.1
ShieldB.Scale(Sca,Sca)
Shield.Scale(Sca,Sca)
Turn = 0
SetGlobal("A",false)

function Animate()
	timer = timer + 1
	if GetGlobal("SPARE") == true and GetCurrentState() == "ACTIONSELECT" then
		Arms.Set("S1")
		Body.Set("S2")
		Head.Set("S3")
		Head.Scale(1,1)
		Legs.Set("S4")
		Push.remove()
		S = true
		enemies[1].SetVar("currentdialogue", {"[func:Spare][next]"})
		State("ENEMYDIALOGUE")
	elseif GetGlobal("KILL") == true and GetCurrentState() == "ACTIONSELECT" then
		Arms.Dust(true, false)
		Body.Dust(true, false)
		Head.Dust(true, false)
		Legs.Dust(true, false)
		if Push.isactive == true then
			Push.remove()
		end
		S = true
		enemies[1].SetVar("currentdialogue", {"[func:Kill][next]"})
		State("ENEMYDIALOGUE")
	elseif S == false then
		if GetGlobal("KILL") == true then
			Body.Set("G1")
			Body.Scale(2,2)
			Arms.Set("G2")
			Arms.Scale(2,2)
			if Push.isactive == true then
				Push.remove()
			end
		end
		if GetGlobal("Face") == 1 then
			Head.Set("WronskianHead1")
		elseif GetGlobal("Face") == 2 then
			Head.Set("WronskianHead2")
		elseif GetGlobal("Face") == 3 then
			Head.Set("WronskianHead3")
		elseif GetGlobal("Face") == 4 then
			Head.Set("WronskianHead4")
		elseif GetGlobal("Face") == 5 then
			Head.Set("WronskianHead5")
		elseif GetGlobal("Face") == 6 then
			Head.Set("WronskianHead6")
		elseif GetGlobal("Face") == 7 then
			Head.Set("WronskianHead7")
		elseif GetGlobal("Face") == 8 then
			Head.Set("WronskianHead8")
		elseif GetGlobal("Face") == 9 then
			Head.Set("WronskianHead9")
		elseif GetGlobal("Face") == 10 then
			Head.Set("WronskianHead10")
		elseif GetGlobal("Face") == 11 then
			Head.Set("WronskianHead11")
		elseif GetGlobal("Face") == 12 then
			Head.Set("WronskianHead12")
		end
		if enemies[1].GetVar("MoveScreen") == false then
			SetGlobal("Face",7)
		end
		if GetCurrentState() ~= "ENEMYDIALOGUE" then
			SetGlobal("Face",1)
		end
		if GetGlobal("A") == true then
			timer3 = timer3 + 1
			if enemies[1].GetVar("Shield") ~= true or enemies[1].GetVar("ShieldDown") == true then
				T = T - 0.1
				timer5 = timer5 + 1
				Body.MoveTo(320+(T*math.cos(timer/2)),325)
				Arms.MoveTo(0,2.5)
				Head.Set("WronskianHead6")
				if T <= 0 then
					T = 8
					timer5 = 0
					timer3 = 0
					timer = 0
					SetGlobal("A",false)
				end
			else
				if Shield.isactive == true then
					Shield.alpha = 0.2 + (0.75*math.cos(timer3/50))
				end
				if timer3 >= 80 then
					if Shield.isactive == true then
						Shield.alpha = 0.2
					end
					timer = 0
					timer3 = 0
					timer5 = 0
					SetGlobal("A",false)
				end
			end
		elseif enemies[1].GetVar("Attack") ~= 27 then
			Body.MoveTo(320, 320 + (5*math.cos(timer/50)))
			Arms.MoveTo(0, (2.5*math.cos(timer/50)))
		else
			if timer%4 == 0 and GetGlobal("SPARE") ~= true then
				Body.MoveTo(320 + (2*math.random()), 320 + (2*math.random()))
			end
		end
		if (GetCurrentState() == "ACTIONSELECT" or GetCurrentState() == "DEFENDING") and Turn ~= 0 then
			enemies[1].SetVar("MoveScreen", true)
		end
		
		if timer%80 == 0 then
			tim = timer
		end
		if Push.isactive == true then
			Push.MoveTo(320,300 + (55*math.cos((timer - tim)/40)))
		end
		if enemies[1].GetVar("MoveScreen") == true and ScreenB.absx < 800 then
			timer2 = timer2 + 1
		elseif enemies[1].GetVar("MoveScreen") == false and ScreenB.absx >= 350 and timer2 >= 0 then
			timer2 = timer2 - 1
		end
		ScreenB.MoveTo(380 + math.abs(timer2)^1.5, 350)
		if enemies[1].GetVar("MoveScreen") == false and GetCurrentState() == "ACTIONSELECT" and Turn == 0 and Skip == false then
			enemies[1].SetVar("MoveScreen", true)
			enemies[1].SetVar('currentdialogue', {"[effect:none]Alright[w:5], human.","[effect:none][func:Face9]It seems that you\nhave stepped into\nmy domain.","[effect:none][func:Face12]Not surprising seeing\nall those traps I put\nup.","[effect:none][func:Face9]And the removal of\nall other exits but\nthis one...","[effect:none][func:Face1]AND[w:20] the huge sign\nthat reads, 'Exit[w:10],' I\nput up.","[effect:none]Honestly[w:10],[func:Face11] what kept\nyou?","[effect:none][func:Face1]Mhm...[w:20] That hardly\nmatters.","[effect:none]I have been\ncontracted to kill\nyou.","[effect:none][func:Face9]And then properly\ngive your SOUL to\nAsgore.","[effect:none][func:Face12]'The only person\nthat should have\nthat power.'","[effect:none][func:Face1]So[w:10], human...","[effect:none]I know you are not\nfond of dying.","[effect:none][func:Face12]But this must be\ndone.","[effect:none][func:Face9]If you stay still[w:10],[func:Face1] I\ncan promise a quick\ndeath.","[effect:none]I hope you\nunderstand...","[effect:none]But[w:10], you have been\nmarked[w:5], 'ELIMINATED'"})
			State("ENEMYDIALOGUE")
		elseif enemies[1].GetVar("MoveScreen") == false and GetCurrentState() == "ACTIONSELECT" and Turn == 0 and Skip == true then
			enemies[1].SetVar("MoveScreen", true)
			enemies[1].SetVar('currentdialogue', {"[effect:none]You're dead."})
			State("ENEMYDIALOGUE")
		end
		if enemies[1].GetVar("ShieldDown") == true then
			timer4 = timer4 + 1
			if a == false then
				ShieldBreak1 = CreateSprite("ShieldBreak1", "BelowArena")
				ShieldBreak2 = CreateSprite("ShieldBreak2", "BelowArena")
				ShieldBreak1.MoveTo(ShieldB.x,ShieldB.y)
				ShieldBreak2.MoveTo(ShieldB.x,ShieldB.y)
				ShieldBreak1.Scale(2,2)
				ShieldBreak2.Scale(2,2)
				ShieldB.remove()
				Shield.remove()
				Audio.Pause() 
				a = true
			end
			if timer4 >= 50 then
				if timer4 == 50 then
					Audio.PlaySound("Break1") 
				end
				ShieldBreak1.rotation = 0 - ((timer4 - 50)/3)
				ShieldBreak1.MoveTo(ShieldBreak1.x + 1.5, ShieldBreak1.y - 2.5)
				ShieldBreak2.rotation = 0 + ((timer4 - 50)/3)
				ShieldBreak2.MoveTo(ShieldBreak2.x - 1.5, ShieldBreak2.y - 2.5)
			elseif timer4 <= 20 then
				ShieldBreak1.MoveTo(ShieldBreak1.x + (timer4/15), ShieldBreak1.y + (timer4/40))
				ShieldBreak2.MoveTo(ShieldBreak2.x - (timer4/15), ShieldBreak2.y - (timer4/40))
				if timer4 == 1 then
					Audio.PlaySound("00002a19") 
				end
			end
		end
		if enemies[1].GetVar("Shield") == true and ShieldB.isactive == true then
			if enemies[1].GetVar("AttackKill") == true and Sca > 0 then
				Sca = Sca - 0.1
			elseif enemies[1].GetVar("AttackKill") == true and Sca == 0 then
				Shield.remove()
				ShieldB.remove()
			elseif Sca < 2 then
				Sca = Sca + 0.1
			end
			ShieldB.MoveTo(320, 350)
			ShieldB.Scale(Sca,Sca)
			Shield.Scale(Sca,Sca)
		end
	end
end

