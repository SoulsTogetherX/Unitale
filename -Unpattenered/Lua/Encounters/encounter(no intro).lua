-- A basic encounter script skeleton you can copy and modify for your own creations.
SetGlobal("Turn",0)
SetGlobal("Betray",0)
Turn = 0
timer = 0
FP = false
SetGlobal("Start", 0)
SetGlobal("Attack2", 0)
FinalAttack = false
SetGlobal("mercy", 0)
SetGlobal("Death",0)
SetGlobal("Live",0)
SetGlobal("end",0)
SetGlobal("MUSIC2",0)
noattack = false
a = true
SetGlobal("b",0)
c = 0
d = 0
e = false
f = false
g = false
h = 0
J = 0
k = 0
L = 0
O = 0
n = 0
SetGlobal("m",0)
SetGlobal("P",0)
Q = 0
X = 0
Z = 0
Music = 1
SetGlobal("L",0)
-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "A unpatterned monster spots you." --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"Fill"}
easywaves = {"Patter","Extend1","Extend2","Fill"}
Waves1 = {"spikes_up","spikes_right","Circle","Beams"}
Waves2 = {"Stop,Move","spikes_right_and_up","Knife_slicer","SideBullets(easy)"}
Waves3 = {"Slash","BlackOut","Beam","2 Chasers","Ex-plo-tion"}
Waves4 = {"ReactKnife","TowardsPlayer","BulletStop","CrasherDash"}
Waves5 = {"4 Chasers","Small_Circle","SideCircle","Munch","SideBullets(hard)","Patter3"}
Test = {"MegaAttack"}
possible_attacks = {""}
arenasize = {155, 130}
wavetimer = 99999

enemies = {
"Unpattenered"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.

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
	if enemies[1].GetVar("Miss2") >= 3 and GetCurrentState() ~= "ENEMYDIALOGUE" then
		State("DONE")
	end
	if Music == 1 then
		Audio.LoadFile("gauntletofdeadlyfriendship")
		Audio.Volume(0.3)
		Audio.Pitch(0.4)
		Music = 0
	end
	AnimateUnpat()
	timer = timer + 1
	if (enemies[1].GetVar("Miss") == 11 and GetCurrentState() ~= "ENEMYDIALOGUE") then
		SetGlobal("SPARE",1)
	end
	if a == true then
		State("ACTIONSELECT")
		a = false
	end
	Turn = GetGlobal("Turn")
	enemies[1].SetVar("Turn",Turn)
	if enemies[1].GetVar("canspare") == true then
		possible_attacks = {"Blank"}
	elseif GetGlobal("Attack2") == 0 and FinalAttack == false and n == 0 then
		--possible_attacks = Test
		possible_attacks = easywaves
	elseif FinalAttack == true and n == 0 then
		possible_attacks = {"MegaAttack"}
		nextwaves = "MegaAttack"
	elseif GetGlobal("Attack2") == 1 and GetGlobal("Start") == 0 and FinalAttack == false and n == 0 then
		possible_attacks = {"StartAttack"}
	elseif GetGlobal("Attack2") == 1 and GetGlobal("Start") == 1 and FinalAttack == false and Turn <= 4 and n == 0 then
		possible_attacks = Waves1
	elseif GetGlobal("Attack2") == 1 and GetGlobal("Start") == 1 and FinalAttack == false and Turn <= 8 and n == 0 then
		possible_attacks = Waves2
	elseif GetGlobal("Attack2") == 1 and GetGlobal("Start") == 1 and FinalAttack == false and Turn <= 12 and n == 0 then
		possible_attacks = Waves3
	elseif GetGlobal("Attack2") == 1 and GetGlobal("Start") == 1 and FinalAttack == false and Turn <= 16 and n == 0 then
		possible_attacks = Waves4
	elseif GetGlobal("Attack2") == 1 and GetGlobal("Start") == 1 and FinalAttack == false and Turn <= 18 and n == 0 then
		possible_attacks = Waves5
	end
	if Turn == 1 and GetGlobal("Attack2") == 1 then
		enemies[1].SetVar("comments",{"This was unplaned."})
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered]You know[w:10],\nI find this ironic.","[effect:none][voice:v_unpattenered]I mean[w:10],[func:Face10] what are we\nreally fighting\nfor?","[voice:v_unpattenered][effect:none][func:Face4]Glory?[w:10]\nPride?[w:10]\nPower?","[voice:v_unpattenered][effect:none][func:Face3]I wonder...","[voice:v_unpattenered][effect:none][func:Face9]Was this even a\nrandom occurrence.","[voice:v_unpattenered][func:Face0][effect:none]...or did you choose\nthis?"})
	elseif Turn == 2 then
		enemies[1].SetVar("comments",{"A vampire without blood.","What is this?","Bullets fly high and low.","So many attacks.","Unpattenered tries to cut\ryou.","Smells like decay.[w:80]\nSorry[w:10], I meant decaf."})
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered]Truly[w:10],[func:Face4] I don't believe\nthat can be found\nout.","[voice:v_unpattenered][effect:none][func:Face10]But if it is true...","[voice:v_unpattenered][effect:none][func:Face4]What is the point of\ndoing so?","[voice:v_unpattenered][effect:none][func:Face0]And would that make\nmy life a lie?"})
	elseif Turn == 3 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][func:Face4][voice:v_unpattenered]Well[w:10],[func:Face10] that would be\nrather sad.","[voice:v_unpattenered][effect:none][func:Face3]I choose not to\ndwell on stuff like\nthat."})
	elseif Turn == 4 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face4]But if it's staring\ninto my face...","[voice:v_unpattenered][effect:none][func:Face1]..."})
	elseif Turn == 5 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face3]...what can I[w:10],[func:Face9] really[w:5],\n[func:Face0]do?"})
	elseif Turn == 6 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face10]I guess this isn't a\nrandom problem to\nhave[w:10],[func:Face4] per-say.","[voice:v_unpattenered][effect:none][func:Face3]But[w:10], it's the only\none I got."})
	elseif Turn == 7 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]It's weird to think\nabout stuff like\nthis.","[voice:v_unpattenered][func:Face3][effect:none]...","[voice:v_unpattenered][effect:none][func:Face4]Do you believe it's\nweird?"})
	elseif Turn == 8 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face10]...or[w:10],[func:Face0] is it random to\nconsider such\nthings?"})
	elseif Turn == 9 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face4]Oh[w:10], I'm rambling\nagain.","[voice:v_unpattenered][effect:none]I think it would be\nbetter if I stopped\ntalking about this.","[voice:v_unpattenered][effect:none][func:Face3]Won't you agree?"})
	elseif Turn == 10 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]Instead[w:10],[func:Face4] let's talk\nabout YOU[w:10][func:Face9] and your\nstory."})
	elseif Turn == 11 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face4]What have you been\ndoing reasonly?","[voice:v_unpattenered][effect:none][func:Face0]I[w:10], truly[w:10],[func:Face10] don't\nremember what\nhappen\nbefore this battle.","[voice:v_unpattenered][effect:none][func:Face4]...or anything at all\nbefore this battle."})
	elseif Turn == 12 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face3]Mmm...","[voice:v_unpattenered][effect:none][func:Face10]That sounds like\na curse.","[voice:v_unpattenered][effect:none][func:Face4]...but if I don't\nremember anything[w:10],\n[func:Face3]so is it really?","[voice:v_unpattenered][effect:none][func:Face10]It won't affect me\nin any way that I will\never know."})
	elseif Turn == 13 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none]But[w:20],[func:Face4] more\nimportantly...","[voice:v_unpattenered][func:Face0][effect:none]...","[voice:v_unpattenered][effect:none][func:Face1]Did you put it on\nme?"})
	elseif Turn == 14 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]*Sigh*","[voice:v_unpattenered][func:Face4][effect:none]Yeah[w:20],[func:Face10] you don't talk\nmuch[w:10],[func:Face4] do you?","[voice:v_unpattenered][effect:none]I mean[w:5],[func:Face0] for all I\nknow[w:20], it might not be\nreal.","[voice:v_unpattenered][effect:none][func:Face4]I could just have\namnesia[w:5],[func:Face10] or\nsomething."})
	elseif Turn == 15 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered]But[w:10],[func:Face4] a little\nreassurance goes\nawhile.","[voice:v_unpattenered][effect:none]...","[voice:v_unpattenered][effect:none][func:Face3]*Sigh*","[voice:v_unpattenered][effect:none][func:Face0]Of course not."})
	elseif Turn == 16 and GetGlobal("attack") >= 16 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered]However[w:10],[func:Face2] this may be\ngood.","[voice:v_unpattenered][effect:none]If I have no\nmemories...","[voice:v_unpattenered][effect:none][func:Face11]There's nothing\nstoping me from\nkilling you[w:10],[func:Face6] is\nthere?"})
	elseif Turn == 16 and GetGlobal("attack") <= 0 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]However[w:10], who cares\nif you did.","[voice:v_unpattenered][effect:none][func:Face11]You been really nice\nto me so far.","[voice:v_unpattenered][func:Face10][effect:none]I mean...","[voice:v_unpattenered][effect:none][func:Face4]You haven killed me[w:10],\nyet."})
	elseif Turn == 16 and (GetGlobal("attack") > 0 and GetGlobal("attack") < 16) then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]However[w:10], I don't\ncare anymore.","[voice:v_unpattenered][effect:none][func:Face4]What I care about is\ntaking your soul.","[voice:v_unpattenered][effect:none][func:Face4]Why?[w:40]\n[func:Face3]I don't remeber\nanymore."})
	elseif Turn == 17 and GetGlobal("attack") >= 17 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered][func:Face10]Would this be\nconsidered justic or\nrevenge?"})
	elseif Turn == 17 and GetGlobal("attack") <= 0 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][func:Face11][voice:v_unpattenered]It's nice to have\nsomeone to listen to\nyou."})
	elseif Turn == 17 and GetGlobal("attack") == 16 and FP == true then
		enemies[1].SetVar("currentdialogue", {"[effect:none][func:Face7][voice:v_unpattenered]Wha...!","[effect:none][voice:v_unpattenered]I just complemeted\nyou for being so\n[func:Face9][w:10]N [w:10]I [w:10]C [w:10]E!","[voice:v_unpattenered][effect:none][func:Face4]Then you stab me in\nthe back!","[effect:none][voice:v_unpattenered][func:Face3]Literally...","[func:Face4][voice:v_unpattenered][effect:none]Why?!?!"})
	elseif Turn == 17 and GetGlobal("attack") == 16 and FP == false then
		enemies[1].SetVar("currentdialogue", {"[effect:none][[voice:v_unpattenered]func:Face4]So why am I?[w:10]\nYou're[func:Face10]probablly\nasking.","[voice:v_unpattenered][func:Face0][effect:none]...", "[voice:v_unpattenered][effect:none]Your stength.","[voice:v_unpattenered][effect:none]With what little you\nhave hit\nme[w:10],[func:Face2] I felt true\npower.","[voice:v_unpattenered][func:Face10][effect:none]I don't know if it\nwas out of fear.","[effect:none][voice:v_unpattenered][func:Face1]Or spite.","[voice:v_unpattenered][effect:none][func:Face10]But[w:10], it's enough to\nmake me believe\nwhat I am doing\nis right."})
	elseif Turn == 18 and FP == true then
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered][func:Face10]But that's besides\nthe point."})
	elseif Turn == 18 and FP == true and GetGlobal("attack") > 0 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face9]Just wow.","[voice:v_unpattenered][func:Face4][effect:none]I will feel no remorse\nfor you."})
	elseif Turn == 18 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face8]It doesn't matter\nanyway..."})
	elseif Turn == 19 and f == false and GetGlobal("attack") >= 19 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered][func:Face4]Well[w:10],[func:Face0] it looks\nlike I'm headed to my\nend[w:10],[func:Face4] huh?","[voice:v_unpattenered][effect:none][func:Face10]Just, straight up\nkilling me[w:10],[func:Face0] not\ntrying to spare me.","[voice:v_unpattenered][effect:none]...","[voice:v_unpattenered][effect:none][func:Face2]Well, I hope this was\nworth it."})
		f = true
	elseif Turn == 19 and f == false and GetGlobal("attack") <= 0 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face4]Well[w:10],[func:Face10] you're\nmaking this very\nhard to fight you.","[voice:v_unpattenered][effect:none][func:Face3]You're just so[w:10][func:Face4] nice.","[voice:v_unpattenered][effect:none]I might have to[w:10],[func:Face0]\njust[w:5],[func:Face2] let you pass."})
		f = true
	elseif Turn == 19 and f == false and FP == false then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face3]...","[voice:v_unpattenered][effect:none]Sigh...","[voice:v_unpattenered][effect:none][func:Face0]You know how things\nhave been getting\nharder.","[voice:v_unpattenered][effect:none]Well,[w:10][func:Face2] good luck on my\nspecial attack.","[voice:v_unpattenered][effect:none][func:Face10]It's a hard one."})
		f = true
	elseif Turn == 19 and f == false and FP == true then
		enemies[1].SetVar("currentdialogue", {"[effect:none][voice:v_unpattenered][func:Face4]I...[w:10][func:Face0]","[voice:v_unpattenered][effect:none][func:Face0]Sigh.","[voice:v_unpattenered][effect:none][func:Face3]Just do me a favor\nand die."})
		f = true
	elseif Turn == 20 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]..."})
	elseif Turn == 21 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]...\n..."})
	elseif Turn == 22 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face0]...\n...\n..."})
	elseif Turn == 23 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face2]..."})
	elseif Turn == 24 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face2]Hmh..."})
	elseif Turn == 25 and GetGlobal("attack") >= 20 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:pausemusic][func:Face0]...","[voice:v_unpattenered][effect:none][func:Face9]...","[voice:v_unpattenered][effect:none]...[func:Face3]","[voice:v_unpattenered][effect:none][func:Face4]I made up my mind!","[voice:v_unpattenered][effect:none][func:Face0]I am not letting you\npass with out even a\nchallenge!","[voice:v_unpattenered][effect:none][func:Face1]You're dead to me.","[voice:v_unpattenered][func:Face4]And that's reality."})
		FinalAttack = true
		n = 0
	elseif Turn == 25 and GetGlobal("attack") <= 0 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:pausemusic][func:Face3]Sigh.","[voice:v_unpattenered][effect:none][func:Face11]Alright kid[w:10], you sol-[func:Face4]","[voice:v_unpattenered][effect:none]...[func:Face10]","[voice:v_unpattenered][effect:none]...[func:Face4]","[voice:v_unpattenered][func:Face8][effect:none]No.","[voice:v_unpattenered][effect:none][func:Face4]I'm sorry human...","[voice:v_unpattenered][effect:none][func:Face1]But I made up my\nmind.","[voice:v_unpattenered][effect:none][func:Face3]I can't let you go[w:10],\nwithout a challenge.","[voice:v_unpattenered][effect:none][func:Face0]So[w:10], perpare for my\n[color:ff0000]Special Attack.[color:ffffff]","[voice:v_unpattenered][func:Face11][effect:none]And, good luck."})
		FinalAttack = true
		n = 0
	elseif Turn == 25 and GetGlobal("attack") > 0 and GetGlobal("attack") < 20 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face3]Welp...","[voice:v_unpattenered][effect:none][func:Face0]Goodbye."})
		FinalAttack = true
		n = 0
	end
	if Turn == 27 and c == 0 and GetGlobal("attack") >= 20 then
		Audio.Pause()
		State("ACTIONSELECT")
		Player.ForceAttack(1, 341)
		d = 100
		c = 1
	elseif (Turn == 27 and GetCurrentState() == "ACTIONSELECT" and J == 1) or (Turn == 27 and GetCurrentState() == "DEFENDING" and n == 0) then
		Audio.Pause()
		State("ACTIONSELECT")
	end
	if GetGlobal("P") == 1 and Turn >= 26 and GetGlobal("m") == 1 then
		enemies[1].SetVar("currentdialogue", {"[func:pausemusic][voice:v_unpattenered][func:Face7]...","[voice:v_unpattenered][func:Face1]...","[effect:none][voice:v_unpattenered][func:Face1]Well, I can't say I\nexpected much from\nyou[w:5], anyway."})
		enemies[1].SetVar("unkillable",false)
		FinalAttack = false
		J = 1
	elseif GetCurrentState() == "ENEMYDIALOGUE" and Z == 1 then
		FinalAttack = false
		enemies[1].SetVar("hp",1)
		enemies[1].SetVar("unkillable",false)
		enemies[1].SetVar("canspare",false)
		n = 1
	elseif GetCurrentState() == "DEFENDING" and Z == 1 then
		enemies[1].SetVar("hp",2)
		SetGlobal("SpeedFactor",5)
	elseif GetGlobal("Betray") == 1 then
		Z = 1
		enemies[1].SetVar("currentdialogue", {"[func:pausemusic][voice:v_unpattenered][effect:shake,0.1][waitall:5][func:Face7]...","[voice:v_unpattenered][effect:shake,0.1][waitall:5][func:Face1]...","[voice:v_unpattenered][effect:shake,0.1][waitall:5]...[func:Face3]","[voice:v_unpattenered][effect:shake,0.1][waitall:2][func:Face4]why...", "[voice:v_unpattenered][effect:shake,0.5][waitall:1.2][func:Face8]WHY!!!","[voice:v_unpattenered][effect:shake,0.5]...","[voice:v_unpattenered][effect:shake,0.5][func:Face0]everything...[waitall:4]h-hurts-\ns.","[voice:v_unpattenered][effect:shake,1.15][func:Face8]...","[voice:v_unpattenered][effect:shake,1.2][waitall:6][func:Face2]ha-ha.","[voice:v_unpattenered][effect:shake,1.2][waitall:3][func:Face4]Al-[w:3]l-[w:3]right...","[voice:v_unpattenered][effect:shake,1.2][waitall:2.5][func:Face8]If I-[w:6]I'm dying...","[voice:v_unpattenered][effect:shake,1.3][func:Face8]I'm t-[w:10]taking you-[w:10]u\n[waitall:8][color:ff0000][func:Face5]WITH ME.","[voice:v_unpattenered][noskip][func:Face8][next]"})
	elseif h < 20 and Turn == 26 and (GetGlobal("attack") > 0 and GetGlobal("attack") < 20) then
		k = 1
		enemies[1].SetVar("currentdialogue", {"[func:pausemusic][voice:v_unpattenered][effect:none][func:Face1]Just get out of\nhere.","[voice:v_unpattenered]I'll spare you now."})
		enemies[1].SetVar("canspare",true)
		State("ENEMYDIALOGUE")
		enemies[1].SetVar("def",-872)
		SetGlobal("m",1)
		enemies[1].SetVar("comments",{"Unpattenered is sparing you."})
		h = h + 1
	end
	if Turn == 30 and L == 0 then
		enemies[1].SetVar("hp",2)
		enemies[1].SetVar("currentdialogue", {"[func:pausemusic][voice:v_unpattenered][noskip][waitall:5][effect:shake,0.5]...[func:Face8]","[voice:v_unpattenered][noskip][waitall:5][effect:shake,0.5]...","[voice:v_unpattenered][noskip][effect:none][effect:shake,0.5][func:Face0]Heh.","[voice:v_unpattenered][noskip][waitall:5][effect:shake,0.5][func:Face8]...","[voice:v_unpattenered][noskip][effect:shake,0.5][waitall:3.5][func:Face10]You know...","[voice:v_unpattenered][noskip][effect:shake,0.5][waitall:3.5][func:Face3]Before that last\nattack[w:10], I was going\neasy on you.","[voice:v_unpattenered][noskip][effect:shake,0.5][waitall:3.5]I was smart enough\nto realized that\neven tho humans\ncaused us misery.","[voice:v_unpattenered][noskip][effect:shake,0.5][waitall:3.5][func:Face3]We shouldn't wish the\nsame on them.","[voice:v_unpattenered][noskip][effect:shake,0.5][waitall:3.5][func:Face10]I always knew there\nwere good humans.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5[func:Face4]]I thought you were\none of them.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face0]But when I realize\nyou wanted to\nspread chaos\ninstead of hope.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face8]I had no reason to\nhold back.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face4]And look were it got\nme.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face10]You lived through my\nstrongest attack.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face8]And I failed\neveryone.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face4]Not only because I\ndidn't stop you.","[voice:v_unpattenered][noskip][effect:shake,1][waitall:3.5]But[w:10],[func:Face8] because I didn't\nshow everyone the\ngood parts of\nhumanity.","[voice:v_unpattenered][noskip][effect:shake,0.7][waitall:3.5][func:Face10]There has to be\nsomething[w:20][func:Face4], right?","[voice:v_unpattenered][noskip][waitall:5][effect:shake,0.5][func:Face7]...","[voice:v_unpattenered][noskip][noskip][effect:shake,0.5][waitall:3.5][func:Face4]You're[w:20] smiling...","[voice:v_unpattenered][noskip][waitall:5][effect:shake,0.5]...","[voice:v_unpattenered][noskip][waitall:7][func:Face8]Maybe there isn't."})
		enemies[1].SetVar("canspare",true)
		State("ENEMYDIALOGUE")
		L = 1
		n = 0
		X = 1
	end
	if GetGlobal("Death") == 1 then
		Audio.Pause()
		State("ACTIONSELECT")
		Player.ForceAttack(1, 341)
		Q = 81
		SetGlobal("Death",0)
	end
	if Q > 1 then
		Q = Q - 1
		State("ACTIONSELECT")
	elseif Q == 1 then
		enemies[1].SetVar("hp",1)
		enemies[1].SetVar("currentdialogue", {"[func:pausemusic][noskip][voice:v_unpattenered][effect:none][func:Face0][w:10].[w:10].[w:10].","[noskip][voice:v_unpattenered][effect:none][func:Face0][w:10].[w:10].[w:10].","[voice:v_unpattenered][effect:none]*Sigh*","[effect:none][voice:v_unpattenered][func:Face4]I guess this is it[w:10],\n[func:Face10]huh.","[voice:v_unpattenered][effect:none][func:Face3]...","[voice:v_unpattenered][effect:none][func:Face10]You know[w:10],[func:Face4] I always\nfound it rather\ncurious...", "[voice:v_unpattenered][func:Face3]...that humans\nbelieve us vampire\nare immortal.","[voice:v_unpattenered][effect:none][func:Face8]...when your blows\nhurt so much.","[effect:none][voice:v_unpattenered]...","[voice:v_unpattenered][effect:none][func:Face4]Despite everthing[w:10],[func:Face10]\nyou did listen to me.","[voice:v_unpattenered][effect:none][func:Face1]...maybe involuntary.","[voice:v_unpattenered][effect:none][func:Face0]But[w:10],[func:Face4] even so[w:10],[func:Face10] not\nmany people have.","[voice:v_unpattenered][effect:none][func:Face2]It's enough to make\nme call you my\nfriend.","[voice:v_unpattenered][effect:none][func:Face10]But,[w:20][func:Face0] you probably\nwouldn't like that.","[voice:v_unpattenered][effect:none][func:Face8]You just wanted to\nkill me[w:10], right.","[voice:v_unpattenered][effect:none][func:Face2]Either way[effect:shake,0.1]...","[voice:v_unpattenered][effect:shake,0.5][waitall:2][func:Face3]Thank you.","[voice:v_unpattenered][effect:shake,0.7][func:Face8][waitall:2]You gave me peace.","[voice:v_unpattenered][noskip][effect:shake,1.1][waitall:6][func:Face11]Someone listened\nto m[w:5][next]"})
		enemies[1].SetVar("unkillable",false)
		FinalAttack = false
		J = 1
		State("ENEMYDIALOGUE")
		Q = 0
	end
	if GetGlobal("Live") == 1 then
		Audio.Pause()
		k = 1
		enemies[1].SetVar("currentdialogue", {"[func:pausemusic][voice:v_unpattenered][effect:none][func:Face2]Heh.","[voice:v_unpattenered][func:Face11]You actually did it.","[voice:v_unpattenered][func:Face10]I guess I tried my\nbest[w:10],[func:Face11] heh.","[voice:v_unpattenered]You're amiable\nsoul[w:10],[func:Face4] mr...","[voice:v_unpattenered]Ummm...","[voice:v_unpattenered][func:Face2]Heh...","[voice:v_unpattenered][func:Face10]We're total\nstrangers[w:20], [func:Face11]yet you\nstill gave me the\ntime of day.","[voice:v_unpattenered]That's is all I ever\nwanted from a\nperson.","[voice:v_unpattenered][func:Face0]I attacked you for\nno reason.","[voice:v_unpattenered]I am sorry.","[voice:v_unpattenered]...","[voice:v_unpattenered][func:Face4]Can you do me a\nfavor.","[voice:v_unpattenered][func:Face11]Make other people\nhappy[w:10], like me!","[voice:v_unpattenered]I'll spare you now."})
		enemies[1].SetVar("canspare",true)
		State("ENEMYDIALOGUE")
		enemies[1].SetVar("def",-872)
		SetGlobal("b",1)
		enemies[1].SetVar("comments",{"Unpattenered is sparing you."})
		h = h + 1
		SetGlobal("Live",2)
	end
	if d > 1 then
		d = d - 1
	elseif d == 1 and GetGlobal("attack") > 0 then
        enemies[1].Call("Kill")
		SetGlobal("DUST",1)
	end
	if enemies[1].GetVar("hp") <= 10 then
		if Turn < 25 then
			SetGlobal("Turn",25)
		end
	end
	if Turn == 17 and GetGlobal("attack") <= 0 then
		FP = true
	end
	if k == 1 then
		Audio.Volume(0.2)
	end
	if O > 1 then
		O = O - 1
	elseif O == 1 then
		State("DONE")
	end
	if n == 1 then
		possible_attacks = {"Betray wave(Super Hard)"}
	end
	if Turn == 27 and enemies[1].GetVar("canspare") == true then
		function HandleSpare()
			SetGlobal("SPARE",1)
		end
	end
end

function EncounterStarting()
    require "Animations/Unpattenered_A"
    Player.name = "Frisk"
	Player.lv = 1
	Player.hp = 20
	Inventory.AddCustomItems({"LegChoco","CinnaBun", "RockCandy", "TemFlakes", "Stick", "Hot Dog", "Hot Del","Snail Pie"}, {0,0,0,0,3,0,0,0,0})
    Inventory.SetInventory({"LegChoco","CinnaBun","RockCandy","TemFlakes","Stick","Hot Dog","Hot Del","Snail Pie"})
	State("DEFENDING")
    -- If you want to change the game state immediately, this is the place.
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
	if GetGlobal("Attack2") >= 1 and Turn < 25 then
		SetGlobal("Turn",GetGlobal("Turn")+1)
		Turn = GetGlobal("Turn")
	elseif Turn == 30 or GetGlobal("P") == 1 then
		enemies[1].Call("Kill")
		SetGlobal("DUST",1)
		O = 151
	elseif Turn == 25 then
		enemies[1].SetVar("currentdialogue", {"[next]"})
		State("ENEMYDIALOGUE")
	elseif Turn == 26 then
		SetGlobal("Turn",GetGlobal("Turn")+1)
		Turn = GetGlobal("Turn")
	end
	if f == true and g == false then
		SetGlobal("Turn",20)
		Turn = GetGlobal("Turn")
		g = true
	end
	if X ~= 1 then
		nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	elseif FinalAttack == true and n == 0 then
		nextwaves = "MegaAttack"
	else
		nextwaves = "Blank3"
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
	encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleItem(ItemID)
    if ItemID == "LEGCHOCO" then
		BattleDialog({"You ate the Legendary Chocolate.[w:10]\nToo good for this world.[w:5]\nYour HP overflowed."})
		Player.ForceHP(30)
		Player.Heal(30)
		Player.MoveTo(99999,99999,true)
    elseif ItemID == "CINNABUN" then
		if Player.hp <= 11 then
			BattleDialog({"You ate the Cinnamon Roll.\nToo much cinnamon.\nYou recovered 8 HP."})
			Player.Heal(8)
		else
			BattleDialog({"You ate the Cinnamon Roll.\nToo much cinnamon.\nYour HP was maxed out."})
			Player.Heal(8)
		end
    elseif ItemID == "ROCKCANDY" then
		if Player.hp <= 18 then
			BattleDialog({"You ate the Rock Candy.\nYou recovered 1 HP."})
			Player.Heal(1)
		else
			BattleDialog({"You ate the Rock Candy.\nYour HP was maxed out."})
			Player.Heal(1)
		end
    elseif ItemID == "TEMFLAKES" then
		if Player.hp <= 17 then
			BattleDialog({"You ate the Temmie Flakes.\nYou recovered 2 HP."})
			Player.Heal(2)
		else
			BattleDialog({"You ate the Temmie Flakes.\nYour HP was maxed out."})
			Player.Heal(2)
		end
    elseif ItemID == "STICK" then
		if Turn > 0 then
			BattleDialog({"You threw the stick.[w:20]\nRandomizer doged it, thinking it\rwas an attack."})
		else
			BattleDialog({"You threw the stick.[w:20]\nNothing happened."})
		end
    elseif ItemID == "HOT DOG" then
		if Player.hp <= 9 then
			BattleDialog({"You only ate the Hot Dog Bun?\nYou recovered 10 HP."})
			Player.Heal(10)
		else
			BattleDialog({"You only ate the Hot Dog Bun?\nYour HP was maxed out."})
			Player.Heal(10)
		end
    elseif ItemID == "HOT DEL" then
		if Player.hp <= 12 then
			BattleDialog({"You ate the Hotland delight.\nTastes very colorful.\nYou recovered 7 HP."})
			Player.Heal(7)
		else
			BattleDialog({"You ate the Hotland delight.\nTastes very colorful.\nYour HP was maxed out."})
			Player.Heal(7)
		end
    elseif ItemID == "SNAIL PIE" then
		BattleDialog({"You ate the Snail Pie.\nYour HP was maxed out."})
		Player.Heal(19)
    end
end

function HandleSpare()
	enemies[1].SetVar("mercy", enemies[1].GetVar("mercy") + 1)
	if enemies[1].GetVar("mercy") == 1 then
		enemies[1].SetVar("currentdialogue", {"[effect:none][func:Face2][voice:v_unpattenered]Heh[w:20],[func:Face4] not so fast.","[voice:v_unpattenered][effect:none][func:Face0]The battle isn't\nover.","[voice:v_unpattenered][effect:none][func:Face9]Not yet..."})
	elseif enemies[1].GetVar("mercy") == 2 then
		enemies[1].SetVar("currentdialogue", {"[voice:v_unpattenered][effect:none][func:Face4]Mercy?","[voice:v_unpattenered][effect:none][func:Face10]Again?","[voice:v_unpattenered][effect:none][func:Face3]Fine then!","[voice:v_unpattenered][effect:none][func:Face0]If you think you're\ndone with this[w:10],[func:Face0]\nI'll show you\nsomething new!","[voice:v_unpattenered][effect:none][func:pausemusic][func:Face6]You'e not going\nanywere.","[func:newbattle][next]"})
	end
	State("ENEMYDIALOGUE")
end
function newbattle()
	SetGlobal("Attack2", 1)
end
function pausemusic()
	Audio.Pause()
end
function Face0()
	SetGlobal("Face",0)
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