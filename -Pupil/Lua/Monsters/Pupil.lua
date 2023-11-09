-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"The class begins!"}
commands = {"Check","Talk","Question"}
randomdialogue = {"..."}

sprite = "Blank" --Always PNG. Extension is added automatically.
name = "Pupil"
Attack = false
Atack = 0
hp = 515
atk = 60
def = -10
gold = 860
xp = 540
Talk1 = 0
Talk2 = 0
check = "Check message goes here."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
unkillable = true
SetBubbleOffset(0, 0)
voice = "V_Pupil"

function Update()
end

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
		Attack = true
		Atack = Atack + 1
        -- player did actually attack
		Audio.PlaySound("Break")
		SetGlobal("A",true)
		if GetGlobal("turn") >= 14 then
			Audio.Pause()
			SetGlobal("Stop",true)
			SetGlobal("Stop2",true)
			SetGlobal("Death",true)
			hp = 0
			currentdialogue = {"[noskip][effect:none][func:Face5][w:50][next]","[waitall:2][noskip]...","[effect:none][waitall:2][noskip]W-...","[effect:none][func:Face2][waitall:2][noskip]...","[effect:none][waitall:2][noskip]...","[effect:none][func:Face1][noskip]Why?","[effect:none][waitall:2][noskip]WHY!?","[effect:none][waitall:3][noskip]Did...[w:20][func:Face2]Did I do\nsomething wrong?","[effect:none][waitall:3][noskip]Do you just not like\nGrillby's?","[effect:none][waitall:4][noskip][func:Face1]No...[w:20]That[w:10],[func:Face7] that isn't\nit.","[effect:none][waitall:4][noskip][func:Face1]...","[effect:none][waitall:5][noskip][func:Face2]Perhaps...","[effect:none][waitall:4][noskip]You're too good of a\nfighter...","[effect:none][noskip][waitall:10][func:Face1]I see now...","[effect:none][noskip][func:Face2]...","[noskip][func:Kill]"}
		end
		function BeforeDamageCalculation()
			if hp <= 30 then
				Audio.Pause()
				SetGlobal("Stop",true)
				SetGlobal("Death",true)
				SetDamage(math.random(550,700))
				currentdialogue = {"[noskip][effect:none][func:Face5][w:50][next]","[noskip][effect:none]...","[noskip][effect:none][func:Face1]...","[noskip][effect:none][waitall:-2]Ha[w:6] ha[w:6] ha.","[noskip][effect:none][waitall:2]I told you to go\neasy...","[noskip][effect:none][waitall:2][func:Face7]...","[noskip][effect:none][waitall:2][func:Face1]I can't say this is\nfine...","[effect:none][noskip][waitall:2]...","[effect:none][noskip][waitall:2][func:Face7]Or that you are not\nat fault...","[effect:none][noskip][waitall:2][func:Face1]But...","[effect:none][noskip][waitall:2]You didn't mean it[w:5],\n[func:Face2]right?","[effect:none][noskip][waitall:3][func:Face7]You're the savoir of\nmonsters[w:20],[func:Face1] after all.","[effect:none][noskip][waitall:3]O-[w:15]of course you\ndidn't mean it...","[effect:none][noskip][waitall:3][func:Face2]...","[effect:none][noskip][waitall:3]I'm sorry we had to\ncut the class short...","[effect:none][noskip][waitall:3][func:Face1]...","[noskip][effect:none][waitall:5][func:Face2]Undyen is going to\nbe mad at me...","[noskip][func:Kill]"}
				State("ENEMYDIALOGUE")
			end
		end
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "CHECK" then
		if GetGlobal("turn") < 14 then
			BattleDialog({"Pupil 8 ATK 3 DEF\nA student of Undyen trying to\rhelp you."})
		else
			BattleDialog({"Pupil 8 ATK 0 DEF\nA friendly classmate."})
		end
    elseif command == "TALK" then
		if GetGlobal("turn") < 14 then
			Talk1 = Talk1 + 1
			if Talk1 == 1 then
				BattleDialog({"You tried to talk[w:15], but then\rdecided to focus on the battle.","Training is important too[w:20], ya\rknow?"})
			elseif Talk1 == 2 then
				BattleDialog({"You thought about it again...","No..."})
			elseif Talk1 == 3 then
				BattleDialog({"You decided to stop thinking\rabout this matter[w:20], and get back\rto work."})
			elseif Talk1 >= 4 then
				BattleDialog({"But you couldn't stop thinking\rabout it..."})
			end
		else
			Talk2 = Talk2 + 1
			if Talk2 == 1 then
				BattleDialog({"You say that grillby's a great\rplace.","You say that your friend Sans\ronce took you there."})
				currentdialogue = {"[func:Face7][effect:none]Sans?","[effect:none]Mmmm...[w:20][func:Face1] Isn't he the\nbrother of Papyrus?","[effect:none]Every time I see\nPapyrus he's either\nhappy and cheeful.","[effect:none]Or complaining that\nhis brother needs\nto work more.","[effect:none][func:Face2]Honesty[w:20],[func:Face1] I'm\nsurprised that Sans\ngets up to go\nanywhere.","[effect:none][func:Face5]Oh[w:8], no offence!"}
			elseif Talk2 == 2 then
				BattleDialog({"You decide to take no offence."})
				currentdialogue = {"[func:Face2][effect:none]Mmm...[w:15][func:Face7] Say...","[effect:none][func:Face1]How did you befriend\nUndyne?","[effect:none]There is a lot of\nstories about you\nfreeing monsters...","[effect:none]But[w:10],[func:Face7] their all vague.","[effect:none][func:Face1]I want to hear it\nstraight from the\nhero themself!"}
			elseif Talk2 == 3 then
				BattleDialog({"You explain how you befriended\rUndyne."})
				currentdialogue = {"[effect:none]So you...","[func:Face7][effect:none]Ran away from\nUndyne...","[effect:none][func:Face1]Then manipulated her\nto be your friend?","[effect:none][func:Face2]Huh...","[effect:none][func:Face1]Well[w:20], at least it\nended happily."}
			elseif Talk2 == 4 then
				BattleDialog({"You can't think of anything else\rto say."})
				currentdialogue = {"[effect:none]..."}
			end
		end
    elseif command == "QUESTION" then
		if GetGlobal("turn") < 14 then
			BattleDialog({"Please keep all question till\rafter class."})
		else
			BattleDialog({"Ironically...","Even after class...[w:15] You can't\rthink of any questions."})
		end
    end
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