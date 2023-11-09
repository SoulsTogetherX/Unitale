-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "..." --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"Drone"}
wavetimer = 99999
arenasize = {155, 130}
Turn = 0
Spare = 0 
flee = false
enemies = {
"Wronskian"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"Drone"}
--possible_attacks = {"BounceSpike","BulletSpread","CircleCut","Coded","CodeRecall","CrossHairs","Crush","CuttingTheCode","DoubleDrone","Drone","DroneBounce","Droneline","Droneline(hard)","DroneScatter","DroneSpin","Missiles","ScatterTracker","Small cut","Smash","TrackingBullet","Slice"}
StartAttack = {"StartAttack"}
W1 = {"Coded","CrossHairs","DroneSpinLeft","DroneSpinRight","TrackingBullet"}
W2 = {"BulletSpread","CircleCut","Droneline","DroneScatter","Crush"}
W3 = {"CodeRecall","Drone","CuttingTheCode","SmallCut"}
W4 = {"Slice","DroneBounce","Missiles","Smash"}
W5 = {"DoubleDrone","Droneline(hard)","CodeRecall(Hard)","ScatterTracker","Drone(Harder)"}
EndAttack = {"FinalAttack"}
SetGlobal("Turn",0)
SetGlobal("FinalAttack",false)
SetGlobal("D1",false)
--SetGlobal("FinalAttackDone",false)
M1 = false
ZXA = false

function Update()
	Animate()
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
	if enemies[1].GetVar("Insult") >= 10 then
		deathtext = "[voice:default]That's what you get!"
		Player.hurt(99)
	end
	if GetGlobal("Turn") > Turn then
		Turn = GetGlobal("Turn")
	end
	if GetGlobal("D1") == true then
		enemies[1].SetVar('currentdialogue', {"[effect:none]Fine then!","[effect:none]Have it your way.","[func:State,ACTIONSELECT]"})
		State("ENEMYDIALOGUE")
		SetGlobal("D1",false)
	end
	if GetGlobal("D2") == true then
		if D2 ~= 1 then
			T = Turn  
			D2 = 1
		end
		if T ~= Turn then
			enemies[1].SetVar("comments",{"Wronskian is trying to hide his emotions."})
		else
			enemies[1].SetVar("comments",{"Wronskian is building something.","Smells like oil.","Saws[w:10], blades[w:10], spikes[w:10], fire.","Smoke surrounds the area.","Gears are turning.","Wronskian doesn't seem to care."})
			SetGlobal("D2", false)
		end
	end
	if GetGlobal("FinalAttack") == false then
		if Turn == 0 then
			possible_attacks = StartAttack
		elseif Turn > 0 and Turn <= 6 then
			possible_attacks = W1
		elseif Turn > 6 and Turn <= 12 then
			possible_attacks = W2
		elseif Turn > 12 and Turn <= 18 then
			possible_attacks = W3
		elseif Turn > 18 and Turn <= 24 then
			possible_attacks = W4
		elseif Turn > 24 then
			possible_attacks = W5
		end
	elseif GetGlobal("FinalAttackDone") ~= true then
		possible_attacks = EndAttack
	else
		if ZXA == false then
			Player.ForceAttack(1, (enemies[1].GetVar("hp") - 1))
			Audio.PlaySound("00002a18")
			enemies[1].SetVar("currentdialogue",{"[noskip][w:30][next]","[effect:none][func:pausemusic][noskip][func:Face10]...","[effect:none][noskip][func:Face1]Well...","[effect:none][noskip][func:Face9]I-[w:20] should have\ncreated an exit\nstrategy...","[effect:none][noskip][func:Face5]...","[effect:none][noskip][func:Face4]I believe the choice\nis your's now[w:20],[func:Face1] human.","[effect:none][noskip][func:Face12]But I think I already\nknow what it is...","[effect:none][noskip]...","[effect:none][noskip][func:Face9]Humans never cared\nabout monsters...","[effect:none][noskip][func:Face3]So just take my life.","[effect:none][noskip][func:Face7]Won't be the first\nyour kind has taken..."})
			enemies[1].SetVar("ShieldDown",true)
			enemies[1].SetVar("def",-999999)
			State("ENEMYDIALOGUE")
			commands = {"Check"}
			enemies[1].SetVar("name","[color:ffff00]Wronskian")
			ZXA = true
		end
		possible_attacks = {"Blank"}
	end
	if Turn == 1 and GetCurrentState() == "ACTIONSELECT" and M1 == false then
		Audio.LoadFile("return-of-the-star--dekasgeno-s-version-")
		Audio.Volume(1)
		Audio.Pitch(1)
		M1 = true
	end
	if Turn == 2 then
		enemies[1].SetVar("comments",{"Wronskian is building something.","Smells like oil.","Saws[w:10], blades[w:10], spikes[w:10], fire.","Smoke surrounds the area.","Gears are turning.","Wronskian doesn't seem to care."})
	end
end
function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
	require "Animations/Wronskian"
	Inventory.AddCustomItems({"LegChoco","Cake","CPChip","PSpaghetti","APP_le","FastFood"}, {0,0,0,0,0,0})
    Inventory.SetInventory({"LegChoco","Cake","FastFood","CPChip","CPChip","APP_le","APP_le","PSpaghetti"})
	Audio.Volume(1)
	Audio.Pitch(1)
	Audio.LoadFile("chara-s-genocide")
	Skip = false
	enemies[1].SetVar('currentdialogue', {"[effect:none]...","[effect:none]C[w:5]a[w:5]l[w:4]i[w:4]b[w:3]r[w:3]a[w:2]t[w:2]i[w:1]n[w:1]g[w:0]!","[effect:none]Mhm.","[effect:none]Systems checked...","[func:State,ACTIONSELECT]"})
	State("ENEMYDIALOGUE")
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
end

function HandleItem(ItemID)
    if ItemID == "LEGCHOCO" then
		BattleDialog({"You ate the Legendary Chocolate.[w:10]\nToo good for this world.[w:5]\nYour HP overflowed."})
		Player.ForceHP(30)
		Player.Heal(30)
	elseif ItemID == "CAKE" then
		if Player.hp >= 10 then
			BattleDialog({"You ate the tear cake.\nIt's weirdly salty.\nYour HP maxed out."})
			Player.Heal(10)
		elseif Player.hp < 10 then
			BattleDialog({"You ate the tear cake.\nIt's weirdly salty.\nYou recovered 10 HP."})
			Player.Heal(10)
		end
	elseif ItemID == "CPCHIP" then
		if Player.hp >= 12 then
			BattleDialog({"You ate the CPU Chip.\nYour HP maxed out."})
			Player.Heal(8)
		elseif Player.hp < 12 then
			BattleDialog({"You ate the CPU Chip.\nYou recovered 8 HP."})
			Player.Heal(8)
		end
	elseif ItemID == "PSPAGHETTI" then
		if Player.hp >= 15 then
			BattleDialog({"You ate Papyrus's Spaghetti.\nYour HP maxed out.[w:10]\nIt wasn't that bad..."})
			Player.Heal(5)
		elseif Player.hp < 15 then
			BattleDialog({"You ate Papyrus's Spaghetti.\nYou recovered 5 HP.[w:10]\nIt wasn't that bad..."})
			Player.Heal(5)
		end
	elseif ItemID == "APP_LE" then
		if Player.hp >= 14 then
			BattleDialog({"You ate the APP_le.\nVery addicting...\nYour HP maxed out."})
			Player.Heal(6)
		elseif Player.hp < 14 then
			BattleDialog({"You ate the APP_le.\nVery addicting...\nYou recovered 5 HP."})
			Player.Heal(6)
		end
	elseif ItemID == "FASTFOOD" then
		if Player.hp >= 5 then
			BattleDialog({"You caught the Fast Food.\nYour HP maxed out."})
			Player.Heal(15)
		elseif Player.hp < 5 then
			BattleDialog({"You caught the Fast Food.\nYou recovered 15 HP."})
			Player.Heal(15)
		end
	end
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	Turn = Turn + 1
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
	if enemies[1].GetVar("Attack") == 27 then
		SetGlobal("SPARE",true)
		enemies[1].SetVar("currentdialogue", {"Wait...","[func:Face11]You want to spare\nme?","I-[w:20] Why?","[func:Face5]...","[func:Face8]Maybe you aren't as\nbad as I thought...","[func:Face4]I-","[func:Face1]Ok...","I'll spare you[w:10], too.","[func:Face8]It's that or death[w:20],\nright?","Heh...","[func:State,ACTIONSELECT]"})
	end
	if enemies[1].GetVar("Attack") == 26 then
		enemies[1].SetVar("currentdialogue",{"[effect:none]..."})
	end
	if enemies[1].GetVar("Attack") < 26 then
		if Spare == 0 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]..."})
		elseif Spare == 1 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]Mmm...","[effect:none][func:Face11]You don't understand\nwhy I am here?[w:10][func:Face1] I have\nsaid it before."})
		elseif Spare == 2 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]I'll make it simple for\nyou.","[effect:none]I was hired to\n[waitall:3]KILL YOU."})
		elseif Spare == 3 then
			enemies[1].SetVar("currentdialogue",{"[func:Face9][effect:none]And I really do need\nthe money.","[effect:none][func:Face1]So you're not\ngetting off that\neasily."})
		elseif Spare == 4 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]Can you stop that?","[func:Face12][effect:none]It's annoying."})
		elseif Spare == 5 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]You're just going to\n[color:ff0000]get me mad[color:000000], annoying\nme."})
		elseif Spare == 6 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]...","[effect:none]Unable to respond\nto the simplest\nrequest[w:15],[func:Face11] Mm?"})
			MoveScreen = false
		elseif Spare == 7 then
			enemies[1].SetVar("currentdialogue",{"[func:Face7][effect:none]..."})
			MoveScreen = false
		elseif Spare == 8 then
			enemies[1].SetVar("currentdialogue",{"[effect:none]No wonder it was\nfabled that humans\nare smart...","[func:Face9][effect:none]By your actions[w:10], it's\njust a myth.","[effect:none]In your language[w:10],[func:Face1] I'm\ncalling you an idiot."})
		end
		Spare = Spare + 1
	end
	State("ENEMYDIALOGUE")
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