-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Chivalry Stands proudly!"}
commands = {"Check", "Talk", "Recipe","Flirt", "Knock"}
randomdialogue = {"..."}
Checked = false
HasSword = true
Mad1 = false
Mad = false
Attack = 0
Attack2 = 0
SetBubbleOffset(-30, 10)
SetGlobal("DEAD2",false)
Miss = 0
Knock = 0
Talk = 0
Talk2 = 0
Recipe = 0
Recipe2 = 0
Complement = 0
Complement2 = 0
Complement3 = 0
Complement4 = 0
M = 0
Turn = 0
sprite = "Blank2" --Always PNG. Extension is added automatically.
gold = 680
name = "Chivalry"
hp = math.floor(5*24)
atk = 6
def = 99
check = "..."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
unkillable = true
voice = "v_Chivalry"

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
		if Mad == false and GetGlobal("PacEnd") == false and HasSword == true then
			Miss = Miss + 1
			if Miss == 1 then
				currentdialogue = {"[func:Face5]HA!","You can't hit m-","[func:Face2]Hey! [w:10]Wait a minute.","[func:Face9]Did you even try?"}
			elseif Miss == 2 then
				currentdialogue = {"[func:Face7]???"}
			elseif Miss == 3 then
				currentdialogue = {"[func:Face1]Oh! I get it!","[func:Face5]You're trying to\nmake my lower my\nguard!","Not a chance!"}
			elseif Miss >= 4 then
				currentdialogue = {"[func:Face5]..."}
			end
		else
			currentdialogue = {"..."}
		end
    else
        -- player did actually attack
		if GetGlobal("PacEnd") == false then
			if HasSword == false then
				SetGlobal("A",true)
				Attack = Attack + 1
				if Attack == 1 then
					currentdialogue = {"Oh[w:10], thank goodness.[w:20]\nHere it is!","Now[w:15],[func:Face5] back to my job."}
					HasSword = true
				elseif Attack == 4 then
					currentdialogue = {"Yes, finally!","I won't let you out\nof my sight again!","[func:Face4]As for you..."}
					HasSword = true
				elseif Attack == 8 then
					currentdialogue = {"A-HA![w:10]There it is!","I will [func:Face5][color:ff0000]NOT[color:000000] allow you\nto [color:ff0000]PASS[color:000000] human!","[func:Face4][effect:shake,1.2][color:ff0000]MARK MY WORDS!"}
					HasSword = true
				elseif Attack == 11 then
					currentdialogue = {"[func:Face2]...","[func:Face4]I [w:5]WILL[w:15] take your\nSOUL."}
				elseif Attack == 12 then
					currentdialogue = {"[func:Face4]I will triumph over\nyou."}
				elseif Attack == 13 then
					currentdialogue = {"[func:Face4]I will save monster-\nkind."}
				elseif Attack == 14 then
					currentdialogue = {"[func:Face4]For Undyen.[w:10]\n[func:Face5]For Asgore.[w:10]\n[func:Face5]For Stone Breaker.","[func:Face4]I will..."}
				elseif Attack == 15 then
					currentdialogue = {"[color:b2b2b2][waitall:3][func:Face2]Ha...","I am getting tired."}
				elseif Attack == 16 then
					currentdialogue = {"[color:b2b2b2][func:Face2]no[w:10],[func:Face4] NO!","[color:b2b2b2][waitall:3]I won't...","No, [color:b2b2b2][waitall:3][func:Face2]I-I can't."}
				elseif Attack == 17 then
					currentdialogue = {"[color:b2b2b2][effect:shake,0.7][func:Face2]I can't lose!","[color:b2b2b2][effect:shake,0.7][waitall:3][func:Face4]I-\n[w:15]No o-one will m-miss\nyou!","[func:Face2][color:b2b2b2][effect:shake,0.7]W-why do you fight?"}
				elseif Attack == 18 then
					currentdialogue = {"[func:pausemusic][color:b2b2b2][effect:shake,0.7][waitall:3][noskip][func:Face2]Ok...","[color:b2b2b2][effect:shake,0.7][waitall:3][noskip]I[w:20]-I ha[w:8]-ave t[w:8]-to...","[color:b2b2b2][effect:shake,1.2][noskip]Here is[w:8]-s m[w:8]-my [color:ff0000][effect:none]\n[func:Face4]special attack[color:b2b2b2][effect:shake,0.7]!","[noskip][func:newmusic][next]"}
					SetGlobal("FAttack",true)
					SetDamage(math.random(hp, hp + 10))
				elseif Attack == 20 then
					currentdialogue = {"[effect:shake,0.1][waitall:3][noskip][func:Face3]...","[effect:shake,0.2][waitall:3][noskip]...","[effect:shake,0.3][waitall:3][noskip]I guess...","[effect:shake,0.4][waitall:3][noskip]...[func:Face2]I got too angry...","[effect:shake,0.5][waitall:3][noskip][func:Face9]You separating me\nwith stone breaker...","[effect:shake,0.5][waitall:3][noskip]Made this a little\n[w:20][func:Face2]personal...","[effect:shake,0.6][waitall:3][noskip][func:Face9]I just...","[effect:shake,0.6][waitall:3][noskip][func:Face3]That isn't how I\nusually am...","[effect:shake,0.7][waitall:3][noskip]I...","[effect:shake,0.7][waitall:3][noskip][func:Face2]Almost killed you[w:10],\nright.","[effect:shake,0.8][waitall:3][noskip][func:Face2]...","[effect:shake,0.8][waitall:3][noskip][func:Face3]You did what you\nhad too...","[effect:shake,0.9][waitall:3][noskip]I forced you to do\nthis[w:20], didn't I.","[effect:shake,0.9][waitall:3][noskip][func:Face2]You didn't want to...","[effect:shake,1.2][waitall:3][noskip]...","[func:Face3][waitall:8][noskip]I did this to myself..."}
					State("ENEMYDIALOGUE")
					SetGlobal("DEAD",true)
				end
			elseif Mad == false then
				SetGlobal("B",true)
				Attack2 = Attack2 + 1
				if Attack2 == 1 and Checked == true then
					currentdialogue = {"[func:Face5]See! [w:10]Not a scrach!","Good try though."}
				elseif Attack2 == 1 and Checked == false then
					currentdialogue = {"[func:Face5]Ha!","You can't hit me with\n[color:ff0000]my sword in hand[color:000000].","[func:Face1]Good try though."}
					Checked = true
				elseif Attack2 > 1 and Attack2 ~= 4 and Attack2 ~= 8 then 
					currentdialogue = {"[func:Face5]..."}
				elseif Attack2 == 4 then 
					currentdialogue = {"[func:Face7]Weren't you\nlistening?","[func:Face5]You can't hit me."}
				elseif Attack2 == 8 then 
					currentdialogue = {"[func:Face2]This is sad.","[func:Face9]Maybe you could\ndistract me...","[func:Face2]Or[color:ff0000] find a way to\nstop me from\ndefending myself[color:000000].","...","Maybe?"}
				end
			end
		else
			currentdialogue = {"[noskip][func:pausemusic][w:120][next]","[effect:shake,0.6][func:Face8]...","[effect:shake,0.6][func:Face2]Why?","[effect:shake,0.6][func:Face3]...","[effect:shake,0.6]...","[effect:shake,0.6]...","[effect:shake,0.6](Sigh)","[func:Face2][effect:shake,0.6]There isn't much I\ncan do anymore...","[effect:shake,0.8][noskip][func:Face3]...","[effect:shake,0.8][waitall:2.5]Can you at least\npromise me\nsomething?","[effect:shake,0.8][waitall:2.5][func:Face2]...","[effect:shake,1.2]Give[w:10] Stone[w:10] Breaker...","[effect:shake,1.2]To[w:10] [waitall:-1]Someone in need.","[func:Face1][effect:shake,1.2]It[w:10] would[w:10] be[w:10] nice[w:10] to[w:10]\nhelp[w:10] someone...","[effect:shake,1.2]Like...","[effect:shake,1.2]Undyen...","[effect:shake,1.2]Did...","[effect:shake,1.2]To...","[effect:shake,1.2]M-[w:8][next]"}
			SetGlobal("DEAD",true)
			SetGlobal("DEAD2",true)
			SetGlobal("GenEnd",true)
			State("ENEMYDIALOGUE") 
		end
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "CHECK" then
		if GetGlobal("GenEnd") == false and GetGlobal("PacEnd") == false and HasSword == true then
			if Checked == false then
				currentdialogue = {"[func:Face5]My foot work is\nimpenetrable![w:20] All\nthanks to my lucky\nsword.","Go ahead[w:10], try and\nhit me!"}
				BattleDialog({"Chivalry 6 ATK 8 DEF\nThis Royal Guard member relies\rtoo heavily on her lucky sword."})
				Checked = true
			elseif Checked == true then
				BattleDialog({"Chivalry 6 ATK 8 DEF\nThis Royal Guard member relies\rtoo heavily on her lucky sword.","Try to separate her and her\rsword."})
			end
		elseif GetGlobal("PacEnd") == true then
			BattleDialog({"Chivalry 6 ATK 8 DEF[w:20]\nA new friend."})
		elseif GetGlobal("GenEnd") == true then
			BattleDialog({"Chivalry 0 ATK 1 DEF[w:20]\nNever was a threat..."})
		else
			BattleDialog({"Chivalry 6 ATK 8 DEF\nThis Royal Guard member relies\rtoo heavily on her lucky sword."})
			Checked = true
		end
    elseif command == "TALK" then
		if Mad == false and HasSword == true and Recipe < 2 then
			if Talk == 0 then
				BattleDialog({"You tried to talk to Chivalry."})
				currentdialogue = {"[func:Face7]Talking...?","In battle.","[func:Face2]Really?","[waitall:3][func:Face9]Well...[waitall:1][func:Face1] I guess I talk a\nlot[w:10], too."}
			elseif Talk == 1 then
				BattleDialog({"You tried to have a nice chat\rwith Chivalry."})
				currentdialogue = {"[func:Face2]Sorry[w:10], but saying\nyou want to have a\n'nice chat.'","...isn't going to cut\nit.","[func:Face1]You need a topic...","[func:Face9]I know from experience."},
			elseif Talk == 2 then
				BattleDialog({"You couldn't think of anything\rto say."})
				currentdialogue = {"[func:Face2]..."}
			elseif Talk >= 3 then
				BattleDialog({"..."})
				currentdialogue = {"..."}
			end
			Talk = Talk + 1
		elseif Mad == false and HasSword == true and Recipe >= 2 then
			if Talk2 == 0 then
				BattleDialog({"You decided to talk about\rUndyen's gift of friendship..."})
				currentdialogue = {"[func:Face5]Look...","[func:Face9]Unless you can prove\nit.","[func:Face1](Which you probably\ncan't.)","[func:Face2]I know Undyen is[w:5] NOT\n[w:20]your friend."}
			elseif Talk2 == 1 then
				BattleDialog({"You showed her[w:5], Undyen's phone\rnumber."})
				currentdialogue = {"You have[w:10] UNDYEN'S...","[func:Face7]Phone number...","[func:Face9]Ummm...","[func:Face7]How?"}
			elseif Talk2 == 2 then
				BattleDialog({"You say again that you are\rUndyen's friend."})
				currentdialogue = {"[func:Face2]Uh...","[func:Face9]Ok...","[func:Face2]..."}
			elseif Talk2 == 3 then
				BattleDialog({"You say that Undyen doesn't want\ranyone to kill you at the\rmoment."})
				currentdialogue = {"[func:Face2]Undyen...","[func:Face9]...","[func:Face5]She may be your\nfriend.","Maybe...","But...","[func:Face7]Undyen is one of the\nmost determined\nmonster to get to\nthe surface.","[func:Face9]She wouldn't just\nstop...","[func:Face2]Right...?"}
			elseif Talk2 == 4 then
				BattleDialog({"You say that Undyen said she\rdidn't want your soul\rspecifically."})
				currentdialogue = {"[func:Face2]Undyen says this.","Undyen says that...","...","[func:Face9]For all we know[w:10],\n[func:Face2]another human won't\never fall again.","[func:Face4]And what promise do\nI have that Undyen\nwon't let that human\ngo?","..."}
			elseif Talk2 == 4 then
				BattleDialog({"You say that Undyen wants to find a 'mean' human."})
				currentdialogue = {"[func:Face9]Exactly.","[func:Face2]What if there isn't any mean humans?","I mean-","[func:Face5]I can't let you go!","[func:Face9]You are our one chance."}
			elseif Talk2 == 5 then
				BattleDialog({"You try to reason with Chivalry."})
				currentdialogue = {"[func:Face4]Enough talking!","[func:Face9]I believe you became\nfriends with Undyen.","[func:Face2]I even believe you\nchanged her mind\nabout humans...","[func:Face5]But...","But you haven't done\nanything to me.","[func:Face4]I [w:10]AM [w:10]TAKING [w:10]YOUR\n[w:10]SOUL!"}
				Turn = 15
			elseif Talk2 >= 6 then
				BattleDialog({"She isn't listening."})
				currentdialogue = {"..."}
			end
			Talk2 = Talk2 + 1
		elseif Mad == false and HasSword == false then
			BattleDialog({"She doesn't pay mind to you."})
		elseif Mad == true then
			currentdialogue = {"No..."}
			State("ENEMYDIALOGUE")
		end
    elseif command == "RECIPE" then
		if Mad == false and HasSword == true then
			if Recipe == 0 then
				BattleDialog({"You recited a recipe Undyen gave\ryou."})
				currentdialogue = {"[func:Face7]Spaghetti?","[func:Face2]Wait[w:20],[func:Face1] that's Undyen's\nrecipe.","[func:Face7]How are you familiar\nwith it?","[func:Face2]...","[func:Face1]I guess word travels\nfast."}
			elseif Recipe == 1 then
				BattleDialog({"You said you got the recipe from\rUndyen herself."})
				currentdialogue = {"[func:Face1]Hehe...","Sorry kid[w:20], but you\nwould be dead by\nUndyen's hands\nbefore that happend..."}
			elseif Recipe == 2 then
				BattleDialog({"You try to convince Chivalry\rotherwise."})
				currentdialogue = {"[func:Face2]Nope[w:10], I just can't\npicture it.","[func:Face7]Why would Undyen\never give you[w:10], a\nhuman[w:5], a recipe?"}
			elseif Recipe == 3 then
				BattleDialog({"Without any other ideas...","You just recited the recipe\ragain..."})
				currentdialogue = {"[func:Face2]Yes[w:5], human[w:10], I know...","[func:Face1]I never liked that\nSpaghetti anyway...","[func:Face9]What's worse is I\nthink Undyen is\nteaching it to the\nother Royal Guard...","...members.","[func:Face2]I don't know about\nyou...","[func:Face1]But I don't want to\nget a cooking\nlesson...","...with someone who\nkeeps burning down\ntheir house."}
			elseif Recipe == 4 then
				BattleDialog({"You just keep repeating the word,\r'Spaghetti.'"})
				currentdialogue = {"[func:Face9]Are you mocking me...?"}
			elseif Recipe >= 5 then
				BattleDialog({"You're making your own language."})
				currentdialogue = {"..."}
			end
			Recipe = Recipe + 1
		elseif Mad == false and HasSword == false then
			BattleDialog({"You recited a recipe.","Nothing happened."})
		elseif Mad == true then
			if Recipe2 == 0 then
				BattleDialog({"You recited a recipe.","You almost died as Chivalry\rbarely missed your neck."})
				currentdialogue = {"[func:Face4]I. [w:10]Don't. [w:10]CARE!"}
			elseif Recipe2 >= 1 then
				BattleDialog({"I see you have a death wish..."})
			end
			Recipe2 = Recipe2 + 1
		end
    elseif command == "FLIRT" then
		if Mad == false and HasSword == true then
			BattleDialog({"You say that she have 'cuting\redge' looks?"})
			currentdialogue = {"[func:Face1]Sorry[w:5], human.[w:15] But I'm\nmarried to my job.","[func:Face9]Which is ironicly all\nabout killing you.","[func:Face1]Well[w:10],[func:Face5] you can't do\nanything about that[w:10],\nnow can you?"}
			commands = {"Check", "Talk", "Recipe","Complement", "Knock"}
		elseif Mad == false and HasSword == false then
			BattleDialog({"You say that she have 'cuting\redge' looks?"})
			currentdialogue = {"[func:Face7]Huh?[w:20] Yeah[w:10], ok.","[func:Face2]I'm not interested.","[func:Face4]Ahh!!![w:15] Where is it!"}
			commands = {"Check", "Talk", "Recipe","Complement", "Knock"}
		elseif Mad == true then
			BattleDialog({"You say that she have 'cuting\redge' looks?"})
			currentdialogue = {"[func:Face2]Coming from the\nmurderer...","[func:Face4]I don't care about\nyour feeling right\nnow."}
			commands = {"Check", "Talk", "Recipe", "Knock"}
		end
    elseif command == "KNOCK" then
		if HasSword == true then
			if Knock == 0 then
				BattleDialog({"You Knocked Chivalry's Lucky\rsword out of sight."})
				currentdialogue = {"[func:Face8]What!","[func:Face2]Where is it!","I can't fight without\nStone Breaker!"}
				HasSword = false
			elseif Knock == 1 then
				BattleDialog({"You tried to Knock Chivalry's\rsword out of sight.","But she expected it!"})
				currentdialogue = {"[func:Face4]Fool me once.","[func:Face5]But not again.","[func:Face1]You're going to die!"}
			elseif Knock == 2 then
				BattleDialog({"You almost had it.[w:10] Try again."})
				currentdialogue = {"[func:Face8]...","[func:Face2]Woah.","Almost...[w:25][func:Face5]BUT NOT\nQUITE!"}
			elseif Knock == 3 then
				BattleDialog({"You knocked her sword on the\rfloor again."})
				currentdialogue = {"[func:Face4]How[w:20] Dare You!","[func:Face2]Again?\n[w:10]Where is it!?"}
				HasSword = false
			elseif Knock == 4 then
				BattleDialog({"You lunged towards Chivalry in\ran attempt to knock her weapon\rdown.","Chivalry tries to counter-attack,\rbut you evade it."})
				currentdialogue = {"[func:Face4]Come at me again!\nI dare you..."}
			elseif Knock == 5 then
				BattleDialog({"You roll to Chivalry side.","Chivalry jumps back[w:10], without\rlegs.","Somehow...","You can't reach her sword."})
				currentdialogue = {"[func:Face9]...","[func:Face4]I won't let you!"}
			elseif Knock == 6 then
				BattleDialog({"You got very close to Chivalry.","Chivalry tried to slice you[w:20], but\ryou backed off."})
				currentdialogue = {"[func:Face4]Not this time.","Not any time!"}
			elseif Knock == 7 then
				BattleDialog({"You took the sword straight from\rher hands and threw it into the\rdistance."})
				currentdialogue = {"[func:Face2]No[w:20], Stone Breacker!"}
				HasSword = false
			elseif Knock == 8 then
				BattleDialog({"You need to get closer."})
				currentdialogue = {"[func:Face4]I have had enough of\nyou."}
			elseif Knock == 9 then
				BattleDialog({"You STILL need to get closer."})
				currentdialogue = {"[func:Face4]Why are you not\ndead yet!"}
			elseif Knock == 10 then
				BattleDialog({"You still need to get closer."})
				currentdialogue = {"[func:Face4][effect:shake,0.7]Why are you making\nthis so difficult!"}
			elseif Knock == 11 then
				BattleDialog({"One more step."})
				currentdialogue = {"[func:Face4][effect:shake,1.2]Why won't you [color:ff0000]GIVE\nUP[color:000000]!"}
			elseif Knock == 12 then
				Player.ForceAttack(1, 1)
				BattleDialog({"[func:pausemusic]You hit it out of their hands.","Hard...","She looks mad."})
				currentdialogue = {"...","...","Ok...","No more games.","No more fun.","Only your death!","[noskip][func:newmusic][next]"}
				HasSword = false
				Mad1 = true
			end
			Knock = Knock + 1
		elseif Mad == false then
			BattleDialog({"You already knocked her sword\rdown."})
		elseif Mad == true then
			if M == 0 then
				BattleDialog({"Even though the sword is\ralready on the floor.","Do you want to make them\rmore angry?"})
			else
				BattleDialog({"..."})
			end
			M = 1
		end
    elseif command == "COMPLEMENT" then
		if Mad == false and HasSword == true and Talk2 < 5 then
			if Complement == 0 then
				BattleDialog({"You congratulate Chivalry on\rtheir technique."})
				currentdialogue = {"[func:Face1]Heh.","Thanks[w:10], human.","But it's only because\nof my lucky sword!","[func:Face9]Besides[w:10],[func:Face1] I'm just one\nsoldier of the Royal\nGuard.","Here to make this\nplace better!"}
			elseif Complement == 1 then
				BattleDialog({"You say that she deserve to be\rthe learder of the Royal Guard."})
				currentdialogue = {"[func:Face8]What![w:15][func:Face2] Me?","No[w:10], no.","[func:Face9]That's Undyen's job.","[func:Face2]Haven't you heard?\n[w:10]She trained with King\nAsgore.","THE[w:10] ASGORE.","[func:Face9]Not to mention[w:10],[func:Face2] she\nstarted when she\nwas a little kid.","[func:Face1]I need my sword to\nfight you.","[func:Face5]Undyen only needs\nher magic equipped!"}
			elseif Complement == 2 then
				BattleDialog({"You say that she is just as\rgood as Undyen."})
				currentdialogue = {"[func:Face1]Trust me kid[w:10],[func:Face2] I'm not.","[func:Face9]How would you even\nknow?","[func:Face2]If you ever\nencounter Undyen...","You would already be\na SOUL."}
			elseif Complement == 3 then
				BattleDialog({"You say that you HAVE beaten\rUndyen."})
				currentdialogue = {"[func:Face2]Nope[w:10], not possible.","[func:Face1]Sorry for not\nbelieving in you."}
			elseif Complement == 4 then
				BattleDialog({"You bombard Chivalry with\rcomplements.","She just shrug it off."})
				currentdialogue = {"[func:Face1]Thanks![w:10][waitall:3] But...","[func:Face2]You going to die\nsoon anyway.","[func:Face9]Being nice isn't going\nto change that!"}
			elseif Complement == 5 then
				BattleDialog({"You continue bombarding Chivalry\rwith complements."})
				currentdialogue = {"[func:Face7]Why are you being so\nnice to me?"}
			elseif Complement >= 6 then
				BattleDialog({"You continue bombarding Chivalry\rwith complements."})
				currentdialogue = {"..."}
			end
			Complement = Complement + 1
		elseif Mad == false and HasSword == true and Talk2 >= 5 then
			if Complement2 == 0 then
				BattleDialog({"You say that she has nice form."})
				currentdialogue = {"[func:Face7]Thanks?","[func:Face9]I-","[func:Face2]Didn't we go over\nthis?","[func:Face4]I am not your friend!"}
			elseif Complement2 == 1 then
				BattleDialog({"You say that you want to be\rfriends with them."})
				currentdialogue = {"[func:Face2]Ok.","[func:Face1]I won't stop you\nfrom wanting that."}
			elseif Complement2 == 2 then
				BattleDialog({"You say that she is really\rdedicated."})
				currentdialogue = {"[func:Face4]Yes[w:10],[func:Face1] that is why I am\ngoing against\nUndyen's orders.","[func:Face5]To save\nmonsterkind..."}
			elseif Complement2 == 3 then
				BattleDialog({"You say that she has a very nice\rsword."})
				currentdialogue = {"[func:Face1]R[w:5]-really?","[func:Face2]I mean...","One day I just\nf[w:10]-found it on the\nside of a river.","[func:Face9]With no one to claim\nit.","[func:Face1]But I did spruce it\nup a little."}
			elseif Complement2 == 4 then
				BattleDialog({"You say that her sword must be a\rhuge help."})
				currentdialogue = {"[func:Face1]Yeah.","It has been.","[func:Face2]At that time...","I didn't have a house\n[w:10]or a family...","[func:Face1]Stone Breaker gave\nme company...","Something to do.","[func:Face9]So[w:5].[w:5].[w:5].[w:5][func:Face1]I trained[w:10] and\ntrained.","[func:Face9]Then[w:5].[w:5].[w:5].[w:5][func:Face2] I saw the\nRoyal Guard Leader[w:5],\nUndyen.","Next thing I know[w:10], [func:Face1]I\nasked her if I could\nget a job...","The rest is history...","[func:Face2]Stone Breaker gave\nmy life meaning."}
			elseif Complement2 == 5 then
				BattleDialog({"You say that they became\rsomething great..."})
				currentdialogue = {"[func:Face1]Mmm...","I guess I did..."}
			elseif Complement2 == 6 then
				BattleDialog({"You say that no matter what\rhappens...","Your Sword[w:10], and now your friends[w:10],\rwill always be there..."})
				currentdialogue = {"[func:pausemusic][func:Face2]...","(Sigh)","[func:Face1]I see how Undyen\n could be friends\nwith you...","[func:Face2]You...","Are...","[func:Face1]So nice.","[func:Face2]I-","Don't feel right\ndoing this anymore,\n[w:15]but...","Monsterkind needs a\nsavior...","After Asirel and\nCha-","[func:Face9]...","[func:Face2]...","I need to at least\ntry...","Try to save them...","Do you understand...?","...","I'll cut you a deal[w:10],[func:Face1]\nok?","[func:Face2]If you can dodge this\nlast attack[w:10],[func:Face1] I'll stop.","And Undyen doesn't\nhave to hear about\nthis[w:10], ok?","[func:Face5]Are you ready?","[func:Face2]Ok...","[func:Face1]Here we go!","[noskip][func:playmusic][next]"}
				SetGlobal("FAttack",true)
			end
			Complement2 = Complement2 + 1
		elseif Mad == false and HasSword == false then
			if Complement3 == 0 then
				BattleDialog({"You say that she has nice form."})
				currentdialogue = {"[func:Face2]Yes[w:5], yes.","That's very nice[w:10],\nbut I need to find\nstone breaker!"}
			elseif Complement3 == 1 then
				BattleDialog({"You said that Chivalry looks\rnice."})
				currentdialogue = {"[func:Face2]Wait a minute...","You knocked my\nsword in a hopeless\nto find direction.","[func:Face4]Why am I even\nlistening to you?"}
			elseif Complement3 == 2 then
				BattleDialog({"You decided to keep talking."})
				currentdialogue = {"Look[w:10], I'll be more\nthan happy to talk\nto you...","[func:Face1]AFTER I find my\nsword.","[func:Face2]Just stay there and\n[color:ff0000]don't hit me[color:000000]."}
			elseif Complement3 == 3 then
				BattleDialog({"You decided to keep talking some\rmore.","Yay..."})
			elseif Complement3 >= 4 then
				BattleDialog({"..."})
			end
			Complement3 = Complement3 + 1
		elseif Mad == true then
			if Complement4 == 0 then
				BattleDialog({"You say that she has nice form."})
				currentdialogue = {"[func:Face4]Do I look like I care\nat the moment?","[func:Face9]Because I don't."}
			elseif Complement4 >= 1 then
				BattleDialog({"..."})
			end
			Complement4 = Complement4 + 1
		end
    end
end
function Update()
end
function pausemusic()
	Audio.Pause() 
end
function newmusic()
	Audio.LoadFile("mus_ruins")
	Audio.Volume(1) 
	if Z ~= 1 then
		Audio.Pitch(1.5)
	else
		Audio.Pitch(1.7)
	end
	Z = 1
end
function playmusic()
	Audio.LoadFile("009_inimicial-forthcoming")
	Audio.Pitch(1.6)
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
