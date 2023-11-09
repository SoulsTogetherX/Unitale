-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "Chivalry Stands proudly!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"StartAttack"}
wavetimer = 99999
arenasize = {155, 130}
Music = 1
Turn = 0
TIME = 0
J = 0
Q = 0
spare = 0
spare2 = 0
SetGlobal("PacEnd",false)
enemies = {
"Chivalry"
}

enemypositions = {
{0, 0}
}

StartAttack = {"StartAttack"} --StartAttack
W1 = {"Fire-A-Way","SwordSlash","HighSwipe","WhiteDare"}
W2 = {"SideSlasher","KnifeKite","TurnedSword","TheBlueSword","SideStrike(Easy)"}
W3 = {"CircleSpread","KnifeStick","KnifeCollision","RedCut","TrickKnife"}
W4 = {"UnderCut","RedDare","NotVeryKnife","SideStrike(Hard)","Fire-A-Way(Fast)"}
W5 = {"TurnedSword(Red)","TheRedSword","SideStrike(Very Hard)"}
FinalAttackG = {"FinalAttackG"}
FinalAttackP = {"FinalAttackP"}
SetGlobal("FAttack",false)

--possible_attacks = {"StartAttack","Fire-A-Way","SwordSlash","HighSwipe","SideSlasher","Predict","KnifeKite","TurnedSword","TheBlueSword","SideStrike(Easy)","CircleSpread","KnifeStick","KnifeCollision","RedCut","TrickKnife","UnderCut","RedDare","NotVeryKnife","SideStrike(Hard)","Fire-A-Way(Fast)","TurnedSword(Red)","TheRedSword","SideStrike(Very Hard)"}
SetGlobal("GenEnd",false)

function Update() 
	Animate()
	if enemies[1].GetVar("Turn") > Turn then
		Turn = enemies[1].GetVar("Turn")
	end
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
	--if Input.Menu >= 1 then
	--	State("ACTIONSELECT")
	--end
	if GetGlobal("PacEnd") == true and Z ~= 1 then
		enemies[1].SetVar("canspare",true)
		enemies[1].SetVar("currentdialogue",{"[func:pausemusic][func:Face1]Hmh...","I guess a promise is\na promise...","I guess were friends\nnow.","[func:Face9]Even after\neverything I did...","[func:Face3]...","[func:Face2]I'm sorry about\nthat...","...","But[w:10], [waitail:-2][func:Face1]HEY!","[func:Face5]I'll see you around\nright?","[func:Face1]Bye[w:10], I'll spare you\nnow..."})
		State("ENEMYDIALOGUE")
		Z = 1
	end
	if GetGlobal("GenEnd") == true and Q ~= 1 then 
		U = CreateSprite("Blank")
		Head.SetParent(U)
		Head.Set("Head3")
		Sword.SetParent(U)
		Body.Dust(playDust == true, removeObject == false)
		Push.remove()
		Rocks = CreateSprite("Rocks")
		Rocks.MoveTo(339.149993896484,283.39993896484)
		Rocks.alpha = 0
		if GetGlobal("DEAD2") ~= true then
			SetGlobal("Sweat",4)
			Player.ForceAttack(1, (math.random(math.floor(4*30),math.floor(5*30))))
			enemies[1].SetVar("currentdialogue",{"[noskip][func:Face3][func:pausemusic][w:120][next]","[noskip]...","[noskip]P[w:10]-PLEASE!","[noskip]D[w:10]-DON'T...","[noskip]Don't kill me..."})
			enemies[1].SetVar("hp",15)
			State("ENEMYDIALOGUE") 
		end
		Q = 1
	elseif GetGlobal("GenEnd") == true then
		Rocks.alpha = timer4/40 
		if timer4 <= 40 then
			Hand.Scale(2,2 - (timer4/35))
			Hand3.Scale(2,2 - (timer4/35))
		end
		if timer4 > 20 and timer4 <= 60 then
			Hand.MoveTo(Hand.x + Z1,Hand.y + Z2)
			Z1 = Z1 + 0.1
			Z2 = Z2 - 0.1
			Sword.MoveTo(Sword.x + V1,Sword.y + V2)
			V1 = V1 + 0.05
			V2 = V2 - 0.1
			Sword.rotation = -2.2*(timer4-20)
			if timer4 == 30 then
				Sword.SendToBottom()
			end
		end
		if timer4 > 40 and timer4 <= 80 then
			Hand3.MoveTo(Hand3.x,Hand3.y - 2)
		end
		if timer4 > 40 and timer4 < 110 then
			Head.MoveTo(Head.x + X,Head.y + Y)
			X = X + 0.01
			Y = Y - 0.1
			Head.rotation = -0.6*(timer4-40)
		end
		timer4 = timer4 + 1
	end
	if GetGlobal("GenEnd") ~= true and enemies[1].GetVar("canspare") == false then 
		if GetGlobal("FAttack") == false and enemies[1].GetVar("Mad") == false then
			if Turn == 0 then
				possible_attacks = StartAttack
			elseif Turn > 0 and Turn <= 4 then
				possible_attacks = W1
			elseif Turn == 5 then
				possible_attacks = {"Predict"}
			elseif Turn > 5 and Turn <=  12 then
				possible_attacks = W2
			elseif Turn > 12 and Turn <= 19 then
				possible_attacks = W3
			elseif Turn > 19 then
				possible_attacks = W4
			end
		elseif GetGlobal("FAttack") == false and enemies[1].GetVar("Mad") == true and GetCurrentState() ~= "DEFENDING" then
			possible_attacks = W5
		elseif GetGlobal("FAttack") == true and enemies[1].GetVar("Mad") == true and GetCurrentState() ~= "DEFENDING" then
			possible_attacks = FinalAttackG
		elseif GetGlobal("FAttack") == true and enemies[1].GetVar("Mad") == false and GetCurrentState() ~= "DEFENDING" then
			possible_attacks = FinalAttackP
		end
	else
		possible_attacks = {"B"}
		nextwaves = {"B"}
	end
	if Turn >= 2 and GetGlobal("GenEnd") == false and GetGlobal("PacEnd") == false then
		if enemies[1].GetVar("HasSword") == true then
			enemies[1].SetVar("comments",{"Chivalry looks like she is\rhaving fun.","Chivalry went for a fast attack.","Smells like sword polish.","Chivalry looks as if she isn't\rtrying."})
			enemies[1].SetVar("randomdialogue",{"..."})
			enemies[1].SetVar("def",99)
			if GetCurrentState() ~= "ENEMYDIALOGUE" then
				SetGlobal("Face",1)
			end
		elseif enemies[1].GetVar("HasSword") == false and enemies[1].GetVar("Mad") == false then
			enemies[1].SetVar("comments",{"Chivalry is looking for her\rsword.","Chivalry doesn't pay mind to your\ractions.","You can't spot Chivalry's lucky\rsword."})
			enemies[1].SetVar("randomdialogue",{"[func:Face2]Come on[w:10], It's\nsomewhere!","[func:Face2]Where is it!","[func:Face2]No[w:10], I already\nchecked there!","[func:Face2]Stone Breaker[w:10],\nwhere are you!","[func:Face2]Are you here?","[func:Face2]Are you under here?","[func:Face2]Are you up here,\nStone Breaker?","[func:Face2]Please be here!","[func:Face4]SHOW YOURSELF\nSTONE BREAKER!","[func:Face2]You have to be\nhere!","[func:Face2]Are you over there,\nStone Breaker?","[func:Face2]Did it fall down\nhere?","[func:Face4]...","[func:Face2]Mmmm...","[func:Face4]AHHH, COME ON!","[func:Face2]Over here?","[func:Face2]Under there?","[func:Face1]Is that it![w:25]\n[func:Face2]Sigh[w:10], no."})
			enemies[1].SetVar("def",8)
			if GetCurrentState() ~= "ENEMYDIALOGUE" then
				SetGlobal("Face",2)
			end
		elseif enemies[1].GetVar("HasSword") == false and enemies[1].GetVar("Mad") == true then
			enemies[1].SetVar("comments",{"Chivalry is mad.","She isn't in the mood for you\rnow.","She isn't even thinking about her\rsword.","She want to KILL you."})
			enemies[1].SetVar("randomdialogue",{"[func:Face4]..."})
			enemies[1].SetVar("def",8)
			if GetCurrentState() ~= "ENEMYDIALOGUE" then
				SetGlobal("Face",4)
			end
		end
	elseif GetGlobal("PacEnd") == true then
		enemies[1].SetVar("comments",{"..."})
		enemies[1].SetVar("randomdialogue",{"..."})
		enemies[1].SetVar("def",-999999)
		enemies[1].SetVar("commands",{"Check"})
	end
end
function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
    require "Animations/Chivalry"
	Inventory.AddCustomItems({"Shank","LegChoco","SnowPiece","StocOnoin","B. Candy","AppleSauce"}, {0,0,0,0,0,0})
    Inventory.SetInventory({"SnowPiece","Shank","Shank","LegChoco","StocOnoin","B. Candy","B. Candy","AppleSauce"})
	Audio.LoadFile("chara-s-genocide")
	Audio.Volume(1)
	Audio.Pitch(1)
	enemies[1].SetVar('currentdialogue', {"[func:Face5]Get ready human!","It's your time to\nshow your metal!"})
	State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    if ItemID == "SHANK" then
		if Player.hp < 12 then
			BattleDialog({"You ate the Shank Kabob.[w:10]\nIt has a very sharp taste.[w:5]\nYou recovered 8 HP."})
			Player.Heal(8)
		else
			BattleDialog({"You ate the Shank Kabob.[w:10]\nIt has a very sharp taste.[w:5]\nYour HP was maxed out."})
			Player.Heal(8)
		end
    elseif ItemID == "LEGCHOCO" then
		BattleDialog({"You ate the Legendary Chocolate.[w:10]\nToo good for this world.[w:5]\nYour HP overflowed."})
		Player.ForceHP(30)
		Player.Heal(30)
		Player.MoveTo(99999,99999,true)
    elseif ItemID == "SNOWPIECE" then
		BattleDialog({"You ate the Snowman Piece.[w:5]\nYou monster.[w:5]\nYour HP was maxed out."})
		Player.Heal(45)
    elseif ItemID == "STOCONOIN" then
		if Player.hp < 15 then
			BattleDialog({"You ate the Stoic Onion.\n[w:5]You recovered 5 HP."})
			Player.Heal(5)
		else
			BattleDialog({"You ate the Stoic Onion.\n[w:5]Your HP was maxed out."})
			Player.Heal(5)
		end
    elseif ItemID == "B. CANDY" then
		if Player.hp < 17 then
			BattleDialog({"You ate the Bad Candy.\n[w:5]You recovered 3 HP."})
			Player.Heal(3)
		else
			BattleDialog({"You ate the Candy.\n[w:5]Your HP was maxed out."})
			Player.Heal(3)
		end
    elseif ItemID == "APPLESAUCE" then
		if Player.hp < 9 then
			BattleDialog({"You applied the sauce onto the\rapple.\n[w:5]You recovered 11 HP."})
			Player.Heal(11)
		else
			BattleDialog({"You applied the sauce onto the\rapple.\n[w:5]Your HP was maxed out."})
			Player.Heal(11)
		end
    end
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
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
	if GetGlobal("GenEnd") == false and enemies[1].GetVar("canspare") == false then
		if enemies[1].GetVar("Mad") == false and enemies[1].GetVar("HasSword") == true then
			if spare == 0 then
				enemies[1].SetVar("currentdialogue",{"[next]","[func:Face5]Heh[w:20], human...","I'm a Royal Guard\nwomen.","[func:Face2]Not going to happen."})
			elseif spare == 1 then
				enemies[1].SetVar("currentdialogue",{"[func:Face2]Sorry[w:10],[func:Face1] I'm not sorry.","That isn't going to\nhappen."})
			elseif spare == 2 then
				enemies[1].SetVar("currentdialogue",{"[func:Face7]Is this how you\nusually deal with\nyour problems?","How did you even\nmake it this far?","[func:Face9]You got past\nGreater Dog[w:20], right.","[func:Face7]That must have\ntaken some effort."})
			elseif spare == 3 then
				enemies[1].SetVar("currentdialogue",{"[func:Face2]...","Sigh[w:10],[func:Face9] look.","[func:Face2][color:ff0000]Undyen's orders[color:000000] were\nvery specific.","[color:ff0000]I can't disobey them[color:000000]."})
			elseif spare == 4 then
				enemies[1].SetVar("currentdialogue",{"[func:Face9]Or rather[w:10], I don't\nwant to disobey\nthem."})
			elseif spare == 5 then
				enemies[1].SetVar("currentdialogue",{"[func:Face2]..."})
			elseif spare == 6 then
				enemies[1].SetVar("currentdialogue",{"[func:Face9]You can understand\nright?"})
			elseif spare == 7 then
				enemies[1].SetVar("currentdialogue",{"[func:Face9]Ummm..."})
			elseif spare == 8 then
				enemies[1].SetVar("currentdialogue",{"[func:Face2]..."})
			end
			spare = spare + 1 
		elseif enemies[1].GetVar("Mad") == true then
			if spare2 == 0 then
				enemies[1].SetVar("currentdialogue",{"[func:Face4]Mercy?","Really?"})
			elseif spare2 == 1 then
				enemies[1].SetVar("currentdialogue",{"[func:Face4]How about no?"})
			end
			spare2 = spare2 + 1
		end
	elseif enemies[1].GetVar("canspare") == true then
		SetGlobal("SPARE",true)
		Body.color32 = {198, 198, 198}
		Head.color32 = {198, 198, 198}
		Hand.color32 = {198, 198, 198}
		Hand2.color32 = {198, 198, 198}
		Sword.color32 = {198, 198, 198}
		Hand3.color32 = {198, 198, 198}
		if Push.isactive == true then
			Push.color32 = {198, 198, 198}
		end
		if Rocks ~= nil and Rocks.isactive == true then
			Rocks.color32 = {198, 198, 198}
		end
		Head.Set("Head8")
	end
    State("ENEMYDIALOGUE")
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