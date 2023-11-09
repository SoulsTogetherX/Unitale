-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"A warrior of time and space\rconfronts you."}
commands = {"Check","Joke","Talk", "Contemplate"}
randomdialogue = {"[effect:none][voice:v_Esrevinu]..."}

sprite = "Blank2" --Always PNG. Extension is added automatically.
name = "Esrevi Nu"
hp = 99999
atk = 9999 -- Uses a knife
def = 999 -- Uses a shield (not magical) to protect himself.
Attack = 0
Checked = false
SetGlobal("N",false)
SetGlobal("At",false)
check = "Check message goes here."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
SetGlobal("Last_attack",false)
talk = 0
talk2 = 0
Joke1 = 0
Joke2 = 0
Joke3 = 0
Contemplate1 = 0
Contemplate2 = 0
Contemplate3 = 0
Miss = 0
Block1 = false
Block2 = false
unkillable = true
SetGlobal("GOBACK",false)
SetGlobal("DoNotSay",false)
voice = "v_Esrevinu" -- I found this out a little late... -_-
--[waitall:2] this too...

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
	SetGlobal("DoNotSay",false)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
		if Attack <= 0 then
			if Miss == 0 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
			elseif Miss == 1 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
			elseif Miss == 2 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu][func:Face7]..."}
			elseif Miss == 3 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu][func:Face7]What are you doing?"}
			elseif Miss == 4 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]I know your missing\non purpose..."}
			elseif Miss == 5 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
			elseif Miss == 6 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu][func:Face7]Do you really need\nto even select\nFIGHT?"}
			elseif Miss == 7 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]Well, it's not\neffecting me.","So you can do\nwhatever you want."}
			elseif Miss >= 8 then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
			end
			Miss = Miss + 1
		end
		SetGlobal("A",false)
		SetGlobal("At",false)
		SetGlobal("DoNotSay",true)
    else
        -- player did actually attack
		if canspare == false then
			Attack = Attack + 1
		end
		if Attack == 23 then
			SetDamage(85600)
		end
		SetGlobal("A",true)
		SetGlobal("At",false)
		if Attack == 12 then
			Block1 = true
		elseif Attack == 20 then
			Block2 = true
		elseif Attack == 24 then
			SetGlobal("Last_attack",true)
			SetGlobal("Break",true)
			SetDamage(2435000)
			Audio.Stop()
		end
		if GetGlobal("REMOVE") == true and Attack < 24 then
			SetGlobal("N",true)
			currentdialogue = {"[effect:none][noskip][func:pausemusic][func:Face2]...","[effect:none][waitall:2][func:Face6]You...","[effect:none][effect:shake,0.2][waitall:3]Lived...","[effect:none][effect:shake,0.2][waitall:3][func:Face1]Heh...","[effect:none][effect:shake,0.4][waitall:3]Heh[w:10] heh[w:10] heh.","[effect:none][effect:shake,0.4][waitall:2]You[w:10] were[w:10] the[w:10]\nmanipulater...","[effect:none][effect:shake,0.6][waitall:3]I[w:10] was[w:10] right.","[effect:none][effect:shake,0.6][waitall:3]And[w:10] now...","[effect:none][effect:shake,0.6][waitall:3]I[w:10] need[w:10] to[w:10] say[w:10]\ngoodbye...","[effect:none][noskip][effect:shake,0.8]To[w:10] the[w:10] world[w:10] I[waitall:3]...\n[waitall:15]Failed.[w:25][func:Face1][w:10][next]","[noskip][func:dead][next]"}
		elseif Contemplate1 >= 5 then
			currentdialogue = {"[effect:none][noskip][func:pausemusic][func:Face6]I...[w:15]\nI...","[effect:none]...","[effect:none][func:Face8]I am no longer sorry\nfor attacking you...","[effect:none]I am sorry I didn't\n[func:Face5]KILL you...","[effect:none][func:Face7]I failed space....","[effect:none][func:Face1]I failed time...","[effect:none]I failed everyone...","[effect:none]But[w:5].[w:5].[w:5].[w:5][func:Face5]Y[w:5]O[w:5]U[w:5].","[effect:none][func:Face1]...","[effect:none][func:Face7]I should have\ntrusted my gut.","[effect:none][func:Face1]...","[effect:none]Heh[w:2] heh[w:2] heh.","[effect:none]It's funny...","[effect:none][func:Face7]The one weakness\nthe protector of\nspace and time has\nis...","[effect:none][func:Face1]...believing in the\nwrong person.","[noskip][func:dead][next]"}
		end
    end
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
	if GetGlobal("Spare") == false then
		if command == "CHECK" then
			if Checked == false and GetGlobal("Spare") == false and GetGlobal("REMOVE") == false then
				currentdialogue = {"[effect:none][voice:v_Esrevinu]You will not get\nanything from that.", "[effect:none][voice:v_Esrevinu]It is time to meet\nyour mortality."}
			end
			if GetGlobal("REMOVE") == false then
				BattleDialog({"Esrevi Nu _ Atk _ Def\nThe protector of what became\rknown as...","'THE UNIVERSE...'","So he has a small life\rcommitment..."})
			elseif GetGlobal("REMOVE") == true then
				BattleDialog({"Esrevi Nu _ Atk _ Def"})
			end
			Checked = true
		elseif command == "JOKE" then
			if talk >= 3 and talk <= 5 then
				if Joke1 == 0 then
					currentdialogue = {"[effect:none]Heh[w:2] heh[w:2] heh...","[effect:none]Okay, that was good.","[effect:none]...","[effect:none]Wait[w:5],[func:Face7] did you just\nsay that because I\nsaid you didn't...","[effect:none][func:Face1]'break the ice?'"}
					BattleDialog({"You say a fun pun.","Esrevi Nu seems to like it."})
				elseif Joke1 == 1 then
					currentdialogue = {"[effect:none]Sigh.","[effect:none][func:Face7]Um[w:5], please stop...","[effect:none][func:Face7]You're making this\nharder for both\nof us."}
					BattleDialog({"You try to continue making jokes[w:10],\rbut Esrevi Nu stops you."})
					talk = 6
				elseif Joke1 >= 3 then
					currentdialogue = {"[effect:none]..."}
					BattleDialog({"Maybe not the best time..."})
				end
				Joke1 = Joke1 + 1
			elseif talk > 5 then
				currentdialogue = {"[effect:none]..."}
				BattleDialog({"You try to think of a joke...[w:10]\nBut now is not the time..."})
				Joke2 = Joke2 + 1
			else
				if Joke3 == 0 then
					currentdialogue = {"[effect:none]..."}
					BattleDialog({"[voice:v_sans]You do a funny impression.[w:20]\nEsrevi Nu doesn’t react."})
				elseif Joke3 == 1 then
					currentdialogue = {"[effect:none]..."}
					BattleDialog("You say some 'sans puns.'")
				elseif Joke3 == 2 then
					currentdialogue = {"[effect:none]..."}
					BattleDialog("You were going to say a joke...[w:20]\nBut you forgot it.")
				elseif Joke3 == 3 then
					currentdialogue = {"[effect:none][func:Face7]..."}
					BattleDialog({"You try even harder to make them\rlaugh...","He smirks...."})
				elseif Joke3 == 4 then
					currentdialogue = {"[effect:none]Heh[w:2] heh[w:2] heh.","[effect:none][effect:shake,1.2][func:Face5]AHH...[w:5]Why?","[effect:none]No...\nI will [w:5]NOT [w:10]tolerate\nthis!","[noskip][func:KillP][next]"}
					BattleDialog({"You give your best joke...[w:20]\n He laughs!"})
				end
				Joke3 = Joke3 + 1
			end
		elseif command == "TALK" then
			if Attack <= 0 then 
				if talk == 0 then
					BattleDialog({"You just try to start a friendly\rconversation."})
					currentdialogue = {"[voice:v_Esrevinu][effect:none]..."}
				elseif talk == 1 then
					BattleDialog({"You again try to start a\rfriendly conversation."})
					currentdialogue = {"[func:Face7][effect:none]Umm...","[effect:none][func:Face1]This is a fight.","[effect:none][func:Face5]I am trying to kill\nyou.","[effect:none][func:Face8]What are you doing?"}
				elseif talk == 2 then
					BattleDialog({"You say that Esrevi Nu 'is out\rof this world.'"})
					currentdialogue = {"[func:Face7][effect:none]This is\nunprecedented..."}
				elseif talk == 3 then
					BattleDialog({"You try to reason with Esrevi\rNu."})
					currentdialogue = {"[effect:none]...","[effect:none][func:Face7]I'm just going to tell\nyou now...","[effect:none][func:Face1]This isn't going to\nchange my mind.","[effect:none]At least 'break the\nice,' first."}
					talk = 4
				elseif talk == 4 then
					BattleDialog({"You again try to talk to Esrevi\rNu."})
					currentdialogue = {"[effect:none]...","[effect:none]Sigh*[w:25]\n[func:Face5]No"}
				elseif talk == 5 then
					BattleDialog({"You again try to talk to Esrevi\rNu.[w:20]\nYou failed..."})
					currentdialogue = {"[effect:none]..."}
				elseif talk == 6 then
					BattleDialog("You continue to talk.")
					currentdialogue = {"[effect:none][func:Face7]I...","[effect:none][func:Face1]You're trying to\nreason your way out\nof this...","[effect:none]...","[effect:none]I[w:10] REALLY[w:10] don't know\nif you are what I\nsay you are.","[effect:none][func:Face7]I usually see the\ngood in people.","[effect:none][func:Face1]And I want to do\nthat to you too...","[effect:none][effect:shake,1]But I can't..."}
				elseif talk == 7 then
					BattleDialog("You tell him that he can trust\ryou.")
					currentdialogue = {"[effect:none][func:Face8]No...[w:20]\nI can't...","[effect:none]...","[effect:none][func:Face7]You don't understand\nhow...","[effect:none][func:Face1]Uneasy this make me\nfeel..."}
				elseif talk == 8 then
					BattleDialog("You ask Esrevi Nu how to gain\rhis trust..")
					currentdialogue = {"[effect:none][func:Face8]You can't...","[effect:none][func:Face1]At least[w:10], until you\nmake me believe you\nare not the\n'manipulator.'"}
				elseif talk == 9 then
					BattleDialog("You tell him that you don't know\rhow to do that.")
					currentdialogue = {"[effect:none]Sigh.","[effect:none]Yeah....","[effect:none][func:Face7]If the timeline gets\nreset[w:5],[func:Face1] I can't really\ntrust you..."}
				elseif talk >= 10 then
					BattleDialog("You can't think of a way to gain\rhis trust..")
					currentdialogue = {"[effect:none]..."}
				end
				if talk ~= 5 and talk ~= 10 then
					talk = talk + 1
				end
			elseif Attack > 0 then
				if talk2 == 0 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]...","[effect:none][voice:v_Esrevinu][func:Face8]You just tried to hit me.","[effect:none][voice:v_Esrevinu][func:Face7]You can't make that\ngo way with a\nconversation."}
					BattleDialog({"You just try to start a friendly\rconversation."})
				elseif talk2 == 1 then
					currentdialogue = {"[voice:v_Esrevinu][effect:none]Reactions are\ncaused by events of\nthe past stringed\ntogether."}
					BattleDialog({"You again try to start a\rfriendly conver--"})
				elseif talk2 == 2 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]If you did an action[w:20],\n[func:Face7]such as hitting me...","[effect:none][voice:v_Esrevinu]You [w:15][func:Face8]HAVE[w:5][func:Face1] to accept\nthe consequences."}
					BattleDialog({"You question what that has to do\rwith--"})
				elseif talk2 == 3 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu][func:Face7]The consequences?[w:10][func:Face1]\nYou ask.","[effect:none][voice:v_Esrevinu][func:Face7]Well[w:10].[w:10].[w:10].","[effect:none][voice:v_Esrevinu][func:Face1]I guess it would be\nme refusing to give\nyou a nice\nconversation."}
					BattleDialog({"You ask what are the\rconsequences."})
				elseif talk2 == 4 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu][func:Face7]Instead[w:15],[func:Face1] I am\ndiscussing and\nnitpicking your\nfaults."}
					BattleDialog({"You decide to say you are\r'sorry.'[w:15] But can't find a\ropening to say it in."})
				elseif talk2 == 5 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]But[w:10], that's a\nconversation,[w:10][func:Face7] isn't\nit?","[effect:none][voice:v_Esrevinu][func:Face1]Just one side is\ngetting increasingly\njudgmental."}
					BattleDialog({"You try to say anything.[w:25]\nYou failed...[w:20]\nThey need some proper manners."})
				elseif talk2 == 6 then
					currentdialogue = {"[voice:v_Esrevinu[effect:none]]No, why am I still giving\nyou the satisfaction\nof taking to me?"}
					BattleDialog({"You question if this even [w:5]IS[w:15] a\rconversation."})
				elseif talk2 >= 7 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu][w:15].[w:15].[w:15]."}
					BattleDialog({"You try to talk to Esrevi Nu again..."})
				end
				talk2 = talk2 + 1
			end
		elseif command == "CONTEMPLATE" then
			if talk >= 8 and talk <= 10 then
				if Contemplate1 == 0 then
					BattleDialog("You try to think of a way to\rconvince him...")
					currentdialogue = {"[effect:none]What are you doing\nnow?"}
				elseif Contemplate1 == 1 then
					BattleDialog("You try again...","Almost...")
					currentdialogue = {"[effect:none]..."}
				elseif Contemplate1 == 2 then
					BattleDialog({"You got it!","You ask him, 'What is the\rdifference between me and anyone\relse.'","'Why do you think it's me?'"})
					currentdialogue = {"[effect:none]...","[effect:none][func:Face7]Your SOUL...","[effect:none][func:Face1]That is the whole\nreason why I came\nhere.","[effect:none]You are the[w:10] ONLY[w:10]\none with that red of\na SOUL.","[effect:none]That was a good\nattempt though."}
				elseif Contemplate1 == 3 then
					BattleDialog("You try to think of another\rway...")
					currentdialogue = {"[effect:none]..."}
				elseif Contemplate1 == 4 then
					BattleDialog("A little longer...")
					currentdialogue = {"[effect:none]..."}
				elseif Contemplate1 == 5 then
					BattleDialog({"You got it!","Again...","You ask Esrevi Nu...","'What reason would I have to do\rany of this.'"})
					currentdialogue = {"[noskip][effect:none][func:pausemusic]...","[effect:none]...\n...","...\n...\n...","[effect:none][func:Face2]Oh jeez...","[effect:none][func:Face1]I spent so long\nlooking for\ndifferences...","[effect:none]I forgot to look for\nmotives.","[effect:none][func:Face7]I...","[effect:none][func:Face1]You...","[effect:none]You would have no\nreason to do any of\nthis.","[effect:none][func:Face6]Your just a really-\nstrong child...","[effect:none][func:Face7]...","[effect:none][func:Face1]I am so sorry.","[effect:none]I...","[effect:none]I'll let you go.","[effect:none]I'm sorry."}
					randomdialogue = {"[effect:none]I'm sorry."}
					canspare = true
					SetGlobal("Nothing",true)
					def = -999999
					SetGlobal("Spare",true)
				elseif Contemplate1 >= 6 then
					BattleDialog("[effect:none]...")
					currentdialogue = {"[effect:none]I'm sorry."}
				end
				Contemplate1 = Contemplate1 + 1
			elseif talk2 == 1 then
				currentdialogue = {"[voice:v_Esrevinu][effect:none]..."}
				BattleDialog({"You contemplate on what that means...[w:20]\nYou got nothing..."})
			else
				if Contemplate3 == 0 then
					currentdialogue = {"[voice:v_Esrevinu][effect:none]Hmm.."}
					BattleDialog({"You contemplate on something.","On what?[w:10]\nYou aren't sure."})
				elseif Contemplate3 == 1 then
					currentdialogue = {"[voice:v_Esrevinu][effect:none]...","[voice:v_Esrevinu][func:Face7][effect:none]What are you doing?"}
					BattleDialog({"You contemplate on something.[w:20]\n...But even harder!","Your face scrunches up.","Maybe you shouldn't do that."})
				elseif Contemplate3 == 2 then
					currentdialogue = {"[voice:v_Esrevinu][effect:none]Honesty...","[voice:v_Esrevinu][effect:none]You may be able to\npredict me...","[effect:none][voice:v_Esrevinu][func:Face7]But[w:15], I can't predict\nyou.","[effect:none][voice:v_Esrevinu][func:Face8]What are you doing?[w:20]\nThis is a battle!"}
					BattleDialog({"But you decided to listen to\rUndyen's advice.","TRY HARDER!!!","...","[func:hurt]Ow...[w:10] You didn't concentrate on\rthe battle.[w:20]\nYou lost one HP."})
				elseif Contemplate3 == 3 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]...","[effect:none][voice:v_Esrevinu][func:Face7]Well, it doesn't\nmatter too much\nto me.","[voice:v_Esrevinu][func:Face1][effect:none]I need you to die\nanyway."}
					BattleDialog({"You thought of a topic to\rcontemplate!","The meaning of life!","Now we just need a few years to\rfigure it out."})
				elseif Contemplate3 == 4 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
					BattleDialog({"The meaning of life is harder to\rfind then you thought."})
				elseif Contemplate3 >= 5 and Contemplate3 < 8 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
					BattleDialog({"You need a little time."})
				elseif Contemplate3 == 8 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]Well[w:10],[func:Face7] this isn't going\nanywere."}
					BattleDialog({"You got it!","But forgot it afterwards.[w:30]\nGood job..."})
				elseif Contemplate3 == 9 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu][func:Face8]I am the protector\nof Space and Time.","[voice:v_Esrevinu][effect:none]You think I don't\nknow that already?"}
					BattleDialog({"You remember it again!","You tell Esrevi Nu it[w:10], with a\rhappy smile!","Esrevi Nu is unimpressed.[w:25]\nHe already knew it.","Your face slowly droops.","You grow angry at Esrevi Nu.","Attack increased!"})
				elseif Contemplate3 == 10 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]Huh.","[effect:none][voice:v_Esrevinu]You look like you\nhave something.","[effect:none][voice:v_Esrevinu][func:Face7]...","[effect:none][voice:v_Esrevinu]Nevermind..."}
					BattleDialog({"You managed to calm yourself.","You then decided to contemplate\ragain.","...but on Esrevi Nu's name this\rtime.","Why does a guardian of time\rhave this name?","Out of any name...","...","You got it!","Esrevi Nu is Un iverse\rbackwards![w:20]\nOr just Universe.","But you avoid telling the dream\rdestroyer."})
					name = "Dream Destroyer"
				elseif Contemplate3 == 11 then
					currentdialogue = {"[effect:none][voice:v_Esrevinu]..."}
					BattleDialog({"You think that's enough."})
				end
				Contemplate3 = Contemplate3 + 1
			end
		end
	elseif command == "CHECK" then
		if Checked == false and GetGlobal("Spare") == false and GetGlobal("REMOVE") == false then
			currentdialogue = {"[effect:none][voice:v_Esrevinu]You will not get\nanything from that.", "[effect:none][voice:v_Esrevinu]It is time to meet\nyour mortality."}
		end
		if GetGlobal("REMOVE") == false then
			BattleDialog({"Esrevi Nu _ Atk _ Def\nThe protector of what became\rknown as...","'THE UNIVERSE...'","So he has a little life\rcommitment."})
		elseif GetGlobal("REMOVE") == true then
			BattleDialog({"Esrevi Nu _ Atk _ Def"})
		end
		Checked = true
	elseif command == "JOKE" then
		currentdialogue = {"[effect:none]I'm sorry."}
		State("ENEMYDIALOGUE")
	elseif command == "TALK" then
		currentdialogue = {"[effect:none]I'm sorry."}
		State("ENEMYDIALOGUE")
	elseif command == "CONTEMPLATE" then
		currentdialogue = {"[effect:none]I'm sorry."}
		State("ENEMYDIALOGUE")
	end
end

function hurt()
	Player.hurt(1)
	Player.MoveTo(1000,1000,true)
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
function dead()
	SetGlobal("KILL",true)
end
function KillP()
	Player.hp = 0
end
function pausemusic()
	Audio.Pause() 
end
