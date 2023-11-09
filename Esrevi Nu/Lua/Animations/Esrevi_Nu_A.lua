timer = 0
timer2 = 0
timer3 = 0
timer4 = 0
timer5 = 0
T = 8
I = 1
Speedy = 0
Speedx = 0
Block.SetVar('xspeed', 0)
Block.SetVar('yspeed', 0)
SetGlobal("Animate",false)
SetGlobal("Break",false)
SetGlobal("KILL",false)
SetGlobal("DONE",false)
SetGlobal("DEFENDING",false)
SetGlobal("REMOVE",false)
SetGlobal("Face",1)
SetGlobal("Rage1", false)
SetGlobal("Hurt",false)
F = 1
Sound = false

function Animate()
	if GetGlobal("A") == false then
		timer = timer + 1
	end
	if GetGlobal("Rage1") == true and GetGlobal("Hurt") == false and F != 9 then
		if Head.currentframe == 105 and Sound == false then
			Audio.PlaySound("RedFlash")
			Sound = true
		end
		SetGlobal("Face",5)
	elseif GetGlobal("Hurt") == true then
		SetGlobal("Face",1)
		Body.Set("B_11")
		SetGlobal("Hurt",false)
	elseif GetCurrentState() ~= "ENEMYDIALOGUE" and GetGlobal("KILL") == false then
		SetGlobal("Face",F)
	end
	if GetGlobal("Animate") == true and GetGlobal("A") == false then
		Body.yscale = 1 - math.abs(math.cos(timer/200)/10)
		Body.MoveTo(320,(340 - 10*math.abs(math.cos(timer/200))))
		Head.MoveTo(1*math.cos(timer/100), -5*math.abs(math.cos(timer/200)))
	end
	BY = Body.yscale
	if GetGlobal("Charge") == true and Head.GetVar("Animation") == false then
		Body.SetAnimation({"B_1","B_1","B_2","B_2","B_3","B_3","B_4","B_4","B_5","B_5","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_6","B_7","B_8","B_9","B_10","B_9","B_1"},(1/24))
		Body.loopmode = "ONESHOT"
		Head.SetAnimation({"H_1","H_2","H_3","H_4","H_5","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_6","H_5","H_4","H_3","H_2","H_1"},(1/12))
		Head.loopmode = "ONESHOT"
		Head.MoveTo(0,0)
		Head.SetVar("Animation",true)
	end
	if GetGlobal("Rage") == true and Head.GetVar("Animation") == false then
		Head.SetAnimation({"R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_1","R_2","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_3","R_4","R_5","R_6","R_7","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_8","R_9","R_10","R_11","R_12","R_13","R_14","R_15","R_16"},(1/12))
		Head.loopmode = "ONESHOT"
		Head.MoveTo(0,0)
		SetGlobal("Rage1", true)
		Head.SetVar("Animation",true)
	end
	if Head.GetVar("Animation") == true then
		if Head.animcomplete == true then
			Head.SetVar("Animation",false)
			SetGlobal("Charge",false)
			SetGlobal("Rage", false)
			SetGlobal("Animate",true)
			timer = math.pi*100
		end
		if Body.currentframe >= 11 and Body.currentframe <= 40 then
			if timer%6 == 0 then
				Body.MoveTo(320 + ((math.random()-0.5)*2), 340)
			end
		end
	end
	if enemies[1].GetVar("Attack") >= 1 and GetCurrentState() == "ATTACKING" and Block.isactive == true and GetGlobal("Spare") == false then
		local xdifference = 320 - Block.x
		local ydifference = 340 - Block.y
		local xspeed = Block.GetVar('xspeed') / 2 + xdifference / 10
		local yspeed = Block.GetVar('yspeed') / 2 + ydifference / 10
		Block.MoveTo(Block.x + xspeed, Block.y + yspeed)
		Block.SetVar('xspeed', xspeed)
		Block.SetVar('yspeed', yspeed)
		if Block.xscale < 5 then
			Block.xscale = Block.xscale + 0.1
		end
		if Block.yscale < 5 then
			Block.yscale = Block.yscale + 0.1
		end
	elseif enemies[1].GetVar("Attack") >= 1 and (GetCurrentState() == "ENEMYDIALOGUE" or GetCurrentState() == "DEFENDING") and GetGlobal("A") == false and Block.isactive == true and GetGlobal("Spare") == false then
		timer2 = timer2 + 1
		if timer2 >= 20 and timer2 < 80 then
			local xdifference = 440 - Block.x
			local ydifference = 420 - Block.y
			local xspeed = Block.GetVar('xspeed') / 2 + xdifference / 100
			local yspeed = Block.GetVar('yspeed') / 2 + ydifference / 100
			Block.MoveTo(Block.x + xspeed, Block.y + yspeed)
			Block.SetVar('xspeed', xspeed)
			Block.SetVar('yspeed', yspeed)
			if Block.xscale > 3 then
				Block.xscale = Block.xscale - 0.1
			end
			if Block.yscale > 3 then
				Block.yscale = Block.yscale - 0.1
			end
		elseif timer2 >= 80 then
			timer2 = 0
			Block.MoveTo(Block.x,Block.y-(0.1*math.cos((timer2-80)/200)))
		end
	end
	if GetGlobal("REMOVE") == true then
		enemies[1].SetVar("def",-999999)
		enemies[1].SetVar("commands",{"Check"})
		enemies[1].SetVar("comments",{"..."})
		if Block.isactive == true then
			Block.remove()
		end
	end
	if GetGlobal("Break") == true then
		if Block.isactive == true then
			Audio.PlaySound("Break1")
			B1 = CreateSprite("Shield3")
			B1.MoveTo(Block.x,Block.y)
			B1.Scale(5,5)
			B2 = CreateSprite("Shield4")
			B2.MoveTo(Block.x,Block.y)
			B2.Scale(5,5) 
			Block.remove()
		end
		timer4 = timer4 + 1
		if timer4 > 20 then
			Speedy = Speedy + 0.05
			Speedx = Speedx + 0.01
			B1.MoveTo(B1.x + Speedx, B1.y - Speedy)
			B2.MoveTo(B2.x - Speedx, B2.y - Speedy)
		end
	end
	if GetGlobal("A") == true and Block.isactive == true and GetGlobal("Spare") == false then
		T = T - 0.1
		timer3 = timer3 + 1
		Body.yscale = 1 - math.abs(math.cos(timer/200)/10)
		Body.MoveTo(320,(340 - 10*math.abs(math.cos(timer/200))))
		Head.MoveTo(1*math.cos(timer/100), -5*math.abs(math.cos(timer/200)))
		Block.MoveTo(322+(T*math.cos(timer/2)),340)
		if T <= 0 then
			T = 8
			timer3 = 0
			timer2 = 0
			SetGlobal("A",false)
		end
	elseif GetGlobal("A") == true then
		T = T - 0.1
		timer3 = timer3 + 1
		Head.MoveTo(0,0)
		Body.yscale = 1
		Body.MoveTo(320+(T*math.cos(timer/2)),340)
		if T <= 0 then
			T = 8
			timer3 = 0
			timer2 = 0
			SetGlobal("A",false)
		end
	end
	if Head.GetVar("Animation") == false then 
		if GetGlobal("Face") == 1 and GetGlobal("Blank2") == 99 then
			Head.Set("Face1_2")
		elseif GetGlobal("Face") == 1 then
			Head.Set("Face1")
		elseif GetGlobal("Face") == 2 and GetGlobal("Blank2") == 99 then
			Head.Set("Face2_2")
		elseif GetGlobal("Face") == 2 then
			Head.Set("Face2")
		elseif GetGlobal("Face") == 3 and GetGlobal("Blank2") == 99 then
			Head.Set("Face3_2")
		elseif GetGlobal("Face") == 3 then
			Head.Set("Face3")
		elseif GetGlobal("Face") == 4 and GetGlobal("Blank2") == 99 then
			Head.Set("Face4_2")
		elseif GetGlobal("Face") == 4 then
			Head.Set("Face4")
		elseif GetGlobal("Face") == 5 and GetGlobal("Blank2") == 99 then
			Head.Set("Face5_2")
		elseif GetGlobal("Face") == 5 then
			Head.Set("Face5")
		elseif GetGlobal("Face") == 6 and GetGlobal("Blank2") == 99 then
			Head.Set("Face6_2")
		elseif GetGlobal("Face") == 6 then
			Head.Set("Face6")
		elseif GetGlobal("Face") == 7 and GetGlobal("Blank2") == 99 then
			Head.Set("Face7_2")
		elseif GetGlobal("Face") == 7 then
			Head.Set("Face7")
		elseif GetGlobal("Face") == 8 and GetGlobal("Blank2") == 99 then
			Head.Set("Face8_2")
		elseif GetGlobal("Face") == 8 then
			Head.Set("Face8")
		end
	end

	
	if GetGlobal("KILL") == true then
		timer5 = timer5 + 1
		for i=1,#bg do
			local b = bg[i]
			if b.isactive == true then
				b.remove()
			end
		end
		for i=1,#Stars do
			local b = Stars[i]
			if b.isactive == true then
				b.remove()
			end
		end
		F = 4
		if timer5 == 1 then
			Head.Set("Face4")
			Audio.PlaySound("enemydust")
			Head.Dust(playDust == true, removeObject == false)
			Body.Dust(playDust == true, removeObject == false)
		end
		if timer5 > 2 then
			Head.alpha = (30 - timer5)/30
			SetGlobal("DEFENDING",true)
		end
		if timer5 > 100 then
			SetGlobal("DEFENDING",true)
			if timer5%4 == 0 then
				if I <= #Starz then
					Star = Starz[I]
					if Star.isactive == true then
						Star.Dust(playDust == true, removeObject == false)
						I = I + 1
					end
				end
			end
		end
		if timer5 == 650 then
			Black = CreateSprite("Pixel","BelowPlayer")
			Black.MoveTo(320,340)
			Black.Scale(1000, 1000)
			Black.color = {0.0, 0.0, 0.0}
			Black.alpha = 0
			SetGlobal("Last_attack",false)
		elseif timer5 > 650 then
			Black.alpha = Black.alpha + 1/150
			if timer5 == 900 then
				Black = CreateSprite("Pixel","Top")
				Black.MoveTo(320,340)
				Black.Scale(1000, 1000)
				Black.color = {0.0, 0.0, 0.0}
				Audio.PlaySound("Speck")
			elseif timer5 > 950 then
				SetGlobal("DONE",true)
			end
		end
	end
end