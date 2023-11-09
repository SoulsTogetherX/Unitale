-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "A warrior of time and space\rconfronts you." --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"BendStar"}
wavetimer = 99999
At = false
Z = false
flee = false
item = 0
timer = 0
spare = 0
SetGlobal("Turn",0)
SetGlobal("Spare",false)
SetGlobal("Force1HP",false)
SetGlobal("Blank2",0)
arenasize = {155, 130}

enemies = {
"Esrevinu"
}
Body = CreateSprite("E1")
Body.MoveTo(320,340)
Head = CreateSprite("Face1")
Head.MoveTo(Body.x,Body.y)
Head.SetVar("Animation",false)
Head.SetParent(Body)
Block = CreateSprite("Shield0")
Block.MoveTo(320,600)
Block.Scale(5,5)
SetGlobal("Nothing",false)

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
All = {"StarSmall","BendStar","WarpDown","StarField","WarpUp","SpaceDust","Comet","Warn","PauseStar","PlanetBurst","StarWave","ArcFindingStars","DustPause","StarBoom","FallingStars","StarWays","StarSwarm","CircleStar","SideComets","ArenaCrush","ArcFindingStarsPause","Blackhole","StarShrine","UniverseDestruction","ClosedSpace","DustyStars","Starz"}
FirstA = {"First Attack"}
--FirstA = {"ArenaCrush"} -- for testing
S1 = {"StarSmall","BendStar","WarpDown","StarField"}
S2 = {"WarpUp","SpaceDust","Comet","Warn","PauseStar","PlanetBurst","StarWave"}
S3 = {"ArcFindingStars","StarBoom","FallingStars","StarWays","StarSwarm","CircleStar"}
S4 = {"SideComets","ArenaCrush","ArcFindingStarsPause","Blackhole","StarShrine"}
S5 = {"UniverseDestruction","ClosedSpace","DustyStars","Starz"}
FinalA = {"Final Attack"}
possible_attacks = {}
Stars = {}
Starz = {}
bg = {}

for i=1,100 do
	local S = CreateSprite("Pixel","Bottom")
	local M = math.random(1,4)
	S.Scale(M, M)
	S.SetVar("SH",math.random(0,650))
	S.SetVar("SV", math.random(0,450)) 
	S.SetVar("Sparkle", math.random()*3000)
	S.MoveTo(S.GetVar("SH"),S.GetVar("SV"))
	table.insert(Starz,S)
end

function EnteringState(newstate, oldstate)
	if newstate == "DEFENDING" then
		for i=1,#Stars do
			local S = Stars[i]
			S.SetVar("Del",true)
		end
		for i=1,#bg do
			local S = bg[i]
			S.SetVar("Del",true)
		end
	elseif newstate != "ENEMYDIALOGUE" and oldstate == "ENEMYDIALOGUE" then
		for i=1,#Stars do
			local S = Stars[i]
			S.SetVar("Del",true)
		end
		for i=1,#bg do
			local S = bg[i]
			S.SetVar("Del",true)
		end
	end
end

function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
    require "Animations/Esrevi_Nu_A"
	Inventory.AddCustomItems({"LegChoco","AstroFood","Mars","HushPuppy","Crackers"}, {0,0,0,0,0})
    Inventory.SetInventory({"LegChoco","AstroFood","AstroFood","Mars","Mars","HushPuppy","Crackers"})
	Audio.LoadFile("chara-s-genocide")
	Player.lv = 16
	Player.ForceHP(80)
	if GetRealGlobal("Intro") ~= true then
		enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][w:10].[w:10].[w:10].","[voice:v_Esrevinu]You...","[effect:none][voice:v_Esrevinu][func:Face7]How do I put this.","[effect:none][func:Face1][voice:v_Esrevinu]...","[effect:none][voice:v_Esrevinu]I have recently\nfound something[w:20],\nstrange changing\ntime.","[effect:none][voice:v_Esrevinu]I have studied it for\na while now.","[effect:none][voice:v_Esrevinu]And with that\nresearch[w:20], I found it\nwas[w:5],[func:Face7] or is[w:5], being...","[effect:none][func:Face1][voice:v_Esrevinu]...manipulated.","[effect:none][voice:v_Esrevinu]I studied many life-\nforms[w:10], in many\ntimelines[w:10], for [func:Face7]this...","[effect:none][voice:v_Esrevinu]...anomaly in time.","[effect:none][voice:v_Esrevinu]Which lead me to[w:20]\n[func:Face8]you.","[effect:none][voice:v_Esrevinu][func:Face1]I don't know how you\ncan do this.","[effect:none][voice:v_Esrevinu]...[func:Face7]predict the future,\n[w:25][func:Face1]maybe change it...","[effect:none][voice:v_Esrevinu]Or how that's even\npossible.","[effect:none][voice:v_Esrevinu]But almost everytime\nI see you[w:10],[func:Face7] I see that\n[w:10]expresstion.","[effect:none][func:Face1][voice:v_Esrevinu]The expression that\nyou already seen\nthis[w:10], before you saw\nit.","[effect:none][voice:v_Esrevinu]The expression that\nyou already did this[w:10],\nwithout doing it.","[effect:none][voice:v_Esrevinu]Of course[w:5], [func:Face7]I don't\nknow if this is true.","[effect:none][voice:v_Esrevinu][func:Face1]My memories are\nerased like any\nother.","[effect:none][voice:v_Esrevinu]So I [w:15][func:Face8]HAVE[w:10] to assume.","[effect:none][voice:v_Esrevinu][func:Face1]This power you have[w:20],\nit erases everyone's\nmemories...","[effect:none][voice:v_Esrevinu]...even in other\ntimelines and\ndimensions.","[effect:none][voice:v_Esrevinu]Such as myself.","[effect:none][voice:v_Esrevinu][func:Face5]No one deserves\nthis power.","[effect:none][func:Face1][voice:v_Esrevinu]I don't even have\nthat power!","[effect:none][voice:v_Esrevinu][func:Face5]And I am the\nguardian of Time and\nSpace itself!","[effect:none][func:Face1]...","[effect:none][voice:v_Esrevinu]So you see[w:10], I MUST\nassume.","[effect:none][voice:v_Esrevinu][w:10].[w:10].[w:10].","[effect:none][voice:v_Esrevinu]I am sorry if you\nare not this being.","[effect:none][voice:v_Esrevinu]But that is the\nprice we pay for [w:10][func:Face8]A[w:20]\nfuture!","[effect:none][func:Face1][voice:v_Esrevinu][noskip]Goodbye."})
		State("ENEMYDIALOGUE")
		SetRealGlobal("Intro", true)
	else
		enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][w:10].[w:10].[w:10].","[effect:none][voice:v_Esrevinu][func:Face2]Your face...","[effect:none][func:Face1][voice:v_Esrevinu][w:10].[w:10].[w:10].","[effect:none][voice:v_Esrevinu]Well[w:10],[func:Face8] let's get\nstarted.","[noskip][effect:none][voice:v_Esrevinu][func:Face1]Goodbye."})
		State("ENEMYDIALOGUE")
	end
end

function HandleItem(ItemID)
    if ItemID == "ASTROFOOD" then
		if Player.hp < 59 then
			BattleDialog({"You eat the Astronaut Food.\nYou recovered 21 HP."})
			Player.Heal(21)
		else
			BattleDialog({"You eat the Astronaut Food.\nYour HP was maxed out."})
			Player.Heal(21)
		end
    elseif ItemID == "MARS" then
		if Player.hp < 22 then
			BattleDialog({"You dipped the Chocolate mars\rbar in the milky way.\nTastes like space.","You recovered 58 HP."})
			Player.Heal(58)
		else
			BattleDialog({"You dipped the Chocolate mars\rbar in the milky way.\nTastes like space.","Your HP was maxed out."})
			Player.Heal(58)
		end
    elseif ItemID == "LEGCHOCO" then
		BattleDialog({"You ate the Legendary Chocolate.[w:10]\nToo good for this world.[w:5]\nYour HP overflowed."})
		Player.ForceHP(120)
		Player.Heal(120)
		Player.MoveTo(99999,99999,true)
    elseif ItemID == "HUSHPUPPY" then
		if Player.hp < 15 then
			BattleDialog({"You eat the Hush Puppy.\nDog-magic is neutralized.\nYou recovered 65 HP."})
			Player.Heal(65)
		else
			BattleDialog({"You eat the Hush Puppy.\nDog-magic is neutralized.\nYour HP was maxed out."})
			Player.Heal(65)
		end
    elseif ItemID == "CRACKERS" then
		if Player.hp < 40 then
			BattleDialog({"You ate the Crackers...\nVery salty...\nYou recovered 40 HP."})
			Player.Heal(40)
		else
			BattleDialog({"You ate the Crackers...\nVery salty...\nYour HP was maxed out."})
			Player.Heal(40)
		end
    end
end

function Update()
	timer = timer + 1
	Animate()

	-- FOR all you cheaters
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

	if GetGlobal("Force1HP") == true then
		Player.ForceHP(1)
		SetGlobal("Force1HP", false)
	end
	if GetGlobal("Turn") >= 1 then
		enemies[1].SetVar("comments",{"You wonder how you are breathing\rin space.","You see Earth.[w:20]\nHello Earth!","Void...","Smells like nothing...","Everything is getting farther\rapart..."})
	end
	if GetGlobal("DONE") == true then 
		State("DONE")
	end
	if GetGlobal("DEFENDING") == true then
		State("PAUSE")
		SetGlobal("DEFENDING",false)
	end
	for i=1,#bg do
		local S = bg[i]
		if S.isactive == true then
			S.Scale(S.GetVar("X"), 3)
			if S.GetVar("Del") == false then
				S.SetVar("X", S.GetVar("X") + 0.5)
			end
			S.MoveTo(S.GetVar("SH"),S.GetVar("SV"))
			if S.GetVar("SH") > 0 then
				S.SetVar("SH", S.GetVar("SH") - S.GetVar("SS"))
			else
				S.SetVar("SS", math.random(6,12))
				S.SetVar("SH", 650)
				S.SetVar("SV", math.random(50,450))
				S.SetVar("X", 0)
			end
			if S.GetVar("Del") == true then
				S.SetVar("X", S.GetVar("X") - 0.3)
				if S.GetVar("X") <= 0 then
					S.remove()
				end
			end
		end
	end
	for i=1,#Stars do
		local S = Stars[i]
		if S.isactive == true then
			S.alpha = S.GetVar("A")
			S.MoveTo(S.GetVar("SH"),S.GetVar("SV"))
			if S.GetVar("SH") > 0 then
				S.SetVar("SH", S.GetVar("SH") - S.GetVar("SS"))
			else
				S.SetVar("SS", math.random(3,8))
				S.SetVar("SH", 650)
				S.SetVar("SV", math.random(50,450))
			end
			if S.GetVar("A") < 1 and S.GetVar("Del") == false then
				S.SetVar("A",S.GetVar("A") + (1/30))
			end
			if S.GetVar("Del") == true then
				S.SetVar("A", S.GetVar("A") - 1/30)
				if S.GetVar("A") <= 0 then
					S.remove()
				end
			end
		end
	end
	for i=1,#Starz do
		local S = Starz[i]
		if timer >= S.GetVar("Sparkle") then 
			S.SetAnimation({"Pixel", "StarSparkle1", "StarSparkle2","StarSparkle3","Pixel","Pixel","Pixel"},1/10) 
			S.loopmode = "ONESHOT"
			S.SetVar("Sparkle", math.random()*3000 + timer)
		end
	end
	if GetGlobal("DONE") == false then
		if GetGlobal("Nothing") == true then
			possible_attacks = {"Nothing"}
		elseif GetGlobal("Blank2") == 1 or GetGlobal("Blank2") == 2 then
			possible_attacks = {"Blank2"}
		elseif GetGlobal("Blank2") == 99 then
			possible_attacks = {"Kill_Player"}
		elseif GetGlobal("Turn") == 0 then
			possible_attacks = FirstA
		elseif GetGlobal("Turn") > 0 and GetGlobal("Turn") <= 6 and GetGlobal("Last_attack") == false then
			possible_attacks = S1
		elseif GetGlobal("Turn") > 6 and GetGlobal("Turn") <= 11 and GetGlobal("Last_attack") == false then
			possible_attacks = S2
		elseif GetGlobal("Turn") > 11 and GetGlobal("Turn") <= 17 and GetGlobal("Last_attack") == false then
			possible_attacks = S3
		elseif GetGlobal("Turn") > 17 and GetGlobal("Turn") <= 21 and GetGlobal("Last_attack") == false then
			possible_attacks = S4
		elseif GetGlobal("Turn") > 21 and GetGlobal("Last_attack") == false then
			possible_attacks = S5
		elseif GetGlobal("Last_attack") == true then
			possible_attacks = FinalA
			Next = true
		end
	end
	if GetGlobal("Spare") == true then
		enemies[1].SetVar('comments', {"Esrevi Nu is sparing you"})
	end
	-- IF YOU FIGHT DIALOG \/
	if GetGlobal("N") == false and GetGlobal("Spare") == false and GetGlobal("DoNotSay") == false then
		if enemies[1].GetVar("Attack") == 1 and GetGlobal("At") == false and enemies[1].GetVar("Miss") < 7 then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Nice try...","[effect:none][voice:v_Esrevinu]...","[effect:none][voice:v_Esrevinu][func:Face7]Looks like you want\na fight.","[effect:none][voice:v_Esrevinu][func:Face1]I don't blame you..."})
			At = true
		elseif enemies[1].GetVar("Attack") == 1 and GetGlobal("At") == false and enemies[1].GetVar("Miss") >= 7 then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][func:Face2]Hey...","[effect:none][func:Face7][voice:v_Esrevinu]...","[effect:none][func:Face1][voice:v_Esrevinu]I though you were\nmissing me on\npurpose!"})
			Z = true
			At = true
		elseif enemies[1].GetVar("Attack") == 2 and GetGlobal("At") == false and (item > 0 or Player.hp < 80 ) and Z == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Still[w:5], what's truly\ninteresting is that\nmy attacks can kill a\nperson in one hit...","[effect:none][voice:v_Esrevinu]...but you can\nsurvive somehow.","[effect:none][voice:v_Esrevinu][func:Face7]M[w:2]m[w:2]m[w:2].[w:2].[w:2]."})
			At = true
		elseif enemies[1].GetVar("Attack") == 2 and GetGlobal("At") == false and item == 0 and Player.hp >= 80 and Z == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]You have fast\nreflexes...","[effect:none][voice:v_Esrevinu]Some people have\nsurvived my attacks\nbefore...","[effect:none][voice:v_Esrevinu]But no one has ever\ndodged even a few\nof my projects.","[effect:none][voice:v_Esrevinu]Regardless of your\ntime manipulation\nability[w:5], I give my\nhonest praise."})
			At = true
		elseif enemies[1].GetVar("Attack") == 2 and Z == true then
			enemies[1].SetVar("Attack",3)
		elseif enemies[1].GetVar("Attack") == 3 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]But[w:5], that doesn't\nmatter.","[effect:none][voice:v_Esrevinu][func:Face5]I will fight[w:10], even if\nthis is my last\nbattle...","[effect:none][voice:v_Esrevinu][func:Face1]I must protect\nSpace and Time\nfrom people like [func:Face5][w:10]Y[w:2]O[w:2]U[w:2].","[effect:none][voice:v_Esrevinu][func:Face1]Or[w:5], what I think you\nare at least."})
			At = true
		elseif enemies[1].GetVar("Attack") == 4 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][func:Face7]You have to be\nsomewhat insane or\nevil to try and\ncontrol these...","[effect:none][voice:v_Esrevinu][func:Face1]Magnitudes of\nexistence and\nhistory.","[effect:none][voice:v_Esrevinu]Space and time[w:5], if\nyou will."})
			At = true
		elseif enemies[1].GetVar("Attack") == 5 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Ah[w:5], yes...","[effect:none][voice:v_Esrevinu]The subjects of\nSpace and Time.","[effect:none][voice:v_Esrevinu]Topics treated like\nthe gods of the\nunknown.","[effect:none][voice:v_Esrevinu]However[w:5], they are\nnot as special as\nsome may think."})
			At = true
		elseif enemies[1].GetVar("Attack") == 6 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]If anything...","[effect:none][voice:v_Esrevinu]They are just\nthemselves.","[effect:none][voice:v_Esrevinu][func:Face8][w:2].[w:2].[w:2].","[effect:none][voice:v_Esrevinu][func:Face7]It's how they\ninteract[w:10]: that's what\nmakes man and\nmonster baffled."})
			At = true
		elseif enemies[1].GetVar("Attack") == 7 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Space is an illusion...","[effect:none][voice:v_Esrevinu]Only of stucture and\nsecurity.","[effect:none][voice:v_Esrevinu]Time is[w:4][func:Face7].[w:4].[w:3].[w:2]well[w:4].[w:4].[w:3]."})
			At = true
		elseif enemies[1].GetVar("Attack") == 8 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][w:2].[w:2].[w:2].","[effect:none][voice:v_Esrevinu]Time is a power.","[effect:none][voice:v_Esrevinu]...a force.","[effect:none][voice:v_Esrevinu]In simpler terms, a\nwill to [w:10]CONTINUE."})
			At = true
		elseif enemies[1].GetVar("Attack") == 9 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Mmm...","[effect:none][voice:v_Esrevinu]Have you ever heard\nof Zeno's paradox of\nmotion?","[effect:none][voice:v_Esrevinu]It states that every\nframe of existence[w:5],\nall matter has\nstored energy.","[effect:none][voice:v_Esrevinu]The kind that allows\nus to describe an\nobject's motion...","[effect:none][voice:v_Esrevinu]But if we freeze\nexistence to one\nframe and look at it...[func:Face7]","[effect:none][voice:v_Esrevinu][func:Face1].[w:2].[w:2].[w:2]it's motionless."})
			At = true
		elseif enemies[1].GetVar("Attack") == 10 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][func:Face8]So riddle me this.","[effect:none][voice:v_Esrevinu][func:Face1]If everything is\nmotionless in every\ninfinitesimal frame...","[effect:none][voice:v_Esrevinu][func:Face7]What makes\nexistence move to\nits next frame?","[effect:none][func:Face1][voice:v_Esrevinu][w:10].[w:10].[w:10].","[effect:none][voice:v_Esrevinu][func:Face7]I might not be the\nbest explainer."})
			At = true
		elseif enemies[1].GetVar("Attack") == 11 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]But the answer?\n[w:20]It's time!","[effect:none][voice:v_Esrevinu][func:Face7]Literally...","[effect:none][func:Face1][voice:v_Esrevinu]How? [w:20]I don't know\nmyself...","[effect:none][voice:v_Esrevinu]But[w:5], I do know that\nmatter and time are the\ntwo key fundamental\nelements...","[effect:none][voice:v_Esrevinu]...of everything.[w:10]\n[func:Face5]...of[w:10] this[w:10] UNIVERSE.","[effect:none][func:Face7][voice:v_Esrevinu]And I swore to\nprotect them."})
			At = true
		elseif enemies[1].GetVar("Attack") == 12 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]However...","[effect:none][voice:v_Esrevinu]You somehow can\nreverse time...","[effect:none][voice:v_Esrevinu][w:2].[w:2].[w:2].","[effect:none][voice:v_Esrevinu][func:Face8]No[w:5], maybe you\naren't...","[effect:none][func:Face1][voice:v_Esrevinu]Maybe,[w:25] you're using\nsomething else..."})
			At = true
		elseif enemies[1].GetVar("Attack") == 13 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]The great Isaac\nNewton once said\nthat every\nforce...","[effect:none][voice:v_Esrevinu][func:Face7]...has an equal and\nopposite reaction/\nforce."})
			At = true
		elseif enemies[1].GetVar("Attack") == 14 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][func:Face7]This can be applied\nto motion[w:10], to the\nbutterfly effect...","[effect:none][voice:v_Esrevinu]So why can't it be\napplied to the\nforce of time?","[effect:none][func:Face1][voice:v_Esrevinu]But you know that\nalready[w:5], right?"})
			At = true
		elseif enemies[1].GetVar("Attack") == 15 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Ahhh[w:2].[w:2].[w:2].good[w:2], old\nIsacc Newton...","[effect:none][voice:v_Esrevinu]I always found that\nhumans were the\nsmartest and\nstrongest creatures.","[effect:none][voice:v_Esrevinu][func:Face8]But also the most\nfear-filled and rash."})
			At = true
		elseif enemies[1].GetVar("Attack") == 16 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]Monsters are more\nforgiving and\nneutral.","[effect:none][voice:v_Esrevinu][func:Face8]But are also weak\nand have a higher\ncapacity for\nemotions.","[effect:none][voice:v_Esrevinu][func:Face7]...like happiness[w:10], or\neven hate."})
			At = true
		elseif enemies[1].GetVar("Attack") == 17 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]So[w:5], humans attack\nout of fear and\nthreats.","[effect:none][voice:v_Esrevinu]While monster's\nattack out of spite\nand sometimes hope."})
			At = true
		elseif enemies[1].GetVar("Attack") == 18 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][w:10].[w:10].[w:10].","[effect:none][voice:v_Esrevinu][func:Face7]That is what your\ndoing[w:5], right?","[effect:none][voice:v_Esrevinu][func:Face1]Attacking out of\nfear?"})
			At = true
		elseif enemies[1].GetVar("Attack") == 19 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][w:2].[w:2].[w:2].","[effect:none][voice:v_Esrevinu][func:Face8]No...","[effect:none][voice:v_Esrevinu]Your expression\nholds a different\nstory.","[effect:none][voice:v_Esrevinu]A different tone...","[effect:none][func:Face7][voice:v_Esrevinu]It's not even false\nconfidence [func:Face1]you ware...","[effect:none][voice:v_Esrevinu]It's[w:2].[w:2].[w:2]."})
			At = true
		elseif enemies[1].GetVar("Attack") == 20 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]So what ARE you\ndoing?","[effect:none][voice:v_Esrevinu][func:Face5]Killing me for what?"})
			At = true
		elseif enemies[1].GetVar("Attack") == 21 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][w:2].[w:2].[w:2].","[effect:none][voice:v_Esrevinu]I now understand\nyour silence...","[effect:none][voice:v_Esrevinu][func:Face8]I need to stop\ntalking.","[effect:none][voice:v_Esrevinu]And start fighting."})
			At = true
		elseif enemies[1].GetVar("Attack") == 22 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][func:Face7]Though...","[effect:none][func:Face1][voice:v_Esrevinu]My shield has taken\na lot of damage.","[effect:none][voice:v_Esrevinu]...","[effect:none][voice:v_Esrevinu][func:Face7]This is getting\nconcerning."})
			At = true
		elseif enemies[1].GetVar("Attack") == 23 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu][waitall:5]......[func:Face2]!"})
			At = true
			enemies[1].SetVar("Def",-4000)
		elseif enemies[1].GetVar("Attack") == 24 and GetGlobal("At") == false then
			enemies[1].SetVar('currentdialogue', {"[effect:none][func:pausemusic][voice:v_Esrevinu][func:Face6]...","[effect:none][voice:v_Esrevinu]...","[effect:none][voice:v_Esrevinu]You're actually going\nto kill me[w:10], aren't\nyou?","[effect:none][voice:v_Esrevinu]...","[effect:none][func:Face1][voice:v_Esrevinu]O[w:2]-ok.","[effect:none][voice:v_Esrevinu]Yo[w:2]-you don't leave\nm[w:2]-me a choice then.","[effect:none][voice:v_Esrevinu][w:10].[w:10].[w:10].","[effect:none][func:Face5][voice:v_Esrevinu]Let's see if you can\navoid this!"})
			At = true
			SetGlobal("Last_attack",true)
		elseif enemies[1].GetVar("Attack") == 25 then
			enemies[1].SetVar('currentdialogue', {"[effect:none][noskip][func:pausemusic][func:Face2]...","[effect:none][waitall:10][func:Face6]...","[effect:none][func:Face1]You[w:10] defeated[w:10] a[w:10]\nliteral[w:10] dem[waitall:2]igod...","[effect:none][effect:shake,0.2][waitall:2]Heh[w:2] heh[w:2] heh...","[effect:none][effect:shake,0.2]Heheheheh...","[effect:shake,0.2][waitall:2][func:Face7][effect:none]Of course I couldn't\nkill you...","[effect:none][effect:shake,0.2][waitall:2][func:Face1]You could just\npredict my\nmovements...","[effect:none][effect:shake,0.3][waitall:2]Why didn't I run?","[effect:none][effect:shake,0.4][waitall:2]...","[effect:none][effect:shake,0.5][waitall:2]I know why.","[effect:none][effect:shake,0.5][waitall:3][func:Face5]It's because I\nactually care about\nthis world...","[effect:none][effect:shake,0.5][waitall:3.5]I lived to defend [effect:shake,1]\nSpace and Time.","[effect:none][effect:shake,0.2][waitall:3.5]...and now I will die\ndefending it...","[effect:none][effect:shake,0.3][waitall:2][func:Face1]I may have\nunderestimate you...","[effect:none][effect:shake,0.3][waitall:2][func:Face5]But I have no\nregrets...","[effect:none][effect:shake,0.2][waitall:2][func:Face1]...","[effect:none][effect:shake,0.2][waitall:2]However[w:5], what's\nscary is...","[effect:none][novoice][func:Face3]...that I bet you\ndon't have any\neither..."})
		end
	elseif GetGlobal("N") == true and GetGlobal("DoNotSay") == false then
		enemies[1].SetVar('comments', {"Esrevi Nu has low HP"})
		currentdialogue = {"[effect:none][noskip][func:pausemusic]...","[effect:none][noskip][effect:none][waitall:5]You...","[noskip][effect:none][waitall:5]Lived...","[noskip][effect:none][waitall:5][func:Face1]Heh...","[noskip][effect:none][waitall:5]Heh[w:2] heh[w:2] heh.","[noskip][effect:none][waitall:5]You[w:5] were[w:5] the[w:5] manipulator...","[noskip][effect:none][waitall:5]I[w:5] was[w:5] right.","[noskip][effect:none][waitall:5]And[w:5] now...","[noskip][effect:none][waitall:5]I[w:5] need[w:5] to[w:5] say[w:5] goodbye...","[noskip][effect:none]To[w:5] the[w:5] world[w:%] I[waitall:2]... [waitall:15]Failed[w:25][func:Face4]","[noskip][func:dead][next]"}
	elseif GetGlobal("Blank2") == 99 and GetGlobal("N") == false and GetGlobal("DoNotSay") == false then
		enemies[1].SetVar('comments', {"Esrevi Nu has low HP"})
		enemies[1].SetVar('currentdialogue', {"[noskip][effect:none][waitall:5][voice:v_Esrevinu]...","[noskip][effect:none][voice:v_Esrevinu]I think I understand\nnow...[w:20]\nYou won't die easily.", "[noskip][effect:none][voice:v_Esrevinu]In fact[w:5], I'm sure you\nbelieve yourself to\nbe invincible.","[noskip][effect:none][voice:v_Esrevinu]No matter what I do[w:5],\nyou'll keep moving\nthrough time and\nspace to survive.","[noskip][effect:none][voice:v_Esrevinu]In other words[w:5], you\nrely on abstract\nconcepts that don't\nbelong to you.","[noskip][effect:none][voice:v_Esrevinu]This is fortunate\nfor me...","[noskip][effect:none][voice:v_Esrevinu]...because those\nconcepts you rely\non...","[noskip][effect:none][voice:v_Esrevinu][func:Face5]...belong to me!","[noskip][effect:none][voice:v_Esrevinu]Let's see how well\nyou do without them!"})
	end

	if enemies[1].GetVar("Block1") == true then
		Block.Set("Shield1")
		Audio.PlaySound("Break2")
		enemies[1].SetVar("Block1",false)
	elseif enemies[1].GetVar("Block2") == true then
		Block.Set("Shield2")
		Audio.PlaySound("Break2")
		enemies[1].SetVar("Block2",false)
	end
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
	SetGlobal("A",false)
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	if enemies[1].GetVar("talk2") == 9 then
		SetGlobal("Nothing",true)
		enemies[1].SetVar("talk2",10)
	end
	if GetGlobal("Turn") == 0 then
		Audio.Pause()
	end
	if enemies[1].GetVar("Attack") == 25 then
		enemies[1].Call("Kill")
		SetGlobal("KILL",true)
	end
	if At == true then
		SetGlobal("At",true)
		enemies[1].SetVar('currentdialogue', {"[voice:v_Esrevinu]..."})
		At = false
	end
	if talk == 6 and Joke1 == 2 then
		Joke1 = 3
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
	SetGlobal("Turn",GetGlobal("Turn")+1)
	for i=1,10 do
		local S = CreateSprite("Pixel","Bottom")
		S.SetVar("SS",math.random(6,12))
		S.SetVar("SH",math.random(50,650))
		S.SetVar("SV", math.random(50,450))
		S.SetVar("X", math.random(1,14))
		S.SetVar("Del",false)
		table.insert(bg,S)
	end
	for i=1,10 do
		local M = math.random(1,4)
		if M > 0 and M <= 1 then
			local S = CreateSprite("Star","BelowUI")
			S.SetVar("SS",math.random(3,8))
			S.SetVar("SH",math.random(50,650))
			S.SetVar("SV", math.random(50,450))
			S.SetVar("A", 0)
			S.SetVar("Del",false)
			table.insert(Stars,S)
		elseif M > 1 and M <= 2 then
			local S = CreateSprite("Star","BelowArena")
			S.SetVar("SS",math.random(3,8))
			S.SetVar("SH",math.random(50,650))
			S.SetVar("SV", math.random(50,450))
			S.SetVar("A", 0)
			S.SetVar("Del",false)
			table.insert(Stars,S)
		elseif M > 2 and M <= 3 then
			local S = CreateSprite("Star","BelowPlayer")
			S.SetVar("SS",math.random(3,8))
			S.SetVar("SH",math.random(50,650))
			S.SetVar("SV", math.random(50,450))
			S.SetVar("A", 0)
			S.SetVar("Del",false)
			table.insert(Stars,S)
		elseif M > 3 and M <= 4 then
			local S = CreateSprite("Star","Top")
			S.SetVar("SS",math.random(3,8))
			S.SetVar("SH",math.random(50,650))
			S.SetVar("SV", math.random(50,450))
			S.SetVar("A", 0)
			S.SetVar("Del",false)
			table.insert(Stars,S)
		else
			local S = CreateSprite("Star","Top")
			S.SetVar("SS",math.random(3,8))
			S.SetVar("SH",math.random(50,650))
			S.SetVar("SV", math.random(50,450))
			S.SetVar("A", 0)
			S.SetVar("Del",false)
			table.insert(Stars,S)
		end
	end
end

function HandleSpare()
	if GetGlobal("Blank2") != 99 then
		if GetGlobal("Spare") == false and GetGlobal("REMOVE") == false then
			if spare == 0 then
				enemies[1].SetVar('currentdialogue', {"[effect:none][voice:v_Esrevinu]..."})
			elseif spare == 1 then
				enemies[1].SetVar('currentdialogue', {"[effect:none]..."})
			elseif spare == 2 then
				enemies[1].SetVar('currentdialogue', {"[effect:none][func:Face7]If...","[effect:none][func:Face1]...you're trying to\nspare me.,.","[effect:none][func:Face7]I'm sorry..."})
			elseif spare == 3 then
				enemies[1].SetVar('currentdialogue', {"[effect:none]I cannot spare you...","[effect:none]I have labeled you\nas a threat to\n[waitall:4]everything."})
			elseif spare == 4 then
				enemies[1].SetVar('currentdialogue', {"[effect:none]Unless you can [color:ff0000]prove\nto me you’re not[color:000000]...","[effect:none]I can't let you go..."})
			elseif spare == 5 then
				enemies[1].SetVar('currentdialogue', {"[effect:none]I can't let you go."})
			elseif spare >= 6 then
				enemies[1].SetVar('currentdialogue', {"[effect:none]..."})
			end
			spare = spare + 1
			State("ENEMYDIALOGUE")
		elseif GetGlobal("Spare") == true then
			SetGlobal("Animate",false)
			Body.Set("E2")
			Head.Set("E3")
			F = 0
			Block.remove()
		else
			enemies[1].SetVar('currentdialogue', {"[effect:none]..."})
		end
	else
		State("ENEMYDIALOGUE")
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
function Face8()
	SetGlobal("Face",8)
end
function pausemusic()
	Audio.Pause() 
end
function dead()
	SetGlobal("KILL",true)
end