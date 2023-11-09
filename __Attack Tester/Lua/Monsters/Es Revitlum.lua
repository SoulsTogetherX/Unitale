-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"The Universal Titan strikes\rforth!"}
commands = {"Check", "Confess", "Taunt"}
randomdialogue = {"[effect:none]..."}

sprite = "Blank2" --Always PNG. Extension is added automatically.
name = "Es Revitlum"
hp = 999999
atk = math.huge
def = math.huge
Attack = 0
check = "Check message goes here."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
TEXT = false
CHECKED = false
CHECKED2 = false
unkillable = true
Confess = 0
Confess2 = 0
Taunt = 0
Taunt2 = 0
voice = "v_EsRevitlum"
SetGlobal("ATTACKED",false)
-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
		SetGlobal("At",false)
		Attack = Attack + 1
		if Attack == 16 then
			SetGlobal("ATTACKED",true)
			Shield = 2
		elseif Attack < 16 then
			Shield = 1
		else
			if Attack ~= 30 then
				SetGlobal("ATTACKED",true)
			end
			Shield = 0
		end
		if Attack == 29 then
			SetDamage(-999999)
		elseif Attack == 30 then
			Audio.Pause()
			Audio.PlaySound("00002a5e")
			SetDamage(999999)
		end
    end
end 

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "CHECK" then
		if GetGlobal("Angel") == false then
			if CHECKED == false then
				currentdialogue = {"[effect:none][func:Face1]...","[effect:none][func:Face3]You think checking\nme will do anything?","[effect:none][func:Face4]Trust me when I say,\nyou will [func:Face6]never[w:10][func:Face4] know\nmy true power."}
			end
			BattleDialog({"[noskip]Es Revitlum ATK    DEF   [w:20][next]","Not just the guardian.[w:15]\nThe[w:10] GOD[w:15] of space and time!","[func:State,ENEMYDIALOGUE]"})
			TEXT = true
			CHECKED = true
		elseif GetGlobal("Angel") == true then
			if CHECKED2 == false then
				currentdialogue = {"[effect:none][func:Face12]...","[effect:none][func:Face10]I-","[effect:none][func:Face1]..."}
			end
			BattleDialog({"Es Revitlum ATK 184 DEF 202","Seems mortal now...[w:20]\nOr have you grown immortal?","[func:State,ENEMYDIALOGUE]"})
			CHECKED2 = true
		end
    elseif command == "CONFESS" then
		if Confess == 0 then
			currentdialogue = {"[effect:none][func:Face4]I got only one thing\nto say to you\nmortal...","[effect:none]I don't care right\nnow.","[effect:none][func:Face1]My only concern is\nto eliminate this\nthreat you have\nbrought.","[effect:none][func:Face3]Maybe then I can\nstart bringing order\nto the Universe\nagain.","[effect:none][func:Face2]Maybe then I can\nfocus enough inorder\nto reconstruct\neveryone's SOULs."}
			BattleDialog({"You confess every sin you have\rcomited to Es Revitlum.","Didn't go as planed..."})
		elseif Confess == 1 then
			currentdialogue = {"[effect:none][func:Face1]Mortal[w:10][func:Face4], look...","[effect:none][func:Face5]You may have\nforgoten[w:10], but I am\nthe [voice:v_EsRevitlum(Mad)][func:Face6]GOD OF SPACE\nAND TIME!","[effect:none][func:Face1]I am omnipotent...","[effect:none][func:Face5]I know everything!"}
			BattleDialog({"You try again to confess your\rsins.","Nothing has changed with\rEs Revitlum's mood."})
		elseif Confess == 2 then
			currentdialogue = {"[effect:none][func:Face1]...","[effect:none][func:Face2]When I say\nomnipotence[w:10],[func:Face1] I mean I\nknow what's going to\nhappen.","[effect:none]I repeat, '[voice:v_EsRevitlum(Mad)][func:Face6]I KNOW.[voice:v_EsRevitlum]'","[effect:none][func:Face1]I can't just change\nwhat [w:10][func:Face6]IS[w:10][func:Face5] going to\nhappen.","[effect:none][func:Face2]Though...","[effect:none][func:Face1]I technically didn't\nknow you would kill\nanyone...","[effect:none]...","[effect:none][func:Face2]That only really\nhappens with a being\nof equal or greater\npower than me.","[effect:none][func:Face4]But a more likely\ncause is your time\ntravel capablity."}
			BattleDialog({"Instead of confessing your sins[w:10],\ryou ask why he didn't just stop\ryou from killing."})
		elseif Confess > 2 then
			currentdialogue = {"[effect:none][func:Face4]..."}
			BattleDialog({"You try asking more questions[w:10],\rbut he isn't listening any more."})
		end
		Confess = Confess + 1
    elseif command == "TAUNT" then
		if GetGlobal("Angel") == false then
			if Taunt == 0 then
				currentdialogue = {"[effect:none][func:Face3]..."}
				BattleDialog({"You cross off a list of the\rpeople you killed...","Es Revitlum is blank."})
			elseif Taunt == 1 then
				currentdialogue = {"[effect:none][func:Face1]Ok[w:10][func:Face2], that one actually\nhurt me inside a\nlittle."}
				BattleDialog({"You cross off Esrevi Nu."})
			elseif Taunt == 2 then
				currentdialogue = {"[effect:none][func:Face6]You're lucky that\nyour determination is\nenough to prevent\nme...","[effect:none]...from atomized you."}
				BattleDialog({"You try to cross off more[w:10], but\rEs Revitlum just un-did your\rpencil marks.","Then took it...","And atomized it...","Real nice..."})
			elseif Taunt == 3 then
				currentdialogue = {"[effect:none][func:Face1]..."}
				BattleDialog({"You sadly don't have the\rclipboard anymore."})
			elseif Taunt > 3 then
				currentdialogue = {"[effect:none][func:Face1]..."}
				BattleDialog({"Rest in peace Clipy the\rClipboard."})
			end
			Taunt = Taunt + 1
		elseif GetGlobal("Angel") == true then
			if Taunt2 == 0 then
				currentdialogue = {"[effect:none][func:Face6]You-","[effect:none][func:Face2]...","[effect:none][func:Face4]And I am sure your\nproud of it too."}
				BattleDialog({"You remind Es Revitlum of your\rvictories again and again.","...almost psychotically"})
			elseif Taunt2 > 0 then
				currentdialogue = {"[effect:none][func:Face6]..."}
				BattleDialog({"Es Revitlum is focusing too hard\ron the battle."})
			end
			Taunt2 = Taunt2 + 1
		end
    end
end
function pausemusic()
	Audio.Pause()
end
function Face1()
	SetGlobal("Face",1)
end
function Face2()
	SetGlobal("Face",2)
end
function Face3()
	SetGlobal("Face",3)
end
function Face4()
	SetGlobal("Face",4)
end
function Face5()
	SetGlobal("Face",5)
end
function Face6()
	SetGlobal("Face",6)
end
function Face7()
	SetGlobal("Face",7)
end
function Face8()
	SetGlobal("Face",8)
end
function Face9()
	SetGlobal("Face",9)
end
function Face10()
	SetGlobal("Face",10)
end
function Face11()
	SetGlobal("Face",11)
end
function Face12()
	SetGlobal("Face",12)
end