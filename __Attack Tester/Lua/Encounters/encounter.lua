-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "Poseur strikes a pose!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"Test"}
wavetimer = 99999
arenasize = {155, 130}
X = -100
timer0 = 0
timer = 117
timer2 = 0
timer3 = 0
timer4 = 0
Shoot = false
flee = false
At = false
Infintes = {}
Stars = {}
Stars2 = {}
hearts = {}
Starz = {}
bg = {}
bullets = {}
bullets2 = {}
Buttons = {}
Beams = {}
StarFollow = {}
SetGlobal("StarFalls",false)
SetGlobal("BaseDam",15)
SetGlobal("Hand",false)
Mercy = false
SetGlobal("FinishedAtk",false)
Comment1 = 0
names = {"Secret","Edd","Rhenao","XRay","Stevonnie","Papyro","Sanssssss","Gastery","Magic","Betty","UFSans","Player","IAmYou","Clover","Floooower","Anime","GZTale","Error","Garnet","Stronger","Red","GenoSans","Character","SwapTale","MTT","METTATON","Starco","Jarco","Genocide","Pacifist","Mercy","Murder","AAAAAA","Sam","Billy","PEWDZ","Blaghh","Bitty","DokieDCL","Stardew","Sail","Zeus","Death","Life","Sally","Havier","June","Eleven","El","Cross","Floowey","DDLC","SU","Gravity","GravFalls","Agua","Flame","Shark","Ruby","Rwby","Yang","Blake","Weiss","Arkos","JauneArc","Pyrrha","Cinder","Salem","Crow","Raven","Penny","Ozpin","TDI","Touhou","Sakuya","Cirno","Yukari","Rumia","Reimu","Marisa","Bill","Cipher","Soos"}
SetGlobal("META",0)
SetGlobal("ChangeS",false)
A = 0
NM = 0
NumberN = 1
NumberM = 1
NumberO = 0
Gravity = 1.5
enemies = {
"Es Revitlum"
}
enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
Debug = {"Final"}
possible_attacks = {"StartAttack","StarStrike","ClosedSpace","StarStrike","CometSpread","StarStriker","FiretheFire","StarStriker","PlanetOrbit","CometSpread","3DGalaxy","StarStrike","FiretheFire","CometSpread","StarStriker","SideStar"}
ATTACK1 = {"StarStrike","CometSpread","StarStriker","FiretheFire","PlanetOrbit","3DGalaxy"}
possible_attacks2 = {"SideStar","StarSpar","SpaceFight","StarSpar","CometBlaze","SpaceFight","SideStar","ReflectiveMurder","CometBlaze","SideStar","SpaceFight","StarSpar","ReflectiveMurder","CometBlaze"}
ATTACK2 = {"ReflectiveMurder","SpaceFight","StarSpar","CometBlaze","SideStar"}

function Update()
	FPS()
	Animate()
	timer0 = timer0 + 1
	SetGlobal("Starsz",Starz)
	if GetGlobal("DEBUG") == true then
		--possible_attacks = Debug
	end
	if GetGlobal("ChangeS") == true then
		for i=1, #Starz do
			S = Starz[i]
			if S.isactive == true then
				S.remove()
			end
		end
	end
	if (enemies[1].GetVar("Attack") == 31 or enemies[1].GetVar("Attack") == 32) and GetCurrentState() == "ACTIONSELECT" then
		if enemies[1].GetVar("Attack") == 31 then
			enemies[1].SetVar("Attack",32)
		end
		enemies[1].SetVar('dialogbubble',"Blank")
		SetGlobal("Blank",true)
		enemies[1].SetVar('currentdialogue',{"[noskip][w:99999][next]"})
		State("ENEMYDIALOGUE")
	end
	if NM > 0 then
		if GetCurrentState() ~= "ENEMYDIALOGUE" and NM <= 218 then
			Audio.Pause()
			enemies[1].SetVar('currentdialogue', {"[effect:none][noskip][w:110][voice:v_EsRevitlum(Mad)][func:Face6]THERE!","[func:State,ACTIONSELECT]"})
			State("ENEMYDIALOGUE")
			NM = 2
		end
		if NM >= 2 and GetCurrentState() == "ENEMYDIALOGUE" and NM <= 218 then
			NM = NM + 1
			if NM == 3 then
				Black = CreateSprite("Pixel","Top")
				Black.alpha = 0
				Black.Scale(99999,99999)
				Black.MoveTo(560,70)
				Black.color = {0,0,0}
				Mercy = CreateSprite("Mercy0","Top")
				Mercy.MoveTo(555, 27)
			elseif NM < 25 then
				Black.alpha = (NM-4)/20
			elseif NM == 35 then
				Audio.PlaySound("Blaster1")
			elseif NM == 75 then
				for i=1,44 do
					local Beam = CreateSprite("BlastBig","Top")
					Beam.SetAnimation({"BigBlast0", "BigBlast1", "BigBlast2", "BigBlast3", "BigBlast4"},1/6) 
					Beam.xscale = 0
					Beam.MoveTo(555, -200 + (i*16))
					table.insert(Beams,Beam)
				end
				Audio.PlaySound("Blaster2")
			elseif NM < 165 and NM > 90 then
				if NM == 91 then
					Player.hurt(10)
				end
				for i=1,#Beams do
					local Beam = Beams[i]
					if Beam.isactive == true then
						Beam.xscale = Beam.xscale + 0.6
					end
				end
			elseif NM == 166 then
				Black.remove()
				Mercy.remove()
				Mercy = CreateSprite("Mercyglitched0","BelowArena")
				Mercy.MoveTo(555, 27)
				Mercy.SetAnimation({"Mercyglitched0","Mercyglitched1","Mercyglitched2","Mercyglitched3","Mercyglitched4","Mercyglitched5","Mercyglitched6","Mercyglitched7"})
				Mercy.Scale(0.1,0.1)
			elseif NM > 166 and NM <= 216 then
				for i=1,#Beams do
					local Beam = Beams[i]
					if Beam.isactive == true then
						if Beam.alpha > 0 then
							Beam.alpha = Beam.alpha - 0.02
						else
							Beam.remove()
						end
					end
				end
			elseif NM == 217 then
				for i=1,#Beams do
					local Beam = Beams[i]
					if Beam.isactive == true then
						Beam.remove()
					end
				end
				V = 0
				Audio.Volume(0)
				Audio.Unpause()
			end
		end
	end
	if NM > 198 and GetCurrentState() == "MERCYMENU" then
		State("ACTIONSELECT")
		Player.hurt(10)
	end
	if GetCurrentState() == "ACTIONSELECT" or GetCurrentState() == "MERCYMENU" then
		deathtext = {"[voice:v_flowey]Why'd you kill yourself[w:10], dummy?"}
	else
		deathtext = {"[voice:v_fluffybuns]Don't lose hope.","[voice:v_fluffybuns]"..Player.name.."![w:20]\nStay determined..."}
	end
	if GetGlobal("Angel") == true then
		enemies[1].SetVar("def",-32500)
		enemies[1].SetVar("commands",{"Check", "Taunt"})
	end
	if GetGlobal("Blank") == true then
		nextwaves = {"Blank"}
	end
	if enemies[1].GetVar("TEXT") == true then
		timer = timer - (1/Time.mult)
		if math.floor(timer + 0.5) == 59 then
			if Infinte1 == nil then
				local Infinte1 = CreateSprite("Infinte", "Top")
				Infinte1.MoveTo(355,192)
				Infinte1.Scale(3,2.5)
				table.insert(Infintes,Infinte1)
			else
				Infinte1.alpha = 1
			end
			Audio.PlaySound("uifont")
		end
		if math.floor(timer + 0.5) == 44 then
			if Infinte2 == nil then
				local Infinte2 = CreateSprite("Infinte", "Top")
				Infinte2.MoveTo(470,192)
				Infinte2.Scale(3,2.5)
				table.insert(Infintes,Infinte2)
			else
				Infinte2.alpha = 1 
			end
			Audio.PlaySound("uifont")
		end
		if math.floor(timer + 0.5) == -4 then
			for i=1, #Infintes do
				sprite = Infintes[i]
				sprite.alpha = 0
			end
			enemies[1].SetVar("TEXT",false)
			timer = 117
		end
	end
	if (GetCurrentState() == "ENEMYSELECT" or GetCurrentState() == "ACTMENU" or GetCurrentState() == "ITEMMENU" or GetCurrentState() == "MERCYMENU") and timer0%30 == 0 and Bulleta == nil then
		Bulleta = CreateProjectileAbs("Star", 650, Player.absy, "Top")
		Bulleta.SetVar("R",math.random()*10)
		local R = (math.random()*2) + 1
		Audio.PlaySound("Shoot1")
		Bulleta.sprite.Scale(R,R)
		Bulleta.SetVar("Type",2)
	end
	if Bulleta ~= nil and Bulleta.isactive == true then
		Bulleta.Move(-20,0)
		Bulleta.sprite.rotation = Bulleta.sprite.rotation + Bulleta.GetVar("R")
		if Bulleta.absx < 0 and (GetCurrentState() == "ENEMYSELECT" or GetCurrentState() == "ACTMENU" or GetCurrentState() == "ITEMMENU" or GetCurrentState() == "MERCYMENU") then
			Bulleta.MoveToAbs(650, Player.absy)
			Bulleta.SetVar("R",math.random()*10)
			local R = (math.random()*2) + 1
			Audio.PlaySound("Shoot1")
			Bulleta.sprite.Scale(R,R)
		elseif (GetCurrentState() == "DIALOGRESULT" or GetCurrentState() == "DEFENDING" or GetCurrentState() == "ENEMYDIALOGUE" or GetCurrentState() == "ATTACKING") then
			Bulleta.MoveToAbs(-100, Player.absy)
		end
	else
		Bulleta = CreateProjectileAbs("Star", 650, -200, "Top")
		Bulleta.SetVar("R",math.random()*10)
		local R = (math.random()*2) + 1
		Bulleta.sprite.Scale(R,R)
		Bulleta.SetVar("Type",2)
	end
	if GetCurrentState() ~= "DEFENDING" and GetCurrentState() ~= "DIALOGRESULT" and GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "ENEMYDIALOGUE" and GetGlobal("META") == 0 then
		timer4 = 0
		timer3 = timer3 + 1
		if (timer3 + 81)%(82) == 0 and GetCurrentState() == "ACTIONSELECT" then
			Button = CreateSprite("ButtonWarning","BelowPlayer")
			if Player.absx == 48 then
				Button.MoveTo(87, 27)
			elseif Player.absx == 202 then
				Button.MoveTo(240, 27)
			elseif Player.absx == 361 then
				Button.MoveTo(400, 27)
			elseif Player.absx == 515 then
				Button.MoveTo(555, 27)
			end
			X = Player.absx
		end
		if Button ~= nil and Button.isactive == true then
			if timer3%14 == 0 then
				Button.alpha = 0
			elseif (timer3 + 7)%14 == 0 then
				Button.alpha = 1
			end
			if timer3 >= (26) then
				Shoot = true
			end
		end
		if Shoot == true then
			if timer3 <= (35) then
				local B = bullets[#bullets]
				local bullet = CreateProjectileAbs("BlastBig", X,((timer3 - (35))*16), "Top")
				table.insert(bullets,bullet) 
			end
			for i = 1,#bullets do
				bullet = bullets[i]
				if bullet.isactive == true then
					bullet.SetVar("Type",1)
					bullet.Move(0,5)
					if timer3 >= (45) then
						bullet.sprite.alpha = bullet.sprite.alpha - 0.05
					end
				end
			end
			if timer3 >= (67) then
				if Button.isactive == true then
					Button.remove()
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
			end
		end
	elseif GetCurrentState() ~= "DEFENDING" and GetCurrentState() ~= "DIALOGRESULT" and GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "ENEMYDIALOGUE" and (GetGlobal("META") == 1 or GetGlobal("META") == 2) then
		timer3 = 0
		timer4 = timer4 + 1
		Speed = 10
		if (timer4 + 152)%(152 + Speed) == 0 then
			Button = CreateSprite("ButtonWarning","BelowPlayer")
			Button.MoveTo(87, 27)
			table.insert(Buttons,Button)
			Button = CreateSprite("ButtonWarning","BelowPlayer")
			Button.MoveTo(240, 27)
			table.insert(Buttons,Button)
			Button = CreateSprite("ButtonWarning","BelowPlayer")
			Button.MoveTo(400, 27)
			table.insert(Buttons,Button)
			Button = CreateSprite("ButtonWarning","BelowPlayer")
			Button.MoveTo(555, 27)
			table.insert(Buttons,Button)
			X = Player.absx
		end
		for i = 1,#Buttons do
			Button = Buttons[i]
			if Button ~= nil and Button.isactive == true then
				if timer4%20 == 0 then
					Button.alpha = 0
				elseif (timer4 + 10)%20 == 0 and (timer4 - 32)%92 ~= 0 then
					Button.alpha = 1
				end
				if timer4 >= (60 + Speed) then
					Shoot = true
				end
			end
		end
		if Shoot == true then
			if A == 0 then
				for i = 1,#Buttons do
					Button = Buttons[i]
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
				for i=1,40 do
					bullet = CreateProjectileAbs("BlastBig", 660 - (i*16), 27)
					bullet.sprite.xscale = 0
					bullet.sprite.rotation = 90
					bullet.ppcollision = true
					bullet.SetVar("Type",1)
					bullet.SetVar("M",0)
					table.insert(bullets,bullet)
				end
				A = 1
			end
			for i=1,#bullets do
				local bullet = bullets[i]
				if bullet.isactive == true then
					if bullet.sprite.xscale < 1 and bullet.GetVar("M") == 0 then
						bullet.sprite.xscale = bullet.sprite.xscale + 0.05
					end
					if bullet.sprite.xscale >= 1 and bullet.GetVar("M") == 0 then
						bullet.SetVar("M",21)
					end
					if bullet.GetVar("M") > 1 then
						bullet.SetVar("M", bullet.GetVar("M") - 1)
					end
					if bullet.GetVar("M") == 1 then
						if bullet.sprite.xscale > 0 then
							bullet.sprite.xscale = bullet.sprite.xscale - 0.05
						else
							timer4 = 0
							Shoot = false
							A = 0
							bullet.remove()
						end
					end
				end
			end
		end
	elseif not ( GetCurrentState() ~= "DEFENDING" and GetCurrentState() ~= "DIALOGRESULT" and GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "ENEMYDIALOGUE") and (GetGlobal("META") == 1 or GetGlobal("META") == 2) then
		timer4 = 0
		Shoot = false
		A = 0
		for i = 1,#Buttons do
			Button = Buttons[i]
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
	else
		for i = 1,#bullets do
			bullet = bullets[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		if Button ~= nil and Button.isactive == true then
			Button.remove()
		end
		for i = 1,#Buttons do
			Button = Buttons[i]
			if Button.isactive == true then
				Button.remove()
			end
		end
		X = -100
		timer3 = 0
		timer4 = 0
	end
	if GetCurrentState() ~= "DEFENDING" and GetCurrentState() ~= "DIALOGRESULT" and GetCurrentState() ~= "ATTACKING" and GetCurrentState() ~= "ENEMYDIALOGUE" and GetGlobal("META") == 2 then
		if T == false then
			for i=0,3 do
				local bullet = CreateProjectileAbs("Star", 160 + (i*160),640)
				bullet.SetVar("VSpeed",math.random(-5,5))
				bullet.SetVar("HSpeed",math.random(-5,5))
				bullet.SetVar("Rotaion",math.random()*25)
				bullet.SetVar("Type",2)
				table.insert(StarFollow, bullet)
			end
			T = true
		end
		for i=1,#StarFollow do
			bullet = StarFollow[i]
			if bullet.isactive == true then
				bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer0
				distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
				bullet.SetVar("distance_x", ((Player.x - bullet.x) / distance)*3)
				bullet.SetVar("distance_y", ((Player.y - bullet.y) / distance)*3)
				if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
					bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-Gravity)
				elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
					bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+Gravity)
				end
				if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
					bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-Gravity)
				elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
					bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+Gravity)
				end
				bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
			end
		end
	elseif (GetCurrentState() == "DEFENDING" or GetCurrentState() == "DIALOGRESULT" or GetCurrentState() == "ATTACKING" or GetCurrentState() == "ENEMYDIALOGUE") and GetGlobal("META") == 2 then
		T = false
		for i=1,#StarFollow do
			S = StarFollow[i]
			if S.isactive == true then
				S.remove()
			end
		end
	end
	if GetGlobal("StarFalls") == true then
		if GetGlobal("Angel") == false then
			timer2 = timer2 + 1
			B1.alpha = 0.1
			B2.alpha = 0.1
			B3.alpha = 0.1
			if timer2 == 1 then
				Audio.PlaySound("000029ac")
				Audio.PlaySound("000029ac")
				Audio.PlaySound("000029ac")
				for i=1,100 do
					local S = CreateSprite("Pixel","Bottom")
					S.MoveTo(320,320)
					local M = math.random(1,4)
					S.Scale(M, M)
					S.SetVar("SH",(33.5*math.random()) - 16)
					S.SetVar("SV",(22.5*math.random()) - 16) 
					S.SetVar("Sparkle", math.random()*3000 + timer0)
					S.SetVar("time", 20)
					table.insert(Starz,S)
				end
			end
		elseif GetGlobal("Angel") == true and GetGlobal("ChangeS") == false then
			timer2 = timer2 + 1
			if Background == nil then
				highlight = CreateSprite("softhighlight","Bottom")
				highlight.alpha = 0.2
				highlight.color = {1,0,0}
				highlight.SendToBottom()
				Background = CreateSprite("pixel","Bottom")
				Background.Scale(1000,1000)
				Background.alpha = 0.6
				Background.color = {0.5,0,0}
				Background.SendToBottom()
			else
				highlight.MoveTo(320,440 + (55 * math.cos(timer2/100)))
				if timer2%2 == 0 and #hearts < 50 then
					heart = CreateProjectileAbs("Heart0", math.random(0,640), 800, "BelowUI")
					heart.sprite.color = {1,0,0}
					heart.SetVar("H",0)
					heart.SetVar("V",math.random()*(-10))
					heart.SetVar("Alpha", (math.random()*25)/500)
					heart.SetVar("Reset",false)
					table.insert(hearts,heart)
				end
			end
		elseif GetGlobal("Angel") == true and GetGlobal("ChangeS") == true then
			if Background ~= nil and Background.isactive == true then
				Background.remove()
			end
			if highlight ~= nil and highlight.isactive == true then
				highlight.remove()
			end
			for i=1,#hearts do
				H = hearts[i]
				if H.isactive == true then
					H.remove()
				end
			end
		end
	end
	for i=1,#Stars do
		Star = Stars[i]
		if Star.isactive == true then
			if GetGlobal("Angel") == false then
				if GetGlobal("Blank") == true or GetGlobal("CUTSCENE") == true or GetCurrentState() == "DEFENDING" then
					Star.alpha = Star.alpha - 0.01
				else
					if Star.GetVar("Alpha") <= 0.0001 then
						Star.SetVar("Alpha",0.01)
					end
					Star.alpha = Star.alpha - Star.GetVar("Alpha")
				end
				if Star.GetVar("H") + Star.x > Player.x then
					Star.SetVar("H", Star.GetVar("H") - 0.05)
				elseif Star.GetVar("H") + Star.x < Player.x then
					Star.SetVar("H", Star.GetVar("H") + 0.05)
				end
				if Star.alpha <= 0 then
					Star.SetVar("Reset",true)
				end
				if Star.isactive == true then
					Star.Move(Star.GetVar("H"),Star.GetVar("V"))
				end
				if (Star.absx > 640 or Star.absx < 0 or Star.absy < 0) and Star.isactive == true then
					Star.SetVar("Reset",true)
				end
				if Star.GetVar("Reset") == true and not (GetGlobal("Blank") == true or GetGlobal("CUTSCENE") == true or GetCurrentState() == "DEFENDING") then
					local R = math.random(1,4)
					if R == 1 then
						Star.MoveTo(math.random(0,640) - 320, 800)
					elseif R == 2 then
						Star.MoveTo(math.random(200,640) - 320, 800)
					elseif R == 3 then
						Star.MoveTo(math.random(200,640) - 320, 800)
					elseif R == 4 then
						Star.MoveTo(math.random(200,640) - 320, 800)
					end
					local R = math.random(1,4)
					if R == 1 then
						Star.SetVar("H",(math.random()*20)-10)
						Star.SetVar("V",math.random()*(-10))
						Star.SetVar("scale",math.random()*2 + 1)
						Star.Scale(Star.GetVar("scale"),Star.GetVar("scale"))
						Star.SetVar("Alpha", (math.random()*25)/500)
						Star.alpha = 1
						Star.SetVar("Reset",false)
					elseif R == 2 then
						local distance = math.sqrt((Player.absx - Star.absx)^2 + (Player.absy - Star.absy)^2)
						local Ran = math.random(2,10)
						Star.SetVar("H", ((Player.absx - Star.absx) / distance)*Ran)
						Star.SetVar("V", ((Player.absy - Star.absy) / distance)*Ran)
						Star.SetVar("scale",math.random()*2 + 1)
						Star.Scale(Star.GetVar("scale"),Star.GetVar("scale"))
						Star.SetVar("Alpha", (math.random()*25)/500)
						Star.alpha = 1
						Star.SetVar("Reset",false)
					elseif R == 3 then
						local distance = math.sqrt((-Player.absx - Star.absx)^2 + (Player.absy - Star.absy)^2)
						local Ran = math.random(2,10)
						Star.SetVar("H", ((-Player.absx - Star.absx) / distance)*Ran)
						Star.SetVar("V", ((Player.absy - Star.absy) / distance)*Ran)
						Star.SetVar("scale",math.random()*2 + 1)
						Star.Scale(Star.GetVar("scale"),Star.GetVar("scale"))
						Star.SetVar("Alpha", (math.random()*25)/500)
						Star.alpha = 1
						Star.SetVar("Reset",false)
					elseif R == 4 then
						local distance = math.sqrt(((Player.x + math.random(-50,50)) - Star.x)^2 + ((Player.y + math.random(-50,50)) - Star.y)^2)
						Star.SetVar("H", (((Player.x + math.random(-50,50)) - Star.x) / distance)*math.random(2,10))
						Star.SetVar("V", (((Player.y + math.random(-50,50)) - Star.y) / distance)*math.random(2,10))
						Star.SetVar("scale",math.random()*2 + 1)
						Star.Scale(Star.GetVar("scale"),Star.GetVar("scale"))
						Star.SetVar("Alpha", (math.random()*25)/500)
						Star.alpha = 1
						Star.SetVar("Reset",false)
					end
				end
			else
				Star.alpha = 0
			end
		end
	end
	for i=1,#hearts do
		heart = hearts[i]
		if heart.isactive == true then
			if heart.GetVar("Alpha") <= 0.0001 then
				heart.SetVar("Alpha",0.01)
			end
			heart.sprite.alpha = heart.sprite.alpha - heart.GetVar("Alpha")
			if heart.sprite.alpha <= 0 then
				heart.SetVar("Reset",true)
			end
			if heart.isactive == true then
				heart.Move(heart.GetVar("H"),heart.GetVar("V"))
			end
			if (heart.absx > 640 or heart.absx < 0 or heart.absy < 0) and heart.isactive == true then
				heart.SetVar("Reset",true)
			end
			if heart.GetVar("Reset") == true then
				heart.MoveTo(math.random(0,640) - 320, 800)
				heart.SetVar("H",0)
				heart.SetVar("V",math.random()*(-10))
				heart.SetVar("Alpha", (math.random()*25)/500)
				heart.sprite.alpha = 1
				heart.SetVar("Reset",false)
			end
		end
	end
	for i=1,#Starz do
		local S = Starz[i]
		if S.isactive == true then
			if GetGlobal("Blank") == true or GetGlobal("CUTSCENE") == true then
				S.alpha = 0
			else
				S.alpha = 1
			end
			if S.GetVar("time") > 0 then
				S.Move(S.GetVar("SH"),S.GetVar("SV"))
				S.SetVar("time", S.GetVar("time") - 1)
			end
			if timer0 >= S.GetVar("Sparkle") then 
				S.SetAnimation({"Pixel", "StarSparkle1", "StarSparkle2","StarSparkle3","Pixel","Pixel","Pixel"},1/10) 
				S.loopmode = "ONESHOT"
				S.SetVar("Sparkle", math.random()*3000 + timer0)
			end
			if S.GetVar("time") == 1 then
				Audio.LoadFile("8bit_Dungeon_Boss")
				Audio.Volume(1)
				Audio.Pitch(2)
			end
		end
	end
end
function OnHit(bullet)
	if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 25 then
		Player.Hurt(GetGlobal("BaseDam") + 25)
	elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") - 5 then
		if (GetCurrentState() == "ENEMYSELECT" or GetCurrentState() == "ACTMENU" or GetCurrentState() == "ITEMMENU" or GetCurrentState() == "MERCYMENU") then
			Player.Hurt(GetGlobal("BaseDam") - 5,0.3)
		end
	elseif Player.ishurting == false and (bullet.GetVar("Type") == 1 or bullet.GetVar("Type") == 2) then
		Player.Hurt(Player.hp - 1)
	end
end

function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
	require "Libraries/Basics"
	require "Animations/Es_Revitlum"
	Inventory.AddCustomItems({"LegChoco","StarCookie","C.Comets","NRG. Bar","Pie"}, {0,0,0,0,0})
    Inventory.SetInventory({"LegChoco","StarCookie","C.Comets","C.Comets","C.Comets","NRG. Bar","Pie"})
	Audio.LoadFile("chara-s-genocide")
	Player.lv = 20
	Player.ForceHP(99)
	Player.name = names[math.random(#names)]
	enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face12]Your face...","[effect:none][func:Face2]...","[effect:none][func:Face1]You went back[w:10][func:Face6],\ndidn't you?","[effect:none][func:Face10]...","[effect:none][music:pause][waitall:-2][voice:v_EsRevitlum(Mad)][noskip][func:Face6]YOU[w:10] JUST[w:10] PROVED[w:10] MY[w:10]\nPOINT[w:10], MORTAL!"})
	--enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Human...","[effect:none]...","[effect:none][func:Face2]How do I even say\nwhat you've done?","[effect:none][func:Face1]You've gained the\npower to distort\ntime.","[effect:none][func:Face4]And turned it into\na wicked force...","[effect:none][func:Face3]Typical...","[effect:none][func:Face4]Papyrus[w:10], Sans[w:10],\nToriel[w:10], Undyen...","[effect:none]Whimsun[w:10], Glyde[w:10],\nPyrope[w:10], Mettaton...","[effect:none]...and...","[effect:none][func:Face5]...","[effect:none][func:Face3]Esrevi Nu...","[effect:none][func:Face4]Do these names\nsound familiar?","[effect:none][func:Face1]They should...","[effect:none][waitall:1.5][func:Face6]You murdered them...","[effect:none][waitall:1][func:Face2]I know, as a god[w:15],[func:Face1] I\nshould care about\neach individual the\nsame...","[effect:none][func:Face4]As mortals...","[effect:none][func:Face3]And mortals die...","[effect:none][func:Face2]But Esrevi Nu...","[effect:none][func:Face1]He was always there\nto do things I\ncouldn't at the time...","[effect:none]He really wanted to\nhelp time and space...","[effect:none][func:Face2]So I taught him\neverything I\nreasonably could...","[effect:none][func:Face10]I liked him...","[effect:none][func:Face11]...","[effect:none][func:Face10]Then you...","[effect:none][func:Face4]...","[effect:none][func:Face2]But[w:10],[func:Face1] that's not why I\nam here.","[effect:none]You...[w:15][func:Face2] somehow can\nrewind time.","[effect:none]I have designed time\nto [waitall:-1][voice:v_EsRevitlum(Mad)][func:Face6]NEVER[w:10][waitall:1][voice:v_EsRevitlum][func:Face1] go back...","[effect:none][func:Face2]...","[effect:none][func:Face6]You even destroyed\nall of my stars\nbecause of Esrevi\nNu's untimely death!","[effect:none][func:Face1]...","[effect:none][func:Face4]Someone like you\ndoes not deserve to\nlive...","[func:Face6][effect:none]To have [waitall:-1][voice:v_EsRevitlum(Mad)][func:Face7]ANY[voice:v_EsRevitlum][w:10][waitall:1][func:Face6] time\nleft!","[effect:none][func:Face10]...","[effect:none][music:pause][waitall:-2][voice:v_EsRevitlum(Mad)][noskip][func:Face7]DO[w:10] NOT[w:10] EXPECT[w:10]\nSYMPATHY[w:10], MORTAL!"})
	State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    if ItemID == "LEGCHOCO" then
		BattleDialog({"You ate the Legendary Chocolate.[w:10]\nToo good for this world.[w:5]\nYour HP overflowed."})
		Player.ForceHP(150)
		Player.Heal(150)
		Player.MoveTo(99999,99999,true)
    elseif ItemID == "STARCOOKIE" then
		if Player.hp < 54 then
			BattleDialog({"You ate the Star-Shaped Cookie.[w:15]\nI guess you can say, this cookie\ris[w:20] out of this world.","Wait, no.[w:15] You ARE[w:5] in space...[w:10]\nYou recovered 45 HP."})
			Player.Heal(45)
		else
			BattleDialog({"You ate the Star-Shaped Cookie.[w:15]\nI guess you can say, this cookie\ris[w:20] out of this world.","Wait, no.[w:15] You ARE[w:5] in space...[w:10]\nYour HP was maxed out."})
			Player.Heal(45)
		end
    elseif ItemID == "C.COMETS" then
		if Player.hp < 69 then
			local R = math.random(1,4)
			if R == 1 then
				BattleDialog({"You ate the Commenting Comets.\nPerfect atmosphere here.\nYou recovered 30 HP."})
				Player.Heal(30)
			elseif R == 2 then
				BattleDialog({"You ate the Commenting Comets.\nSpace shows your light.\nYou recovered 30 HP."})
				Player.Heal(30)
			elseif R == 3 then
				BattleDialog({"You ate the Commenting Comets.\nFly far with fun, friend!\nYou recovered 30 HP."})
				Player.Heal(30)
			elseif R == 4 then
				BattleDialog({"You ate the Commenting Comets.\nSpace is your start.\nYou recovered 30 HP."})
				Player.Heal(30)
			end
		else
			local R = math.random(1,4)
			if R == 1 then
				BattleDialog({"You ate the Commenting Comets.\nPerfect atmosphere here.\nYour HP was maxed out."})
				Player.Heal(30)
			elseif R == 2 then
				BattleDialog({"You ate the Commenting Comets.\nSpace shows your light.\nYour HP was maxed out."})
				Player.Heal(30)
			elseif R == 3 then
				BattleDialog({"You ate the Commenting Comets.\nFly far with fun, friend!\nYour HP was maxed out."})
				Player.Heal(30)
			elseif R == 4 then
				BattleDialog({"You ate the Commenting Comets.\nSpace is your start.\nYour HP was maxed out."})
				Player.Heal(30)
			end
		end
    elseif ItemID == "NRG. BAR" then
		if Player.hp < 34 then
			BattleDialog({"You ate the Energy Bar.[w:10]\nYou recovered 65 HP."})
			Player.Heal(65)
		else
			BattleDialog({"You ate the Energy Bar.[w:10]\nYour HP was maxed out."})
			Player.Heal(65)
		end
    elseif ItemID == "PIE" then
		BattleDialog({"You ate the ButterScotch Pie.[w:10]\nYour HP was maxed out."})
		Player.Heal(99)
    end
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
	if GetGlobal("Blank") ~= true then
		if enemies[1].GetVar("Attack") == 1 and GetGlobal("At") == false and NM <= 0 then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Heh.","[effect:none]I see you haven't\nchanged a bit.","[effect:none][func:Face4]A killer to the end[w:10][func:Face1],\neh.","[effect:none]Oh?[w:10] Were you\nexpecting to do some\ndamage?","[effect:none][func:Face4]You really should\neducate yourself\nabout what being a\ngod entails."})
		elseif enemies[1].GetVar("Attack") == 1 and GetGlobal("At") == false and NM > 0 then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]...","[effect:none][func:Face4]I still don't\nunderstand why you\nchose to spare.","[effect:none][func:Face5]...but it is quite\nobvious that you\njust resort to\nviolence...","[effect:none]...in peace's place.","[effect:none][func:Face3]True, I took away\none of the only 2\nchoices you really\nhad...","[effect:none][func:Face4]But you can still\nreset[w:10][voice:v_EsRevitlum(Mad)][func:Face6], RIGHT?"})
		elseif enemies[1].GetVar("Attack") == 2 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Heh[w:5] heh[w:5] heh.","[effect:none][func:Face2]Don't deny it...","[effect:none]Even with your\npower[w:10][func:Face4], you are still\nvery naive.","[effect:none][func:Face1]Or[w:10][func:Face3], rather[w:10][func:Face4], is that\nthe nice way to put\nit?"})
		elseif enemies[1].GetVar("Attack") == 3 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]No[w:20][func:Face4], no your not\nnaive...","[effect:none][func:Face1]You fully know what\nyou are doing.","[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]YOUR PSYCHOTIC!"})
		elseif enemies[1].GetVar("Attack") == 4 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]But still...[w:10][func:Face2] With\neverything...[w:10][voice:v_EsRevitlum(Mad)][func:Face6] YOUR\nPOWER IS NOT\nINFINITE!","[effect:none][func:Face1]You may think when\nyou reset[w:10], you reset\nthe entire universe a\nstep back...","[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]...WHEN YOU ARE NOT!"})
		elseif enemies[1].GetVar("Attack") == 5 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face4]You are only\nreseting parts of\nthe universe.","[effect:none][func:Face3]You are even setting\nback the stretch\nof the universe\nbecause of this.","[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]BUT YOU ARE ONLY\nRESETING PARTS OF\nTHE UNIVERSE'S\nEXPANSION!","[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]YOU'RE LITTERALLY\nWARPING REALITY!"})
		elseif enemies[1].GetVar("Attack") == 6 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face4]You are breaking\napart my dark\nenergy.","[effect:none][waitall:2][func:Face11]Do you even know\nwhat will happen if\nmy dark energy is\ndestroyed?","[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]THE UNIVERSE WILL\nCRUMBLE INTO A\nSINGULARITY!","[effect:none][voice:v_EsRevitlum(Mad)]THERE WILL BE\nANOTHER BIG BANG!"})
		elseif enemies[1].GetVar("Attack") == 7 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][waitall:2][func:Face10]Then[w:8][func:Face11], everything I\nhave ever worked\ntowards[w:8][func:Face10] would be\nlost..."})
		elseif enemies[1].GetVar("Attack") == 8 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face10]I try and try...","[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]I TRY TO GIVE YOU A\nPERFECT WORLD.","[effect:none][func:Face2]Yet[w:10][func:Face1], matter is\nconstant and cannot\nbe shaped more than\nit already is.","[effect:none][func:Face10](Sigh)","[effect:none][func:Face11]Just because I can't\ndo anything[w:10], doesn't\nmean I don't care..."})
		elseif enemies[1].GetVar("Attack") == 9 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face10]I care about YOU,[func:Face11]\nFrisk.","[effect:none][func:Face10]Why can't you see\nthat?"})
		elseif enemies[1].GetVar("Attack") == 10 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][effect:none][func:Face2]...but...","[effect:none][func:Face1]But this killing spree\nhas gone on long\nenough.","[effect:none][func:Face10]Now I have to do\nsomething I never\nwanted to do ever.","[effect:none]Kill one of my own\ncreations..."})
		elseif enemies[1].GetVar("Attack") == 11 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face2]My unwillness to kill...","[effect:none][func:Face4]That is the reason I\nlet you live for so\nlong...","[effect:none][func:Face3]...","[effect:none][func:Face5]Was it a mistake[w:10][func:Face1], I\ndon't know."})
		elseif enemies[1].GetVar("Attack") == 12 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Human[w:10], [voice:v_EsRevitlum(Mad)][func:Face6]PLEASE!","[effect:none][func:Face1]I am trying to end\nthis quicky[w:20][func:Face6], [voice:v_EsRevitlum(Mad)]FOR\nBOTH OF US!","[effect:none][func:Face11](Sigh)","[effect:none][func:Face2]As much as I want\nto[w:10][func:Face1], I can't seem to\nbring myself to use\nmy full power...","[effect:none][func:Face5]So just[w:10][func:Face6] [w:10][voice:v_EsRevitlum(Mad)]STOP!"})
		elseif enemies[1].GetVar("Attack") == 13 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][waitall:2][func:Face10]just stop..."})
		elseif enemies[1].GetVar("Attack") == 14 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face2](Sigh)","[effect:none]Perhaps[w:20][func:Face1]...perhaps I\ncannot simple ask for\nyou to give up life.","[effect:none][func:Face10]...","[effect:none][func:Face2]I have to use my full\npower[w:10][func:Face1], don't I?","[effect:none][func:Face10](Sigh)"})
		elseif enemies[1].GetVar("Attack") == 15 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]ALRIGHT!","[effect:none][func:Face1]If it is going to be\nlike this...","[effect:none][func:Face4]I hope you are\nprepared!","[effect:none][voice:v_EsRevitlum(Mad)][func:Face7]DIE[w:5], MORTAL!"})
			possible_attacks = {"Middle"}
			enemies[1].SetVar("comments",{"Prophecies do come true."})
			Comment1 = 2
			At = true
		elseif enemies[1].GetVar("Attack") == 16 and GetGlobal("At") == false then
			possible_attacks = possible_attacks2
			NumberN = 0
			Comment1 = 3
			enemies[1].SetVar("comments",{"A killer...","Smells like nothing...","You feel...[w:15]powerful.","A Muderer...","The red spreads everywhere.","Time?[w:15]\nSpace?[w:15]\n[color:ff0000]Irrelevant...","[color:ff0000]A new absolute...","You know how you are\rbreathing..."})
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_EsRevitlum(Mad)][func:Face12]WHAT!","[effect:none][func:Face12]Wait...[w:20][func:Face8] No...","[effect:none]Those black[w:8], souless\nwings...","[effect:none][func:Face2]I've seen-","[effect:none][func:Face8]Oh no..."})
			SetGlobal("META",1)
			enemies[1].SetVar('hp', 928580)
			At = true
		elseif enemies[1].GetVar("Attack") == 17 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Your-[w:15] [voice:v_EsRevitlum(Mad)][func:face12]YOU'RE THE\nANGEL OF DEATH!"})
			enemies[1].SetVar('hp', 857152)
		elseif enemies[1].GetVar("Attack") == 18 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face2]I thought...","[effect:none][func:Face1]No[w:15][func:Face6], you weren't\nsupposed to come\nyet.","[effect:none][func:Face12]I still haven't found\na way to kill you!","[effect:none][func:Face2]No[w:5], no[w:5], no.\n[func:Face1]This is Bad."})
			enemies[1].SetVar('hp', 785723)
		elseif enemies[1].GetVar("Attack") == 19 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]NO WOUNDER YOU\nWERE KILLING ALL\nTHOSE MONSTERS!"})
			enemies[1].SetVar('hp', 714295)
		elseif enemies[1].GetVar("Attack") == 20 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]This propecy is worst\nthan I feared...","[effect:none][func:Face4]Why didn't I think of\nthis sooner.","[effect:none][func:Face3]I can't change what I\nknow is going to\nhappen!","[effect:none][func:Face4]And by me trying to\nstop this[w:15][func:Face6], [voice:v_EsRevitlum(Mad)]I SPED UP\nTHE COUNTDOWN!"})
			enemies[1].SetVar('hp', 642866)
		elseif enemies[1].GetVar("Attack") == 21 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]I am not used to this\nkinda of stress!","[effect:none][func:Face2]I usually just stop\ntime to think about\na problem.","[effect:none][func:Face1]You know[w:15], to sound\nsmart and wise.","[effect:none][voice:v_EsRevitlum(Mad)][func:Face8]BUT I CAN'T STOP\nYOUR TIME!"})
			enemies[1].SetVar('hp', 571438)
		elseif enemies[1].GetVar("Attack") == 22 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]What's worst[w:10][func:Face6], if you\nkill the one god in\ncontrol of space and\ntime...","[effect:none]I am theoretically\njust giving you the\nkeys to go anywhere\nin the mutiverse.","[effect:none][func:Face1]No[w:10], even [func:Face6]outside the\nmutiverse.","[effect:none][func:Face2]...like the nullvoid!"})
			enemies[1].SetVar('hp', 500009)
			SetGlobal("META",2)
		elseif enemies[1].GetVar("Attack") == 23 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_EsRevitlum(Mad)][func:Face6]IS THE WHY YOU\nKILLED ESREVI NU?!","[effect:none][voice:v_EsRevitlum(Mad)]TO FACE ME?!","[effect:none][voice:v_EsRevitlum(Mad)][func:Face7]TO KILL ME?!","[effect:none][func:Face6]You...","[effect:none][func:Face1]Are a monster..."})
			enemies[1].SetVar('hp', 428581)
		elseif enemies[1].GetVar("Attack") == 24 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]No[w:10],[func:Face5] for Esrevi Nu[w:10], I\nneed to stay calm.","[effect:none]I need to contain my\nstress."})
			enemies[1].SetVar('hp', 357152)
		elseif enemies[1].GetVar("Attack") == 25 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Human[w:10][func:Face2], umm[w:10][func:Face6], [waitall:-2]whatever[waitall:0]\nyou are!","[effect:none]I cannot[w:10], no[w:10][func:Face7], [voice:v_EsRevitlum(Mad)]WILL\nNOT LET YOU WIN!"})
			enemies[1].SetVar('hp', 285724)
		elseif enemies[1].GetVar("Attack") == 26 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]...","[effect:none][func:Face2]...","[effect:none][func:Face5](Sigh)[w:20]\n[func:Face2]Who am I kidding.","[effect:none][func:Face4]I think I have already\nlearned one thing...","[effect:none][func:Face3]I cannot change what\nI know...","[effect:none][func:Face4]And I know you are\ngoing to kill me..."})
			enemies[1].SetVar('hp', 214295)
		elseif enemies[1].GetVar("Attack") == 27 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face5](Sigh)","[effect:none][func:Face1]...","[effect:none][func:Face2]Wait a minute...","[effect:none][func:Face1]I can...","[effect:none]..."})
			enemies[1].SetVar('hp', 142867)
			enemies[1].SetVar('comments', {"Es Revitlum is focusing his\renergy."})
		elseif enemies[1].GetVar("Attack") == 28 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Almost..."})
			enemies[1].SetVar('hp', 71438)
		elseif enemies[1].GetVar("Attack") == 29 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[effect:none][noskip][func:Face5]Guh...","[effect:none][func:Face6]*pant*[w:10] *pant*","[effect:none][voice:v_EsRevitlum(Mad)][func:Face7]COME ON[w:10], WORK!"})
			enemies[1].SetVar('hp', 10)
		elseif enemies[1].GetVar("Attack") == 30 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {"[func:pausemusic][effect:none][noskip][func:Face1]Heh.","[effect:none][func:Face5]Here is some words\nof advice kid...","[effect:none][func:Face1]When you are\nfighting an enemy\nwho can create\nunlimited resources...","[effect:none][func:Face2]...and healing items...","[effect:none][voice:v_EsRevitlum(Mad)][func:Face7]YOU BETTER HIT\nHARD!"})
			enemies[1].SetVar('hp', 999999)
		elseif enemies[1].GetVar("Attack") == 31 and GetGlobal("At") == false then
			At = true
			enemies[1].SetVar('currentdialogue', {""}) 
			enemies[1].SetVar('hp', 0)
		end
		if enemies[1].GetVar('currentdialogue') == nil then
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]..."})
		end
	else
		enemies[1].SetVar("currentdialogue",{"[next]"})
	end
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
	if GetGlobal("Blank") ~= true then
		if enemies[1].GetVar("Attack") ~= 30 then
			if NumberN <= #possible_attacks - 1 and GetGlobal("Angel") ~= true then
				if GetGlobal("FinishedAtk") == true then
					NumberN = NumberN + 1
					SetGlobal("FinishedAtk",false)
				end
				nextwaves = { possible_attacks[NumberN] }
			elseif NumberN <= #possible_attacks and GetGlobal("Angel") == true then
				if GetGlobal("FinishedAtk") == true then
					NumberN = NumberN + 1
					SetGlobal("FinishedAtk",false)
				end
				nextwaves = { possible_attacks[NumberN] }
			elseif #possible_attacks == 1 then
				nextwaves = { possible_attacks[1] }
			else
				if GetGlobal("Angel") ~= true then
					if GetGlobal("FinishedAtk") == true then
						NumberM = math.random(#ATTACK1)
						SetGlobal("FinishedAtk",false)
					end
					nextwaves = { ATTACK1[NumberM] }
				else
					if GetGlobal("FinishedAtk") == true then
						NumberM = math.random(#ATTACK2)
						SetGlobal("FinishedAtk",false)
					end
					nextwaves = { ATTACK2[NumberM] }
				end
			end
			enemies[1].SetVar('currentdialogue', nil)
			if At == true then
				SetGlobal("At",true)
				enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]..."})
				At = false
			end
		else
			possible_attacks = {"Final","Final Part 2"}
			NumberO = NumberO + 1
			nextwaves = { possible_attacks[NumberO] }
		end
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
	timer3 = 0
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
	if Comment1 <= 1 then
		enemies[1].SetVar("comments",{"The stars are everywhere.","You don't recognize this galaxy.","You wounder how you are\rbreathing.","You feel...[w:15]something.","Smells like space.","You start to regret..."})
		Comment1 = Comment1 + 1
	elseif Comment1 == 3 and GetGlobal("Angel") == true then
		enemies[1].SetVar("comments",{"A killer...","Smells like nothing...","You feel...[w:15]powerful.","A Muderer...","The red spreads everywhere.","Time?[w:15]\nSpace?[w:15]\n[color:ff0000]Irrelevant...","[color:ff0000]A new absolute...","You know how you are\rbreathing."})
		Comment1 = Comment1 + 1
	end
end

function HandleSpare()
	if GetGlobal("Angel") == false and enemies[1].GetVar("Attack") < 9 then
		enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Ah-","[effect:none][func:Face2]Wha-","[effect:none][func:Face1]Yo-","[effect:none][func:Face1]...","[effect:none][func:Face4]After everything\nthat I not only said...","[effect:none][func:Face3]...but what you did.","[effect:none][func:Face6]You choose to spare\nme?","[effect:none][voice:v_EsRevitlum(Mad)]I AM THE ONE WHO\nWILL CHOOSE TO\nSPARE YOU!","[effect:none][func:Face5]I just...","[effect:none][music:pause][voice:v_EsRevitlum(Mad)][func:Face6]YOU KNOW WHAT!","[noskip][func:State,ACTIONSELECT]"})
		NM = 1
	elseif GetGlobal("Angel") == false and Mercy == false then
		enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face1]Ah-","[effect:none][func:Face2]That is a nice\nthought[w:10], human...","[effect:none][func:Face10]But we both know\nthat this cannot end\nin peace.","[effect:none][func:Face5]Sorry..."})
		Mercy = true
	end
    State("ENEMYDIALOGUE")
end
function pausemusic()
	Audio.Pause()
end
