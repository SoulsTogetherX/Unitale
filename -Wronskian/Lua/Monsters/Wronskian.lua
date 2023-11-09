-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Wronskian Targets you."}
commands = {"Check","Insult","Talk","Complement"}
randomdialogue = {"[effect:none]..."}

sprite = "Blank" --Always PNG. Extension is added automatically.
name = "Wronskian"
hp = 144
atk = 8
def = 6

check = "..."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
Check = false 
unkillable = true
Attack = 0
Talk = 0
Talk2 = 0
Complement = 0
Complement2 = 0
Complement3 = 0
Insult = 0
Promise = 0
SetGlobal("D2",false)
AttackKill = false
voice = "Wronskian_V"
No = {"No.","Nope.","Nada.","Zip.","Negative.","Nix.","Absolutely not.","By no means.","Never.","No way.","Not at all.","Not by any means.","Not working."}

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
		SetGlobal("A",true)
		if Shield ~= true then
			Audio.PlaySound("00002a18")
		end
		if AttackKill == false then
			if Attack == 0 then
				currentdialogue = {"[effect:none]Hmm[w:30], human.","[func:Face9][effect:none]I suppose it is\nnatural to fight\nback.","[func:Face1][effect:none]But I have to let\nyou know[w:20], it is\nfutile..."}
			elseif Attack == 1 then
				currentdialogue = {"[effect:none][func:Face12]You may[waitall:0][func:Face1] THINK[waitall:1][w:15][func:Face12] you\nare killing me.","[effect:none]You may[waitall:0][func:Face1] THINK[waitall:1][w:15][func:Face12] you\nare making progress...","[func:Face1][effect:none]But I can assure\nyou...","[effect:none]You are not..."}
			elseif Attack == 2 then
				currentdialogue = {"[effect:none][func:Face9]You are not going to\nchange your fate\nwith your[w:10],[func:Face1] umm...","[effect:none]...'weapon,' there.","[func:Face1][effect:none]And I would\nappreciate you not\nlowering my hp for\nmy next battle."}
			elseif Attack == 3 then
				currentdialogue = {"[effect:none][func:Face1]I always thought\nhumans were smarter\nthan this...","[effect:none][func:Face12]Sigh...","[effect:none][func:Face9]Or maybe you're just\na bad specimen to\njudge."}
			elseif Attack == 4 then
				currentdialogue = {"[effect:none]I guess I'll just fill in\nthe blanks from\nhere...","[effect:none][func:Face1]I'm sure you won't\nmind...","[effect:none]Not like you are\ngoing to say no..."}
			elseif Attack == 5 then
				currentdialogue = {"[effect:none][func:Face9]So...","[effect:none][func:Face1]You probably want to\nknow who hired me?","[effect:none]Hmh...","[effect:none]None other than\nCapatin Undyen\nherself."}
			elseif Attack == 6 then
				currentdialogue = {"[effect:none]I don't respect\nUndyen.","[effect:none][func:Face9]But if you could only\nsee what she was\nwilling to give me...","[effect:none][func:Face1]You would\nunderstand...","[effect:none][func:Face12]...","[effect:none][func:Face1]But that's not\nimportant."}
			elseif Attack == 7 then
				currentdialogue = {"[effect:none][func:Face12]Sigh...","[effect:none][func:Face1]After everything[w:20],\nyou still choose\naggression?","[effect:none][func:Face11]Have you learned\nnothing?","[effect:none][func:Face1]...","[effect:none][func:Face9]Maybe it's the fight\nor flight reflex I\nheared humans\npossess...","[effect:none][func:Face11]But why choose fight\ninstead of flight?"}
			elseif Attack == 8 then
				currentdialogue = {"[effect:none][func:Face9]Perhaps it's the way\nI act.","[effect:none][func:Face12]I am known to be\nquite frank and\ncocky.","[effect:none][func:Face7]Mmm...","[effect:none][func:Face1]But if that's your\nonly reason to\nattack a...","[effect:none]...technology-\npowered, magic-\nwielding monster...","[effect:none][func:Face12]You're not very\nsmart."}
			elseif Attack == 9 then
				currentdialogue = {"[effect:none][func:Face12]Sigh...","[effect:none][func:Face7]This is repetitive.","[effect:none][func:Face1]Save me some time...","[effect:none]Trust me when I\nsay, 'you are not going to win.'","After all...[w:20][func:Face12]I [w:10]NEED [w:10]THIS\n[w:10]MONEY."}
			elseif Attack == 10 then
				currentdialogue = {"[effect:none]You want to know\nwhy I need the\nmoney[w:20],[func:Face11] don't you?","[effect:none][func:Face9]Well I'm not an open\nbook...","[effect:none]...","[effect:none]Nevertheless...","[effect:none][func:Face5]You are holding on\nlonger than I\nthought you would..."}
			elseif Attack == 11 then
				MoveScreen = false
				currentdialogue = {"[effect:none][func:Face4]Oh dear...","[effect:none][func:Face1]You're damaging me\nfar beyond what my\nA.I. and I thought you\ncould...","[effect:none]...[func:Face6]and...","[effect:none]I am even detecting\nintentions of murder.","[func:Face1][effect:none]This is concerning..."}
				SetDamage(0)
			elseif Attack == 12 then
				Audio.PlaySound("Break2")
				currentdialogue = {"[effect:none][func:Face3]Not so fast!","[effect:none][func:Face1]You think you can\nget rid of me like\nthat?"}
				Shield = true
				SetDamage(0)
				SetGlobal("Turn",25)
			elseif Attack == 13 then
				Audio.PlaySound("Break2")
				currentdialogue = {"[effect:none][func:Face9]I normally don't like\nusing this shield.","[effect:none][func:Face1]It uses one of the\nmost expensive\nmateral you can find[w:10],\nfor a power source.","[effect:none][func:Face12]But I'll make an\nexception for you."}
				SetDamage(0)
			elseif Attack == 14 then
				Audio.PlaySound("Break2")
				currentdialogue = {"[effect:none]Unfortunately[w:10], I only\nhave enough energy\nto power this for a\nlittle while...","[effect:none][func:Face12]So I need to make\nthese attacks count."}
				SetDamage(0)
			elseif Attack == 15 then
				Audio.PlaySound("Break2")
				currentdialogue = {"[effect:none]..."}
				SetDamage(0)
			elseif Attack == 16 then
				Audio.PlaySound("Break2")
				currentdialogue = {"[effect:none]...\n..."}
				SetDamage(0)
			elseif Attack == 17 then
				Audio.PlaySound("Break2")
				currentdialogue = {"[effect:none]...\n...\n..."}
				SetDamage(0)
			elseif Attack == 18 then
				comments = {"..."}
				commands = {"Check"}
				currentdialogue = {"[effect:none][func:pausemusic][noskip][w:10][next]","[effect:none][func:Face5]...","[effect:none][func:Face1]I will underestimate\nyou no longer.","[effect:none][func:Face3]It's time I stop\nholding back.","[effect:none][func:Face9]I don't have enough\nenergy to hold this\nshield up any more.","[effect:none][func:Face1]I hope you\nunderstand my\nconcern and why I am\ndoing this."}
				ShieldDown = true
				SetGlobal("FinalAttack",true)
				SetDamage(hp-1)
			elseif Attack == 19 then
				Audio.PlaySound("00002a18")
				currentdialogue = {"[effect:none][func:pausemusic][noskip][func:Face10]...","[effect:none][noskip][func:Face1]Well...","[effect:none][noskip][func:Face9]I-[w:20] should have\ncreated an exit\nstrategy...","[effect:none][noskip][func:Face5]...","[effect:none][noskip][func:Face4]I believe the choice\nis your's now[w:20],[func:Face1] human.","[effect:none][noskip][func:Face12]But I think I already\nknow what it is...","[effect:none][noskip]...","[effect:none][noskip][func:Face9]Humans never cared\nabout monsters...","[effect:none][noskip][func:Face3]So just take my life.","[effect:none][noskip][func:Face7]Won't be the first\nyour kind has taken..."}
				ShieldDown = true
				SetDamage(hp)
				commands = {"Check"}
				name = "[color:ffff00]Wronskian"
			elseif Attack == 20 then
				Audio.PlaySound("00002a18")
				SetGlobal("KILL",true)
				currentdialogue = {"[effect:none][noskip][func:Face5]...","[effect:none][noskip][waitall:2][func:Face2]There isn't much I\ncan say about this[w:25],[func:Face12]\nis there?","[effect:none][noskip][waitall:3][func:Face7]Just another human[w:20],\nkilling a monster.","[effect:none][noskip][waitall:5][func:Face12]...","[effect:none][noskip][waitall:2]...","[effect:none][noskip][waitall:5]...","[effect:none][noskip][waitall:4][func:Face12]You don't deserve to\nlive.","[effect:none][noskip][func:Face12]And you know that\ntoo[w:20],[func:Face1] don't you?","I wonder what that means...""[func:State,ACTIONSELECT]"}
			end
			Attack = Attack + 1
		else
			SetGlobal("KILL",true)
			Audio.Pause()
			name = "Wronskian"
			currentdialogue = {"[effect:none][func:Face10]...","[effect:none][waitall:3][func:Face2]O-[w:8]oh...[w:10][func:Face9] I didn't\nexpect that...","[effect:none][waitall:3][func:Face12]Heh...","[effect:none][waitall:3][func:Face5]Well [w:14]played.","[effect:none][waitall:3][func:Face1]This was your game\nto begin with[w:20],[func:Face11] huh.","[effect:none][waitall:3][func:Face9]Humanity really is\nsomething.[w:3].[w:3].Huh.[w:4].[w:4].","[effect:none][waitall:-3][func:Face12]Heh[w:15] heh[w:15] heh[w:15] heh!","[effect:none][waitall:3][func:Face9]At least.[w:5].[w:5].[w:5][func:Face4]I can see\nthem again.","[effect:none][waitall:4][func:Face10]...","[effect:none][waitall:2][func:Face1]What's with that\nface?","[effect:none][noskip][waitall:5][func:Face5]Are [w:20]they [w:20]not [w:20]\nthere?","[func:State,ACTIONSELECT]"}
		end
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "CHECK" then
		if Attack < 26 then
			if Check == false then
				BattleDialog({"Wronskian 13 ATK 22 DEF[w:20]\nThis weaponized mechanic can\rtake his job too seriously."})
				Check = true
			else
				BattleDialog({"Wronskian 13 ATK 22 DEF[w:20]\nThis weaponized mechanic can\rtake his job too seriously.","He won't stop without a reason.[w:20]\nSo give him one."})
			end
		else
			BattleDialog({"Wronskian 13 ATK 22 DEF[w:20]\nWaiting[waitall:4]..."})
			enemies[1].SetVar("currentdialogue",{"[effect:none]..."})
		end
    elseif command == "INSULT" then
		if Insult == 0 then
			MoveScreen = false
			currentdialogue = {"[effect:none]Mhm...","[effect:none]I doubt that."}
			BattleDialog({"You say Wronskian's tech is\routdated."})
		elseif Insult == 1 then
			currentdialogue = {"[effect:none]...","[effect:none][func:Face9]I don't approve the\nuse of separating\nmonsters into groups.","[effect:none][func:Face1]But[w:10], I'm sure you\ncould.","[effect:none][func:Face9]I'm not narcissistic.","[effect:none][func:Face12]There's got to be a\nbetter fighter out\nthere somewhere.","[effect:none][func:Face1]And maybe it is a\nmonkey."}
			BattleDialog({"You say that you could find\rbetter attacks from a monkey."})
		elseif Insult == 2 then
			currentdialogue = {"[func:Face3][effect:none]Excuse me?"}
			BattleDialog({"You say that Wronskian is a\rstereotypical[w:10], one-dimensional[w:10],\rcomputer geek."})
		elseif Insult == 3 then
			currentdialogue = {"[func:Face12][effect:none]...","[func:Face1][effect:none]I'm going to enjoy\nkilling you."}
			BattleDialog({"You say[w:5], 'Yes[w:10], excuse you.'"})
		elseif Insult == 4 then
			currentdialogue = {"[func:Face12][effect:none]We will see..."}
			BattleDialog({"You say that he will never be\rable to kill you."})
		elseif Insult == 5 then
			currentdialogue = {"[func:Face8][effect:none]...","[effect:none](Happy place.\n[w:10]Happy place.)"}
			BattleDialog({"You say that he is new-gen\rgarbage."})
		elseif Insult == 6 then
			currentdialogue = {"[func:Face3][effect:none]STOP IT!"}
			BattleDialog({"You say a non-specific insult."})
		elseif Insult == 7 then
			currentdialogue = {"[func:Face3][effect:none]AHHH...","[effect:none]No[w:10],[func:Face1] no...","[effect:none][func:Face12]Sigh[w:10],[func:Face1] I need this\nmoney."}
			BattleDialog({"You insult him again."})
		elseif Insult == 8 then
			currentdialogue = {"[func:Face7][effect:none]..."}
			BattleDialog({"Insult..."})
		end
		Insult = Insult + 1
    elseif command == "TALK" then
		if Insult < 7 then
			if Talk == 0 then
				currentdialogue = {"[effect:none][func:Face10]My name?","[effect:none][func:Face12]...","[effect:none][func:Face1]I'm sure you can\nsearch for it on\nyour version of a\n'search platform.'","[effect:none]Mmm...[w:10][func:Face9] Maybe you\ncan't.","[func:Face1][effect:none]Humans might not be\nthat advanced yet.","[func:Face12][effect:none]Always choosing\naggression over\ndiplomacy."}
				BattleDialog({"You ask Wronskian about their\rname."}) 
			elseif Talk == 1 then
				currentdialogue = {"[effect:none][func:Face9]Well...","[effect:none][func:Face1]I suppose they are\nnot inferior.","[effect:none]If they were[w:10],[func:Face11] how did\nthey win the great\nwar by so much?","[func:Face12][effect:none]No...","[effect:none][func:Face9]I think of them as...","[effect:none][func:Face1]Less advanced.[w:20][func:Face12] To\nput it nicely.","[effect:none][func:Face1]Bold[w:15], angry[w:15],\nuncivilized."}
				BattleDialog({"You ask Wronskian why he think\rhuman's are inferior."})
			elseif Talk == 2 then
				currentdialogue = {"[effect:none][func:Face3]Is that a joke?","[effect:none][func:Face1]I guess I have to\nadd poor memory to\nthe list.","[effect:none][func:Face9]Don't forget[w:10],[func:Face1] humans\nstarted the war.","[effect:none][func:Face3]YOU[w:10] started it.","[effect:none][waitall:-3]NOT[w:10] MONSTERS.","[effect:none][func:Face1]Do not compare me\nwith your species."}
				BattleDialog({"You say that humans and monsters\raren't that different from each\rother.","That they could get along."})
			elseif Talk == 3 then
				currentdialogue = {"[func:Face11][effect:none]Peace?","[func:Face1][effect:none]Such a silly thought.","[func:Face12][effect:none]...","[effect:none]...","[func:Face1][effect:none]Sure[w:15],[func:Face9] I want[w:10], 'peace.'","[effect:none][func:Face1]Not like it's going to\nhappen."}
				BattleDialog({"You ask if Wronskian even wants\rpeace between humans and\rmonsters."})
			elseif Talk == 4 then
				currentdialogue = {"[func:Face1][effect:none]Really?","[effect:none]A species like your's\nevolved?","[effect:none]Oh my gosh[w:10], I can't\nbelieve it!","[effect:none][func:Face12]...","[effect:none][func:Face1]I'll believe it[w:10], when I\nsee it kid."}
				BattleDialog({"You say that humans aren't like\rthey were before.","You say that they will accept\ryou."})
			elseif Talk == 5 then
				currentdialogue = {"[effect:none]I've already seen\nwhat humans do.","[func:Face12][effect:none]I cannot describe\nwhat I feel about\nyou.","[func:Face7][effect:none]Because you would\nnot believe what\nnegative thoughts I\nhave every second...","[effect:none]...I see you.","[func:Face1][effect:none]And how much I am\nrestraining myself."}
				BattleDialog({"You say again that they WILL\raccept Monster-kind."})
			elseif Talk == 6 then
				currentdialogue = {"[func:Face3][effect:none]Look around kid!","[effect:none]Does this look like\nthe best place to\ncall home?!","[effect:none][func:Face1]People give up hope\nleft and right.","[effect:none][func:Face9]People's standards\nkeep getting lower.","[effect:none][func:Face12]We don't even know\nwhat classifies as a\nstar!","[effect:none][func:Face9]All because of [func:Face3]YOU!\nAnd the war YOU\ncaused!","[effect:none]I-[w:35][func:Face12] *Breaths*","[effect:none][func:Face1]Sorry[w:10], I just started\nto remembered\nsomething.","[effect:none][func:Face9]Memories aside. [func:Face12]You\ncan never replace\nwhat you took from\nus.","[effect:none][func:Face3]From me!"}
				BattleDialog({"You ask why he hates you."})
				SetGlobal("D2",true)
			elseif Talk == 7 then
				currentdialogue = {"[func:Face3][effect:none]...","[func:Face1][effect:none]I'm done talking to\nyou..."}
				BattleDialog({"You say that you just want a\rworld where we can all get\ralong."})
			elseif Talk == 8 then
				BattleDialog({"You ask if there is anything you\rcould do.","[func:hurt]Wronskian threw a rock at you.","Owch! You lost 3 HP."})
			elseif Talk == 9 then
				BattleDialog({"Not the best idea."})
			elseif Talk > 9 then
				BattleDialog({"..."})
			end
			Talk = Talk + 1
		else
			if Talk2 == 0 then
				commands = {"Check","Talk","Complement"}
				currentdialogue = {"[effect:none]...","[effect:none][func:Face9]Nothing you should\nbe concerned with."}
				BattleDialog({"You ask Wronskian why they need\rthe money."})
			elseif Talk2 == 1 then
				currentdialogue = {"[func:Face3][effect:none]Would you stop that!","[effect:none]Fine![w:30][func:Face1] I'll tell you.","[effect:none][func:Face12]I simply made too\nmany robots.","[effect:none][func:Face9]I've found I can't\nreally stop...","[effect:none][func:Face1]It's the only thing I\nam good at anymore...","[effect:none]I mean[w:15],[func:Face12] I can't even\nkill you!"}
				BattleDialog({"You keep asking Wronskian[w:10], in an\rannoying manner."})
			elseif Talk2 == 2 then
				currentdialogue = {"[effect:none][func:Face11]Like me killing you?","[effect:none][func:Face1]Look...","[effect:none][func:Face9]I've already made a\nlot of mistakes in my\nlife...","[effect:none][func:Face12]A lot regrettable...","[effect:none][func:Face1]I understand robots[w:10],\nand they understand\nme!"}
				BattleDialog({"You tell Wronskian that they're\rgood at a lot of stuff."})
			elseif Talk2 == 3 then
				currentdialogue = {"[effect:none][func:Face9]...","[effect:none][func:Face7]...","[effect:none][func:Face9]...","[effect:none][func:Face1]...","[effect:none][func:Face12]Sigh...","[effect:none][func:Face9]You're going to keep\nanoying me if I don't\ntell you[w:25],[func:Face11] huh?","[effect:none][func:Face1]...","[effect:none][func:Face12]Do you know about\nthe royal children...","[effect:none][func:Face1]I've had a baby-\nsitting job with them.","[effect:none][func:Face9]You know[w:20],[func:Face1] when both\nof their parents are\nunavailable...","[effect:none][func:Face12]I loved both of\nthem...","[effect:none]...","[effect:none][func:Face1]But then they died...","[effect:none][func:Face12]And I didn't do\nanything to stop it...","[effect:none]...","[effect:none][func:Face1]That was my\ngreatest mistake..."}
				BattleDialog({"You ask Wronskian about their\rgreatest mistake."}) 
				AttackKill = true
				SetDamage(math.random(70000,99999))
			elseif Talk2 == 4 then
				currentdialogue = {"[effect:none]...","[effect:none][func:Face7]...","[effect:none][func:Face1]No[w:20], I knew it was\ngoing to happen.","[effect:none][func:Face12]The story says that\nChara grew ill...","[effect:none]That illness killed\nthem.","[effect:none]Asriel absored\nChara's SOUL out of\ngrief.","[effect:none]...and brought Chara\nto a human village.","[effect:none]There[w:20], Asriel died...","[effect:none][func:Face1]...","[effect:none][func:Face9]But that isn't the\nwhole story.","[effect:none][func:Face1]I overheard a plan\nChara and Asriel had\nto free monsters.","[effect:none][func:Face5]I knew it was coming...","[effect:none][func:Face9]Instead of telling\ntheir parents[w:20],[func:Face1] I was\nan idiot and thought\nI could reason with...","[effect:none]...them.","[effect:none]I never brought it up\ndirectly...","[effect:none][func:Face9]I just tried to show\nthem that the\nunderground is a\ngreat place to live...","[effect:none][func:Face12]...","[effect:none]My inaction got them\nkilled."}
				BattleDialog({"You say that their death weren't\rWronskian fault."})
			elseif Talk2 == 5 then
				currentdialogue = {"[effect:none][func:Face9]Look...","[effect:none]Asriel and Chara had\na plan to free all\nmonsters.","[effect:none][func:Face12]So[w:15], I am going to do\nwhat they wanted!","[effect:none][func:Face1]We only need one\nmore SOUL!","[effect:none][func:Face3]I'm going to make\nsure their deaths\naren't in vain!"}
				BattleDialog({"You can't think of anything to\rsay..."})
			elseif Talk2 == 6 then
				currentdialogue = {"[effect:none]Sorry[w:20],[func:Face9] I can't give\nup on them.","[effect:none][func:Face12]I'm not sure if this is\nwhat they want...","[func:Face3][effect:none]But it is what I want...","[effect:none]I want to save\neveryone...","[func:Face1][effect:none]That includes Chara\nand Asriel!"}
				BattleDialog({"You ask if this is what they\rwould want."})
			elseif Talk2 == 7 then
				SetGlobal("Turn",25)
				commands = {"PROMISE"}
				BattleDialog({"[noskip]You realize that Wronskian has a mental wound...","[noskip]...one that might never heal.","[noskip]...","[noskip]...","[noskip]But you don't believe it!","[noskip]You are determined!","[noskip]So[w:15], you do one thing to help him.","[noskip]You promise you will save\reveryone.","[noskip][func:State,ACTIONSELECT]"})
			elseif Talk2 > 7 then
				currentdialogue = {"[effect:none]..."}
				BattleDialog({"..."})
			end
			Talk2 = Talk2 + 1
		end
    elseif command == "COMPLEMENT" then
		if Insult < 7 then
			if Complement == 0 then
				BattleDialog({"You complemented Wronskian.","Nothing happened."})
			elseif Complement == 1 then
				BattleDialog({"Nothing happened.","You complemented Wronskian.","Something happened!","Not to Wronskian...","But you look like a dope.","That's what happened."})
			elseif Complement == 2 then
				BattleDialog({"Mmm...","Not working."})
			elseif Complement == 3 then
				BattleDialog({"Nope."})
			elseif Complement == 4 then
				BattleDialog({"Wait!","Oh[w:10], never mind.","He just faced you to attack.","[func:hurt]Oh... -3HP","Look out?"})
			elseif Complement == 5 then
				BattleDialog({"..."})
			elseif Complement == 6 then
				BattleDialog({"Didn't you already get hit\renough?"})
			elseif Complement == 7 then
				BattleDialog({"..."})
			elseif Complement >= 8 then
				BattleDialog({No[math.random(#No)]})
			end
			Complement = Complement + 1
		elseif Talk2 >= 3 then
			if Complement2 == 0 then
				currentdialogue = {"[func:Face8][effect:none]Thank you."}
				BattleDialog({"You say that they look great for\reverything that happened."})
			else
				currentdialogue = {"[effect:none]..."}
				BattleDialog({"..."})
			end
			Complement2 = Complement2 + 1
		elseif Insult > 7 then
			if Complement3 == 0 then
				currentdialogue = {"[effect:none]Umm...","[effect:none][func:Face11]Thanks??","[effect:none][func:Face1]...","[effect:none][func:Face11]Ok[w:15], why are you\nsaying this right now.","[effect:none][func:Face12]After all that\ninsulting.","[effect:none]Why?"}
				BattleDialog({"You complement Wronskian."})
			elseif Complement3 == 1 then
				currentdialogue = {"[effect:none]..."}
				BattleDialog({"You complement Wronskian again."})
			elseif Complement3 >= 2 then
				currentdialogue = {"[effect:none]..."}
				BattleDialog({"..."})
			end
			Complement3 = Complement3 + 1
		end
	elseif command == "PROMISE" then
		if Promise == 0 then
			currentdialogue = {"[func:Face12][effect:none]I have one question.","[effect:none][func:Face11]'How?'","[func:State,DEFENDING]"}
			BattleDialog({"You promise that you will find\rjustice for them."})
		elseif Promise == 1 then
			currentdialogue = {"[func:Face3][effect:none]So let me kill you!","[func:State,DEFENDING]"}
			BattleDialog({"You promise to fight for what\rthey wanted."})
		elseif Promise == 2 then
			currentdialogue = {"[effect:none]Yeah[w:10],[func:Face4] but...","[func:State,DEFENDING]"}
			BattleDialog({"You promise to live up to their\rmorals."})
		elseif Promise == 3 then
			currentdialogue = {"[effect:none][func:Face2]...","[func:State,DEFENDING]"}
			BattleDialog({"You promise to always continue\rhelping."})
		elseif Promise > 3 then
			SetGlobal("SPARE",true)
			currentdialogue = {"[effect:none][func:Face4]...","[effect:none][func:Face1]But...","[effect:none][func:Face9]How else...","[effect:none][func:Face2]...","[effect:none][func:pausemusic][func:Face1]I understand.","[effect:none][func:Face9]I am not in the right\nto do this.","[effect:none][func:Face1]No matter how much I\nneed the money.","[effect:none][func:Face12]Or what good I\nbelieve I am doing.","[effect:none][func:Face1]It's not right[w:20], to kill\na child.","[effect:none][func:Face12]Sorry...","[effect:none][func:Face2]I-[w:20]I'll leave you alone.","[func:State,ACTIONSELECT]"}
			BattleDialog({"You say there is no point in\rdoing something for someone...","If they'll hate you for it."})
		end
		Promise = Promise + 1
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
function pausemusic()
	Audio.Pause() 
end
function playmusic()
	Audio.Play()
end
function hurt()
	Player.hurt(3)
	Audio.PlaySound("PlayerHurt")
	Player.MoveTo(1000,1000,true)
end