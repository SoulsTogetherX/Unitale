-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "The class begins!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"Start_Attack"}
wavetimer = 99999
arenasize = {155, 130}
flee  = false
Turn = 0
SetGlobal("Stop",false)
SetGlobal("Stop2",false)

enemies = {
"Pupil"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
easy = {"SpikeFall","SpikeWall","Turn90","SpikeShower"}
normal = {"360Spike","SpikeSpin","Splice"}
hard = {"Copy90","FullCover","SpeedSpike"}
super_hard = {"CutCutCut","FastThrow"}
possible_attacks = {"Start_Attack"}

function EncounterStarting()
	require "Libraries/FPSWaves"
	require "Animations/Pupil"
	Inventory.AddCustomItems({"SchoolLun","Apple","LegChoco","BubbleGum"}, {0,0,0,0})
    Inventory.SetInventory({"SchoolLun","SchoolLun","SchoolLun","BubbleGum","Apple","LegChoco"})
	Audio.LoadFile("Nothing")
	Audio.Volume(0)
	Audio.Pitch(1)
	enemies[1].SetVar('currentdialogue', {"[effect:none]Ok...","[effect:none][func:Face7]Umm...[w:20][func:Face1]Frisk...","[effect:none]Today's class is\ngoing to be a little\ndifferent.","[effect:none][func:Face6]Undyen had to do\nsomething[w:20],[func:Face7] so she\ncouldn't come in.","[effect:none][func:Face1]Something about\ncooking...[w:10]and\nPapyrus.","[effect:none][func:Face7]Maybe hospital...","[effect:none][func:Face1]But[w:10], that doesn't\nmatter...","[effect:none]Either way[w:15], Undyen\nentrusted me with\nyour lesson today.","[effect:none][func:Face7]I guess that makes\nme a substitute\nteacher.","[effect:none][func:Face1]SO!","[effect:none]...","[effect:none]I am first going to\nsee where you are\nnow.","[effect:none]Then we can start\nwith the real lesson...","[effect:none][func:Face7]Just try your best\nat dogging my\nattacks.","[effect:none]Ok, are you ready?"})
	State("ENEMYDIALOGUE")
    -- If you want to change the game state immediately, this is the place.
end

function HandleItem(ItemID)
    if ItemID == "SCHOOLLUN" then
		if Player.hp < 12 then
			BattleDialog({"You ate the School Lunch.[w:5]\nYou recovered 8 HP."})
			Player.Heal(8)
		else
			BattleDialog({"You ate the School Lunch.[w:5]\nYour HP was maxed out."})
			Player.Heal(8)
		end
    elseif ItemID == "LEGCHOCO" then
		BattleDialog({"You ate the Legendary Chocolate.[w:10]\nToo good for this world.[w:5]\nYour HP overflowed."})
		Player.ForceHP(30)
		Player.MoveTo(99999,99999,true)
    elseif ItemID == "APPLE" then
		if Player.hp < 4 then
			BattleDialog({"You ate the apple.[w:10]\nIt was for the teacher![w:5]\nYou recovered 16 HP."})
			Player.Heal(16)
		else
			BattleDialog({"You ate the apple.[w:10]\nIt was for the teacher![w:5]\nYour HP was maxed out."})
			Player.Heal(16)
		end
    elseif ItemID == "BUBBLEGUM" then
		if Player.hp < 17 then
			BattleDialog({"You ate the Bubble gum.[w:10]\nMinty...[w:5]\nYou recovered 3 HP."})
			Player.Heal(3)
		else
			BattleDialog({"You ate the Bubble gum.[w:10]\nMinty...[w:5]\nYour HP was maxed out."})
			Player.Heal(3)
		end
    end
end
TIME = 0
J = 0
function Update()
	if J == 1 then
		Player.ForceHP(99999)
	end
	if Input.GetKey("J") >= 1 then
		TIME = TIME + 1
		if TIME >= 200 then
			J = 1
		end
	else
		TIME = 0
	end
	FPS()
	SetGlobal("turn",Turn)
	if Turn == 2 then
		enemies[1].SetVar("comments",{"Homework can kill[w:15], I guess.","You are surrounded by bullets.","Pupil watches you.","Spikes[w:10], and[w:20]... No that's it.","A teacher's pet."})
	elseif Turn == 13 then
		enemies[1].SetVar("comments",{"Pupil is preparing something."})
	elseif Turn == 14 then
		enemies[1].SetVar("comments",{"..."})
	end
	if Input.Menu == 1 and GetCurrentState() == "ENEMYDIALOGUE" then
		State("DEFENDING")
	elseif Input.Menu == 1 and GetCurrentState() == "DEFENDING" then
		State("ACTIONSELECT")
	elseif Input.Menu == 1 and GetCurrentState() == "ACTIONSELECT" then
		State("ENEMYDIALOGUE")
	end
	if GetGlobal("DEAD") == true then
		Audio.Pause()
		if Turn == 1 then
			enemies[1].SetVar('currentdialogue', {"[effect:none]...","[func:Face7][effect:none]Oh...[w:20][func:Face2] Sorry...","[func:Face1][effect:none]I guess I went a little\ntoo overboard...","[effect:none][func:Face2]...","[effect:none][waitall:-1][func:Face1]THAT'S OK!","[effect:none]Take a break and we\nwill start with\nsomething else!","[func:State,DONE]"})
		elseif Turn <= 5 then
			enemies[1].SetVar('currentdialogue', {"[effect:none]Mmmm...","[effect:none]Yeah[w:10], okay.","[func:Face6][effect:none]I have notes...","[func:Face1][effect:none]But at least I know\nwhat we can work on!","[effect:none]Come on... Let's sit\ndown.","[func:State,DONE]"})
		elseif Turn <= 8 then
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face7]Well...","[func:Face6][effect:none]You didn't do bad!","[effect:none][func:Face1]You actually did\npretty good.","[effect:none]Come on!","[effect:none]You want to sit\ndown?","[func:State,DONE]"})
		elseif Turn <= 11 then
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face4]Huh...","[effect:none][func:Face7]To be quite honest[w:15],\nI didn't think you\ncould dodge that\nlong.","[effect:none][func:Face1]I guess I shouldn't\nexpect anything else\nfrom the savoir\nof monsters.","[effect:none]Do you want any\nwater?","[effect:none]Come on[w:15], please sit.","[func:State,DONE]"})
		elseif Turn <= 13 then
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face7]Well...[w:20][func:Face1] I got you.","[effect:none]Ha[w:15], don't feel bad.","[effect:none][func:Face6]Those were very\nhard attacks.","[effect:none][func:Face1]Do you want\nanything?","[effect:none]Come on[w:15], sit.","[func:State,DONE]"})
		elseif Turn == 14 then
			enemies[1].SetVar('currentdialogue', {"[effect:none]Ha,[w:15][func:Face7] well no one's\nperfect!","[effect:none][func:Face1]You still got really\nfar!","[effect:none]Come on[w:10], sit down[w:15],\nplease.","[effect:none]Take a rest[w:15], you\ndeserve it!","[func:State,DONE]"})
		end
		State("ENEMYDIALOGUE")
		Player.Hurt(0)
		Player.hp = 1
		SetGlobal("DEAD",false)
	end
end

function HandleSpare()
	if Turn < 14 then
		enemies[1].SetVar("xp",0)
		enemies[1].SetVar("gold",200)
		enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face5]Spare?","[func:Face1][effect:none]Are you ok?","[effect:none]I wouldn't hurt you[w:20],\nso there is no need\nto be afraid.","[func:Face7][effect:none]But if you don't want\nto fight[w:15],[func:Face1] that's cool.","[effect:none]We'll work on\nsomething else!","[noskip][func:Face5][func:Spare]"})
		SetGlobal("Stop",true)
		SetGlobal("Spare",true)
		State("ENEMYDIALOGUE")
	elseif Turn >= 14 then
		SetGlobal("Stop",true)
		SetGlobal("Spare",true)
		enemies[1].SetVar("currentdialogue",{"[func:Spare]"})
		State("ENEMYDIALOGUE")
	end
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
	if GetGlobal("Stop") == false then
		Turn = Turn + 1
		if Turn == 1 then
			possible_attacks = {"Start_Attack"}
		elseif Turn == 2 then
			if enemies[1].GetVar("Attack") == true then
				enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face5]Ow...","[func:Face7][effect:none]Mmmm...","[func:Face1][effect:none]I guess it's a good\nidea to practice\nsparring too.","[effect:none][func:Face2]Just don't go too\nhard on me.","[effect:none][func:Face7]Either way[w:20],[func:Face1] I'm going\nto slow things down\na bit."})
			else
				enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Ok...","[effect:none]...","[func:Face2][effect:none]That might have been\ntoo advanced...","[effect:none]...","[effect:none]Sorry[w:20],[func:Face1] let's try\nsomething easier."})
			end
			possible_attacks = {"Turn90"}
		elseif Turn == 3 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face6]I know what you are\nthinking...","[effect:none][func:Face7]'This is too easy!'","[effect:none][func:Face1]Don't worry[w:20], I just\nwant to know what I\nam dealing with."})
			possible_attacks = {"SpikeFall"}
		elseif Turn == 4 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Ok...","[effect:none]You're doing well so\nfar!","[effect:none]Huh?","[effect:none][func:Face4]What's with that\nface?","[func:Face7][effect:none]I'm sorry if I am not\nas good as Undyen."})
			possible_attacks = {"SpikeWall"}
		elseif Turn == 5 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]But[w:20], hey!","[effect:none]Any form of practice\nmakes perfect!"})
			possible_attacks = {"SpikeShower"}
		elseif Turn == 6 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Ok.[w:30][func:Face7] I think it's time\nto ramp it up[w:15],[func:Face1] don't\nyou agree?","[effect:none]Don't worry[w:15],[func:Face6] I'm not\ngoing to totally\nunrestrain myself.","[effect:none][func:Face1]But just a little."})
			possible_attacks = {"360Spike"}
		elseif Turn == 7 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Ha[w:20],[func:Face7] you know...","[effect:none]I never though I be\nable to meet you.","[func:Face1][effect:none]The savoir of\nmonsters!"})
			possible_attacks = {"Splice"}
		elseif Turn == 8 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Sigh[w:20],[func:Face7] I just want to\nsay[w:15],[func:Face1] 'thank you!'"})
			possible_attacks = {"SpikeSpin"}
		elseif Turn == 9 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face7]You know...","[effect:none][func:Face1]I like to think[w:10], when\nI was a kid[w:10], I was\nlike you.","[effect:none]A small person with\nbig dreams of being\na Royal guard\nmember.","[effect:none][func:Face7]Expect not nearly as\nkind."})
			possible_attacks = {"SpeedSpike"}
		elseif Turn == 10 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Wait[w:20],[func:Face7] I guess I should\nfocus on the battle\nmore[w:10],[func:Face1] huh?","[effect:none]Alright[w:20], now it will be\na little harder.","[effect:none]Are you up to the\nchallenge?"})
			possible_attacks = {"FullCover"}
		elseif Turn == 11 then
			if enemies[1].GetVar("hp") <= 125 then
				enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face7]You're[w:10],[func:Face2] uh[w:10],[func:Face1] getting a\nlittle aggressive\nthere.","[effect:none]But[w:10],[waitall:-1] that's totally\nfine!","[effect:none][func:Face7]Just ease up a\nlittle.","[effect:none][func:Face1]You don't want to\nkill me[w:15], right?"})
			else
				enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Mmm...","[func:Face2]You seem like you\nhave good reflexes...","[effect:none][func:Face1]But[w:10], how long till\nI overwhelm you?"})
			end
			possible_attacks = {"Copy90"}
		elseif Turn == 12 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]In battle[w:20], reflexes\naren't everything.","[effect:none]You need to be able\nto predict my\nmovements!"})
			possible_attacks = {"CutCutCut"}
		elseif Turn == 13 then
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Mmmm...Very good!","[effect:none]Try this on for size!"})
			possible_attacks = {"FastThrow"}
		elseif Turn == 14 then
			Audio.Pause()
			enemies[1].SetVar("currentdialogue",{"[effect:none][func:Face1]Huh[w:20],[func:Face7] I thought you\nwould have reached\nnear defeat at least\nby now...","[effect:none][func:Face1]You truly are the\nsavoir!","[effect:none][func:Face2]...","[effect:none][func:Face1]I'm going to give you\none more attack,[w:20] at\nFULL force.","[effect:none]If you can doge it[w:20],[func:Face7] I\ndon't think I'll be\nable to teach you.","[effect:none][func:Face1]And we'll both get a\nday off!","[effect:none]Ok...[w:25]Ready?"})
			possible_attacks = {"Final_Attack"}
		end
	elseif GetGlobal("turn") >= 14 and GetGlobal("Stop2") == false then
		if GetGlobal("CD") == nil and enemies[1].GetVar("currentdialogue") == nil then
			enemies[1].SetVar("currentdialogue",{"[effect:none]..."})
		elseif enemies[1].GetVar("currentdialogue") == nil then
			enemies[1].SetVar("currentdialogue",GetGlobal("CD"))
			enemies[1].SetVar("def",-9999)
		end
		possible_attacks = {"Blank"}
	end
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	if GetGlobal("CD") ~= nil then
		SetGlobal("CD",nil)
	end
	currentdialogue = nil
end

function DefenseEnding() --This built-in function fires after the defense round ends.
	encountertext = RandomEncounterText()
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