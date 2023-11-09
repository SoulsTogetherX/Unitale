-- A basic monster script skeleton you can copy and modify for your own creations.
Turn = 0 
Timer = 0
SetGlobal("attack",0)
SetGlobal("m",0)
SetGlobal("Turn",0)
SetGlobal("b",0)
SetGlobal("m",0)
yell = 0
yell2 = 0
yell3 = 0
yell4 = 0
Do = 0 
hug = 0
hug2 = 0
hug3 = 0
hug4 = 0
wave = 0
wave2 = 0
wave3 = 30
wave4 = 0
mercy = 0
dead = 0
Miss = 0
Miss2 = 0
Miss3 = 0
a = false
B = 0
c = false
Q = 0
attacked_once = false
SetGlobal("Finished",false)
comments = {"A unpatterned monster spots you."}
commands = {"Check", "Yell", "Wave", "Hug"}
randomdialogue = {"[effect:none][voice:v_unpattenered]..."}

sprite = "Blank" --Always PNG. Extension is added automatically.
 
name = "Unpattenered"
maxhp = (6*27.5)
hp = (6*27.5)
atk = 6
def = 8
xp = 450
gold = 220
check = {}
flee = false
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
unkillable = true

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
		if GetGlobal("Attack2") == 1 then
			if GetGlobal("Turn") >= 26 and GetGlobal("m") == 1 then 
				if Miss2 == 0 then
					currentdialogue = {"[next]","[effect:none][func:Face0][voice:v_unpattenered]..."}
					State("ENEMYDIALOGUE")
				elseif Miss2 == 1 then
					currentdialogue = {"[next]","[effect:none][func:Face1][voice:v_unpattenered]...","[func:Face9][voice:v_unpattenered]Seriously[w:10], human?"}
					State("ENEMYDIALOGUE")
				elseif Miss2 == 2 then
					currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]Ok[w:10], I'll make it easy\nfor you.","[func:Face0][voice:v_unpattenered]Bye[w:10], I wish you the\nbest of luck."}
					State("ENEMYDIALOGUE")
				end
				Miss2 = Miss2 + 1
			end
		end
		if GetGlobal("Turn") >= 26 and GetGlobal("b") == 1 and GetGlobal("m") ~= 1 then
			if Miss3 == 0 then
				currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]..."}
				State("ENEMYDIALOGUE")
			--elseif Miss3 == 1 then
			--	currentdialogue = {"[next]","[effect:none][func:Face10][voice:v_unpattenered]..."}
			--	State("ENEMYDIALOGUE")
			elseif Miss3 == 2 then
				currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]Human?[w:10]\nWhat are you doing?"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 3 then
				currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]You're not going to\nattack me[w:20], right?"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 4 then
				currentdialogue = {"[next]","[effect:none][func:Face0][voice:v_unpattenered]..."}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 5 then
				currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]Ok[w:10],[func:Face10] now I am a little\nscared.","[noskip][func:Face4][next]"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 6 then
				currentdialogue = {"[next]","[effect:none][func:Face10][voice:v_unpattenered]Friends don't scare\neach other[w:10], right?[func:Face4]"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 7 then
				currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]Or am I scaring\nmyself...","[func:Face10][voice:v_unpattenered]...by thinking like\nthat.","[func:Face4][voice:v_unpattenered]Hmm[w:10], that is a good\nquestion."}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 8 then
				currentdialogue = {"[next]","[effect:none][func:Face3][voice:v_unpattenered]Either way[w:20], if that's\nnot how it works...","[func:Face6][voice:v_unpattenered]RAAA!!","[func:Face4][voice:v_unpattenered]No? [w:8]Nothing?[w:20][func:Face3] Alright."}
				State("ENEMYDIALOGUE")
			elseif Miss3 >= 9  and Miss3 ~= 11 and Miss3 ~= 14 and Miss3 ~= 19 and Miss3 ~= 25 and Miss3 ~= 30 and Miss3 ~= 32 then
				currentdialogue = {"[next]","[voice:v_unpattenered][effect:none]...[func:Face0]"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 11 then
				currentdialogue = {"[next]","[voice:v_unpattenered][func:Face4][effect:none]You can spare me\nnow[w:10], human."}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 14 then
				currentdialogue = {"[next]","[voice:v_unpattenered][func:Face4][effect:none]*Yawn*"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 17 then
				currentdialogue = {"[next]","[voice:v_unpattenered][func:Face4][effect:none]*Sigh*"}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 21 then
				currentdialogue = {"[next]","[voice:v_unpattenered][func:Face4][effect:none]I guess friends also\nneed to have\npatience."}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 26 then
				currentdialogue = {"[next]","[voice:v_unpattenered][func:Face4][effect:none]You can spare me[w:10],\n[func:Face11]buddy."}
				State("ENEMYDIALOGUE")
			elseif Miss3 == 33 then
				currentdialogue = {"[next]","[voice:v_unpattenered][func:Face3][effect:none]..."}
			end
			Miss3 = Miss3 + 1
		end
		if GetGlobal("Attack2") == 0 then
			if Q == 0 then
				if Miss == 0 then
					currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]..."}
					State("ENEMYDIALOGUE")
				elseif Miss == 1 then
					currentdialogue = {"[next]","[effect:none][func:Face10][voice:v_unpattenered]..."}
					State("ENEMYDIALOGUE")
				elseif Miss == 2 then
					currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]..."}
					State("ENEMYDIALOGUE")
				elseif Miss == 3 then
					currentdialogue = {"[next]","[effect:none][func:Face10][voice:v_unpattenered]Are you...","[func:Face4][voice:v_unpattenered]...trying to psych me\nout?"}
					State("ENEMYDIALOGUE")
				elseif Miss == 4 then
					currentdialogue = {"[next]","[effect:none][func:Face3][voice:v_unpattenered]Is this a joke.","[func:Face4][voice:v_unpattenered]Because...","[voice:v_unpattenered]What's the point?"}
					State("ENEMYDIALOGUE")
				elseif Miss == 5 then
					currentdialogue = {"[next]","[effect:none][func:Face3][voice:v_unpattenered]Ok[w:10],[func:Face4] I think you had\nyour fun."}
					State("ENEMYDIALOGUE")
				elseif Miss == 6 then
					currentdialogue = {"[next]","[effect:none][func:Face0][voice:v_unpattenered]Sigh*","[func:Face9][voice:v_unpattenered]Am I[w:10],[func:Face4] nothing more\nthat a joke to you?"}
					State("ENEMYDIALOGUE")
				elseif Miss == 7 then
					currentdialogue = {"[next]","[effect:none][func:Face8][voice:v_unpattenered]...","[func:Face9][voice:v_unpattenered]Stop now."}
					State("ENEMYDIALOGUE")
				elseif Miss == 8 then
					currentdialogue = {"[next]","[effect:none][func:Face1][voice:v_unpattenered]...","[func:Face0][voice:v_unpattenered]Sigh*","[voice:v_unpattenered]You hate me[w:10],[func:Face8] don't\nyou?","[voice:v_unpattenered]That's why you're\ndisregarding my\nfeelings.","[voice:v_unpattenered]Right?"}
					State("ENEMYDIALOGUE")
				elseif Miss == 9 then
					currentdialogue = {"[next]","[effect:none][func:Face4][voice:v_unpattenered]Again[w:10], am I just\nyour joke.","[Face8][voice:v_unpattenered]..."}
					State("ENEMYDIALOGUE")
				elseif Miss == 10 then
					currentdialogue = {"[next]","[effect:none][func:Face1][voice:v_unpattenered]You...","[voice:v_unpattenered]...","[func:Face4][voice:v_unpattenered]I don't have to\nstand for this[w:10], do I?","[func:Face0][voice:v_unpattenered]Have a nice life.","[voice:v_unpattenered]Because you won't\nhave anyone to\nshare it with.","[noskip][func:Spare][next]"}
					State("ENEMYDIALOGUE")
				end
				Miss = Miss + 1
			elseif Q == 1 then
				currentdialogue = {"[effect:none][voice:v_unpattenered]..."}
			end
		end
    else
        -- player did actually attack random
		if GetGlobal("Turn") >= 26 and GetGlobal("m") == 1 then 
			hp = 1
			SetGlobal("P",1)
			hp = 1
		end
		if GetGlobal("Turn") >= 26 and GetGlobal("b") == 1 then
			SetGlobal("Betray",1)
			hp = 1
		end
		SetGlobal("A",true)
		Audio.PlaySound("000029ae")
		SetGlobal("Face",0)
		if GetGlobal("Attack2") == 0 then
			if GetGlobal("attack") == 0 and Miss == 4 then
				currentdialogue = {"[effect:none][func:Face7][voice:v_unpattenered]...","[effect:none][func:Face4][voice:v_unpattenered]Well[w:5], you weren't\nthen.","[effect:none][func:Face0][voice:v_unpattenered]Please, don't try\nthat again."}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 0 and Miss > 4 then
				currentdialogue = {"[effect:none][func:Face1][voice:v_unpattenered]...","[effect:none][func:Face10][voice:v_unpattenered]Well that wasn't any\nbetter.","[effect:none][func:Face0][voice:v_unpattenered]Please, don't try\nthat again."}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 0 and (hug == 0 and mercy == 0) then
				currentdialogue = {"[effect:none][func:Face1][voice:v_unpattenered]...","[effect:none][voice:v_unpattenered]Okay, partner.","[effect:none][voice:v_unpattenered]Unless you want to\nsee how this battle\nescalates...","[effect:none][voice:v_unpattenered]Please, don't try\nthat again."}
				SetGlobal("attack", GetGlobal("attack") + 1)
				attacked_once = true
			elseif GetGlobal("attack") == 1 and Miss >= 3 then
				currentdialogue = {"[func:Face0][effect:none][voice:v_unpattenered]*Sigh*","[effect:none][func:Face3][voice:v_unpattenered]Okay[w:10], I did warn you.", "[effect:none][noskip][func:Face1][voice:v_unpattenered]...[func:pausemusic]", "[effect:none][func:Face6][voice:v_unpattenered]How about some new\nattacks?","[noskip][func:newbattle][next]"}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 1 and (hug > 0 or mercy > 0) and attacked_once == true then
				currentdialogue = {"[effect:none][func:Face7][voice:v_unpattenered]...","[effect:none][func:Face4][voice:v_unpattenered]Umm[w:15], first you\nattacked me...","[effect:none][voice:v_unpattenered]Then you hugged\nme...","[effect:none][func:Face3][voice:v_unpattenered]And now you think\nattacking me is\nokay,[w:5] again?!?","[effect:none][func:Face4][voice:v_unpattenered]Are your priorities\nin order?","[effect:none][func:Face7][voice:v_unpattenered]I guess,[w:10][func:Face10] ummm.[w:10]\n[func:Face0]I did warn you.","[effect:none][noskip][voice:v_unpattenered]...[func:pausemusic]", "[voice:v_unpattenered][effect:none][func:Face6]How about some new\nattacks?","[noskip][func:newbattle][next]"}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 1 and (hug == 0 and mercy == 0) then
				currentdialogue = {"[func:Face0][effect:none][voice:v_unpattenered]*Sigh*","[effect:none][func:Face3][voice:v_unpattenered]Okay[w:10], I did warn you.", "[effect:none][noskip][func:Face1][voice:v_unpattenered]...[func:pausemusic]", "[voice:v_unpattenered][effect:none][func:Face6]How about some new\nattacks?","[noskip][func:newbattle][next]"}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 0 and hug > 0 then
				currentdialogue = {"[func:Face7][voice:v_unpattenered][effect:none]...","[effect:none][voice:v_unpattenered]Okay, I didn't expect\nthat!", "[effect:none][func:Face10][voice:v_unpattenered]One moment you were\nhuging me...","[effect:none][func:Face4][voice:v_unpattenered]And the next your\nstriking me\ndown.","[effect:none][func:Face2][voice:v_unpattenered]That is truly random!"}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 0 and mercy > 0 then
				currentdialogue = {"[func:Face7][effect:none][voice:v_unpattenered]...","[effect:none][voice:v_unpattenered]Okay, I didn't expect\nthat!", "[effect:none][func:Face10][voice:v_unpattenered]One moment you were\nshowing kindness...","[effect:none][func:Face4][voice:v_unpattenered]And the next\nyour striking me\ndown.","[effect:none][func:Face2][voice:v_unpattenered]That is truly random!"}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 1 and (hug > 0 or mercy > 0) then
				currentdialogue = {"[effect:none][func:Face10][voice:v_unpattenered]Well, at first it was\nrandom.","[effect:none][func:Face3][voice:v_unpattenered]But not this time!","[effect:none][func:Face8][voice:v_unpattenered]This time it hurt.","[effect:none][func:Face1][voice:v_unpattenered]DON'T[w:10][func:Face3] do it again."}
				SetGlobal("attack", GetGlobal("attack") + 1)
			elseif GetGlobal("attack") == 2 and (hug > 0 or mercy > 0) then
				currentdialogue = {"[effect:none][func:Face0][voice:v_unpattenered]*Sigh*","[effect:none][func:Face3][voice:v_unpattenered]Okay, I did warn you.", "[effect:none][func:Face1][noskip][voice:v_unpattenered]...[func:pausemusic]", "[effect:none][func:Face6][voice:v_unpattenered]How about some new\nattacks?","[noskip][func:newbattle][next]"}
				SetGlobal("attack", GetGlobal("attack") + 1)
			end
		else
			if T == 0 then
				SetGlobal("attack", -1)
				T = 1
			end
			SetGlobal("attack", GetGlobal("attack") + 1)
		end
    end
end
function EnemyDialogueEnding()
	Turn = Turn + 1
end

function Update()
	if GetGlobal("Finished",true) and c == false then
		Player.ForceAttack(1, 20)
		Black = CreateProjectile("Pixel",0,-100)
        Black.sprite.xscale = 300
        Black.sprite.yscale = 100
		Black.sprite.alpha = 0
		c = true
	end
	if GetGlobal("Finished",true) then
		timer = timer + 1
		if Black.sprite.alpha < 1 then
			Black.sprite.alpha = timer/25
		else
			Black.sprite.alpha = 1
		end
	end
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
	if GetGlobal("Turn") >= 26 and GetGlobal("m") == 1 then
		if command == "CHECK" then
			BattleDialog({"Unpattenered 6 ATK 8 DEF\nHe is hurt."})
		elseif command == "YELL" then
			if yell4 == 0 then
				currentdialogue = {"[effect:none][func:Face1][voice:v_unpattenered]...","[effect:none][func:Face4][voice:v_unpattenered]Are you going to\nspare me?","[voice:v_unpattenered]You already hurt me[w:15],\nso just accept it\nand I can go rest."}
				BattleDialog({"You ran and yelled as loud as\rpossible.","Unpattenered doesn't seem like\rhe want to hear you."})
				yell4 = yell4 + 1
			elseif yell4 == 1 then
				currentdialogue = {"[effect:none][func:Face4][voice:v_unpattenered]Seriously[w:10], I do need\nto rest.","[func:Face10][voice:v_unpattenered]...and you yelling\nisn't helping."}
				BattleDialog({"Unpattenered looks more hurt\rthan annoyed."})
				yell4 = yell4 + 1
			elseif yell4 == 2 then
				currentdialogue = {"[effect:none][func:Face9][voice:v_unpattenered]I have a headache,\nafter you hit me\nin the head.","[voice:v_unpattenered][func:Face1]Please stop."}
				BattleDialog({"You yelled louder and louder,\rwith no consideration for\rUnpattenered."})
				yell4 = yell4 + 1
			elseif yell4 == 3 then
				currentdialogue = {"[effect:none][func:Face0][voice:v_unpattenered]..."}
				BattleDialog({"You yell, Unpattenered try to\rblock you out."})
				yell4 = yell4 + 1
			elseif yell4 == 4 then
				currentdialogue = {"[effect:none][func:Face0][voice:v_unpattenered]..."}
				BattleDialog({"You yell a loud scream."})
			end
		elseif command == "HUG" then
			if hug4 == 0 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face1]...","[voice:v_unpattenered][func:Face3]Really?[w:20] You already\nhurt me.","[func:Face0][voice:v_unpattenered]Your chance to\nbefriend me is over."}
				BattleDialog({"Unpattenered rejects you."})
				hug4 = hug4 + 1
			elseif hug4 == 1 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]N![w:10] O!","[voice:v_unpattenered][func:Face5]P [w:5]E [w:5]R [w:5]I [w:5]O [w:5]D [w:5]!"}
				BattleDialog({"Unpattenered...","...is angry."})
				hug4 = hug4 + 1
			elseif hug4 == 2 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face0]..."}
				BattleDialog({"..."})
			end
		elseif command == "WAVE" then
			if wave4 == 0 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face0]..."}
				BattleDialog({"You wave to Unpattenered in a\rfriendly manner.","He doesn't respond."})
				wave4 = wave4 + 1
			elseif wave4 == 1 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face0]..."}
				BattleDialog({"..."})
			end
		end
	elseif GetGlobal("Turn") >= 26 and GetGlobal("b") == 1 and GetGlobal("m") ~= 1 then
		if command == "CHECK" then
			BattleDialog({"Unpattenered 6 ATK 8 DEF\nYour new friend."})
		elseif command == "YELL" then
			if yell3 == 0 then
				currentdialogue = {"[effect:none][func:Face4][voice:v_unpattenered]...","[effect:none][func:Face10][voice:v_unpattenered]I don't think\nfriends yell at\neach other[w:25],[func:Face4]\nunprovoked...","[func:Face11][voice:v_unpattenered]...so I'll just ignore\nthat."}
				BattleDialog({"You yelled as loud as possible."})
				yell3 = yell3 + 1
			elseif yell3 == 1 then
				currentdialogue = {"[effect:none][func:Face11][voice:v_unpattenered]..."}
				BattleDialog({"Unpattenered is just ignoring\r'that.'"})
			end
		elseif command == "HUG" then
			if hug3 == 0 and (wave3 > 1 or wave3 == 0) then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]A hug?","[voice:v_unpattenered][effect:none][func:Face11]Well, don't mind if I\ndo."}
				BattleDialog({"You hug Unpattenered with all\ryour might.","You feel happier."})
				hug3 = hug3 + 1
			elseif hug3 == 0 and wave3 == 1 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face3]Hmm?[w:20][func:Face4] Oh[w:5],[func:Face11] Right!","[voice:v_unpattenered]Thank you for the\nhug!","[voice:v_unpattenered][func:Face0]Sorry for not\naccepting to be\nyour friend before.","[voice:v_unpattenered][func:Face11]We can make up that\ntime[w:10], together!"}
				BattleDialog({"You hug Unpattenered with all\ryour might.","You feel happier."})
				hug3 = hug3 + 1
			elseif hug3 == 1 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]A[w:2]h[w:2]h[w:2].[w:2].[w:2].","[voice:v_unpattenered][func:Face11]As much as I love\na good hug between\ntwo friends.","[voice:v_unpattenered][func:Face4]It's getting a\nlittle creepy.","[func:Face11][voice:v_unpattenered]I think we can hug\nlater."}
				BattleDialog({"Unpattenered feels another hug\ris too much."})
				hug3 = hug3 + 1
			elseif hug3 == 2 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face11]..."}
				BattleDialog({"Unpattenered said no more hugs."})
			end
		elseif command == "WAVE" then
			if wave3 == 0 and (hug3 > 1 or hug3 == 0) then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face11]Hi!"}
				BattleDialog({"You wave to Unpattenered in a\rfriendly manner."})
				wave3 = wave3 + 1
			elseif wave3 == 0 and hug3 == 1 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]Oh[w:10],[func:Face11] Right!","[voice:v_unpattenered]Hi!","[voice:v_unpattenered][func:Face0]Sorry for not\naccepting to be\nyour friend before.","[voice:v_unpattenered][func:Face11]We can make up that\ntime[w:10], together!"}
				BattleDialog({"You wave to Unpattenered in a\rfriendly manner."})
				wave3 = wave3 + 1
			elseif wave3 == 1 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face10]Are you waiting\nfor something to\nhappen?","[voice:v_unpattenered][effect:none][func:Face4]Or do you want me\nto do something?"}
				BattleDialog({"You wave to Unpattenered in a\rfriendly manner.","Again."})
				wave3 = wave3 + 1
			elseif wave3 == 2 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face10]...","[voice:v_unpattenered][effect:none][func:Face4]Right!","[voice:v_unpattenered][func:Face11]You do that!"}
				BattleDialog({"You wave your hands in the air.","For the 3rd time."})
				wave3 = wave3 + 1
			elseif wave3 == 3 then
				currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face11]..."}
				BattleDialog({"You wave your hands in the air."})
			end
		end
	elseif Q == 0 then
		if not (GetGlobal("Turn") >= 26 and GetGlobal("m") == 1) and not (GetGlobal("Turn") >= 26 and GetGlobal("b") == 1 and GetGlobal("m") ~= 1) then
			if command == "CHECK" then
				BattleDialog({"Unpattenered 6 ATK 8 DEF\nThis monster is very intelligent.","Yet[w:10], his engulfing thoughts can\rlead him to be unpredictable."})
			elseif command == "YELL" then
				if yell == 0 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[effect:none][func:Face4][voice:v_unpattenered]...","[effect:none][func:Face10][voice:v_unpattenered]Umm...?","[effect:none][func:Face4][voice:v_unpattenered]You okay there\nbuddy?","[func:Face9][effect:none][voice:v_unpattenered][w:10].[w:10].[w:10].","[effect:none][func:Face4][voice:v_unpattenered]Okay[w:20],[func:Face3] you do you!","[effect:none][func:Face0][voice:v_unpattenered]That is fine with me."}
					BattleDialog({"You ran and yelled as loud as\rpossible.","Unpattenered doesn't seem\rlike he knows what is happening."})
					yell = yell + 1
				elseif yell == 1 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[effect:none][func:Face10][voice:v_unpattenered]Umm...","[voice:v_unpattenered][effect:none][func:Face4]Sitting in battle\nis kinda random.","[voice:v_unpattenered][effect:none][func:Face0]...","[voice:v_unpattenered][effect:none][func:Face4]But, mostly you're\njust going to get\nhit."}
					BattleDialog({"You decide that yelling won't\rget you anywhere.", "So, you just sit."})
					yell = yell + 1
				elseif yell == 2 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[next]"}
					BattleDialog({"You decide to yell again.","No effect."})
					yell = yell + 1
				elseif yell == 3 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[next]"}
					BattleDialog({"You try once more.", "Zip effect.","Zip has happened."})
					yell = yell + 1
				elseif yell == 4 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[func:Face1][effect:none][voice:v_unpattenered]Okay, stop."}
					BattleDialog({"You try AGAIN.", "Nada happened.","[func:nada]Your name is now 'Nada.'"})
					yell = yell + 1
				elseif yell == 5 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[voice:v_unpattenered][func:Face1][effect:none]*Grumbles*"}
					BattleDialog({"You decide the game is trying\rto tell you something.", "...because of its repetitive use\rof NO EFFECT!"})
					yell = yell + 1
				elseif yell == 6 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face1]..."}
					BattleDialog({"Okay, that's it!", "No more dialog."})
					yell = yell + 1
				elseif yell >= 7 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face1]..."}
					BattleDialog({"..."})
					yell = yell + 1
				elseif GetGlobal("Attack2") == 1 and yell2 == 0 then
					BattleDialog({"Looks like Unpattenered doesn't\rwant to hear you yell."})
					yell2 = yell2 + 1
				elseif GetGlobal("Attack2") == 1 and yell2 == 1 then
					BattleDialog({"Unpattenered isn't hearing your\rbloodcurdling screams.","Surprisingly..."})
					yell2 = yell2 + 1
				elseif GetGlobal("Attack2") == 1 and yell2 >= 2 then
					BattleDialog({"You Yell, but nothing came out.","Maybe ACTING isn't the way to\rwin."})
				end
			elseif command == "HUG" then
				if hug == 0 and GetGlobal("Attack2") == 0 and (wave > 1 or wave == 0) then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]A hug?","[voice:v_unpattenered][effect:none][func:Face10]In a battle?","[voice:v_unpattenered][effect:none]Well[w:10],[func:Face3] if that makes\nyou happy.","[voice:v_unpattenered][effect:none][func:Face4]Then stand say while\nI [func:Face0]kill you."}
					BattleDialog({"You hug Unpattenered with all\ryour might.","You feel happier."})
					hug = hug + 1
				elseif hug == 0 and GetGlobal("Attack2") == 0 and wave == 1 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face10]Are...","[voice:v_unpattenered][func:Face4][effect:none]You trying to be my\nfriend.","[voice:v_unpattenered][effect:none]...","[voice:v_unpattenered][effect:none]Because[w:5],[func:Face0] I'm not\nintereseted."}
					BattleDialog({"You hug Unpattenered with all\ryour might.","You feel happier."})
					a = true
					wave = wave + 1
				elseif hug == 1 and GetGlobal("Attack2") == 0 and a == true then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face3]I said no."}
					BattleDialog({"Before you can get close[w:10],\rUnpattenered blocks you from\rany more hugging."})
					hug = hug + 1
					wave = wave + 1
				elseif hug == 1 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]No[w:10],[func:Face3] no more hugs."}
					BattleDialog({"Before you can get close[w:10],\rUnpattenered blocks you from\rany more hugging."})
					hug = hug + 1
				elseif hug >= 2 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face3]..."}
					BattleDialog({"Unpattenered doesn't let you\rclose."})
					hug = hug + 1
				elseif GetGlobal("Attack2") == 1 and hug2 == 0 then
					BattleDialog({"Unpattenered is firing too many\rbullets.","You can't get close."})
					hug2 = hug2 + 1
				elseif GetGlobal("Attack2") == 1 and hug2 == 1 then
					BattleDialog({"Unpattenered is going to get\rtired[w:10], soon","...By the amount of projectiles\rthat are being fired."})
					hug2 = hug2 + 1
				elseif GetGlobal("Attack2") == 1 and hug2 >= 2 then
					BattleDialog({"You can't get close.","Maybe ACTING isn't the way to\rwin."})
				end
			elseif command == "WAVE" then
				if wave == 0 and GetGlobal("Attack2") == 0 and (hug > 1 or hug == 0) then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]Umm...","[voice:v_unpattenered][effect:none]Hello[w:20],[func:Face10] to you[w:20],[func:Face4] too?"}
					BattleDialog({"You wave to Unpattenered in a\rfriendly manner."})
					wave = wave + 1
				elseif wave == 0 and GetGlobal("Attack2") == 0 and hug == 1 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face10]Are...","[voice:v_unpattenered][func:Face4][effect:none]You trying to be my\nfriend.","[voice:v_unpattenered][effect:none]...","[voice:v_unpattenered][effect:none]Because[w:5],[func:Face0] I'm not\nintereseted."}
					BattleDialog({"You wave to Unpattenered in a\rfriendly manner."})
					a = true
					wave = wave + 1
				elseif wave == 1 and GetGlobal("Attack2") == 0 and a == true then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]I said no."}
					BattleDialog({"Unpattenered doesn't seem like he\rwants to be friends at the\rmoment."})
					wave = wave + 1
					hug = hug + 1
				elseif wave == 1 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[voice:v_unpattenered][effect:none][func:Face4]...","[voice:v_unpattenered][effect:none]You're[w:10][func:Face10] not naive to\nwhat's happening[w:10],\n[func:Face4]right.","[voice:v_unpattenered][effect:none]You do realize I am\n[w:5][func:Face0]k[w:5]i[w:5]l[w:5]l[w:5]i[w:5]n[w:5]g[w:5] you[w:10], right?"}
					BattleDialog({"You try again."})
					wave = wave + 1
				elseif wave >= 2 and GetGlobal("Attack2") == 0 then
					currentdialogue = {"[next]"}
					BattleDialog({"..."})
					wave = wave + 1
				elseif GetGlobal("Attack2") == 1 and wave2 == 0 then
					BattleDialog({"You wave your hand.","Nothing happened."})
					wave2 = wave2 + 1
				elseif GetGlobal("Attack2") == 1 and wave2 == 1 then
					BattleDialog({"You wave your upper body.","Nothing happened."})
					wave2 = wave2 + 1
				elseif GetGlobal("Attack2") == 1 and wave2 == 2 then
					BattleDialog({"You wave everything.","Nothing happened."})
					wave2 = wave2 + 1
				elseif GetGlobal("Attack2") == 1 and wave2 >= 3 then
					BattleDialog({"Unpattenered doesn't seem to pay\rattention to your body waving.","Maybe ACTING isn't the way to\rwin."})
				end
			end
		end
	elseif Q == 1 then
		if command == "CHECK" then
			BattleDialog({"Unpattenered 6 ATK 8 DEF","[color:ff0000]He will regret living."})
		else
			BattleDialog({"..."})
		end
	end
end

function pausemusic()
	Audio.Pause()
end
function newbattle()
	SetGlobal("Attack2", 1)
end
function nada()
	Player.name = "Nada"
end
function music2()
	SetGlobal("Music", 1)
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