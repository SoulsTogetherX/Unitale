SetGlobal("L",1)
Audio.LoadFile("pokey")
Audio.Volume(1)
Audio.Pitch(1.5)
timer = 0
timer2 = 0
ttim = 0
a = 1
b = 1
c = 1
d = false
Side = 0
Randomx = 0
Randomy = 0
Arena.ResizeImmediate(100, 100)
Beam = CreateProjectile('Blank', 0, 0)
Beam.remove()
Beams1 = {}
Beams2 = {}
Beams3 = {}
Beams4 = {}
bullets = {}
bullets1 = {}
Lazer1 = {}
Lazer2 = {}
Lazer3 = {}
Lazer4 = {}
bullets_up = {}
bullets_down = {}
Spikes = {}
BulletU = {}
BulletD = {}
Warn = CreateProjectile('WarningRed', 99999, 99999)

Blaster1 = CreateProjectile('Blaster', 400, -80)

pole1 = CreateProjectile('Pole1',Blaster1.x+99999,Blaster1.y+99999)
pole1.sprite.rotation = 90

Blaster2 = CreateProjectile('Blaster', -80, -400)
Blaster2.sprite.rotation = -90

pole2 = CreateProjectile('Pole1',Blaster2.x+99999,Blaster2.y-99999)
pole2.sprite.rotation = 0

Blaster3 = CreateProjectile('Blaster', -400, 80)
Blaster3.sprite.rotation = 180

pole3 = CreateProjectile('Pole1',Blaster3.x-99999,Blaster3.y+99999)
pole3.sprite.rotation = 90

Blaster4 = CreateProjectile('Blaster', 80, 400)
Blaster4.sprite.rotation = 90

pole4 = CreateProjectile('Pole1',Blaster4.x-99999,Blaster4.y-99999)
pole4.sprite.rotation = 0

Blasters = {Blaster1, Blaster2, Blaster3, Blaster4}

for i=1,#Blasters do
    local bullet = Blasters[i]
    bullet.sprite.SendToTop()
end

function Update()
	timer = timer + 1
	if timer < 900 then
		pole1.MoveTo(Blaster1.x+240,Blaster1.y)
		pole2.MoveTo(Blaster2.x,Blaster2.y-240)
		pole3.MoveTo(Blaster3.x-240,Blaster3.y)
		pole4.MoveTo(Blaster4.x,Blaster4.y+240)
		if a == 1 then
			if Blaster1.x > 140 then
				Blaster1.MoveTo(Blaster1.x-10,Blaster1.y)
			elseif Blaster1.x < 140 then
				Blaster1.MoveTo(Blaster1.x+10,Blaster1.y)
			end
			if Blaster2.y < -140 then
				Blaster2.MoveTo(Blaster2.x,Blaster2.y+10)
			elseif Blaster2.y > -140 then
				Blaster2.MoveTo(Blaster2.x,Blaster2.y-10)
			end
			if Blaster3.x < -140 then
				Blaster3.MoveTo(Blaster3.x+10,Blaster3.y)
			elseif Blaster3.x > -140 then
				Blaster3.MoveTo(Blaster3.x-10,Blaster3.y)
			end
			if Blaster4.y > 140 then
				Blaster4.MoveTo(Blaster4.x,Blaster4.y-10)
			elseif Blaster4.y < 140 then
				Blaster4.MoveTo(Blaster4.x,Blaster4.y+10)
			end
		
			if Blaster1.y < -80 then
				Blaster1.MoveTo(Blaster1.x,Blaster1.y+10)
			elseif Blaster1.y > -80 then
				Blaster1.MoveTo(Blaster1.x,Blaster1.y-10)
				for i=1,#Beams1 do
					bullet = Beams1[i]
					bullet.MoveTo(bullet.x,bullet.y-10)
				end
			end
			if Blaster2.x > -80 then
				Blaster2.MoveTo(Blaster2.x-10,Blaster2.y)
				for i=1,#Beams2 do
					bullet = Beams2[i]
					bullet.MoveTo(bullet.x-10,bullet.y)
				end
			elseif Blaster2.x < -80 then
				Blaster2.MoveTo(Blaster2.x+10,Blaster2.y)
			end
			if Blaster3.y > 80 then
				Blaster3.MoveTo(Blaster3.x,Blaster3.y-10)
			elseif Blaster3.y < 80 then
				Blaster3.MoveTo(Blaster3.x,Blaster3.y+10)
				for i=1,#Beams3 do
					bullet = Beams3[i]
					bullet.MoveTo(bullet.x,bullet.y+10)
				end
			end
			if Blaster4.x < 80 then
				Blaster4.MoveTo(Blaster4.x+10,Blaster4.y)
				for i=1,#Beams4 do
					bullet = Beams4[i]
					bullet.MoveTo(bullet.x+10,bullet.y)
				end
			elseif Blaster4.x > 80 then
				Blaster4.MoveTo(Blaster4.x-10,Blaster4.y)
			end
		end
		if timer == 50 then
			Audio.PlaySound("00002a2e")
			Audio.PlaySound("00002a2e")
			Audio.PlaySound("00002a2e")
			Audio.PlaySound("00002a2e")
		end
		if timer == 120 then
			Beam1 = CreateProjectile('FastBeam', Blaster1.x-24, Blaster1.y)
			Beam1.SetVar("Type",4)
			table.insert(Beams1, Beam1)
			Beam2 = CreateProjectile('FastBeam', Blaster2.x, Blaster2.y+24)
			Beam2.sprite.rotation = 90
			Beam2.SetVar("Type",4)
			table.insert(Beams2, Beam2)
			Beam3 = CreateProjectile('FastBeam', Blaster3.x+24, Blaster3.y)
			Beam3.SetVar("Type",4)
			table.insert(Beams3, Beam3)
			Beam4 = CreateProjectile('FastBeam', Blaster4.x, Blaster4.y-24)
			Beam4.sprite.rotation = 90
			Beam4.SetVar("Type",4)
			table.insert(Beams4, Beam4)
			Audio.PlaySound("00002a30")
			Audio.PlaySound("00002a30")
			Audio.PlaySound("00002a30")
			Audio.PlaySound("00002a30")
		end
		if timer > 120 and timer < 140 then
			local bullet1 = CreateProjectile('FastBeam', Beam1.x-24, Beam1.y)
			bullet1.SetVar("Type",4)
			Beam1 = bullet1
			table.insert(Beams1, Beam1)
			local bullet2 = CreateProjectile('FastBeam', Beam2.x, Beam2.y+24)
			bullet2.sprite.rotation = 90
			bullet2.SetVar("Type",4)
			Beam2 = bullet2
			table.insert(Beams2, Beam2)
			local bullet3 = CreateProjectile('FastBeam', Beam3.x+24, Beam3.y)
			bullet3.SetVar("Type",4)
			Beam3 = bullet3
			table.insert(Beams3, Beam3)
			local bullet4 = CreateProjectile('FastBeam', Beam4.x, Beam4.y-24)
			bullet4.sprite.rotation = 90
			bullet4.SetVar("Type",4)
			Beam4 = bullet4
			table.insert(Beams4, Beam4)
		end
		if timer == 140 then
			Warn = CreateProjectile('WarningRed', 0, 0)
		end
		if timer > 140 then
			if timer%8 == 0 then
				b = b * -1
			end
			if b == 1 then
				Warn.sprite.Set("WarningRed")
			elseif b == -1 then
				Warn.sprite.Set("WarningYellow")
			end
			if timer%120 == 0 then
				Warn.remove()
				Randomx = math.random(-40,40)
				Randomy = math.random(-40,40)
				Warn = CreateProjectile('WarningRed', Randomx, Randomy)
				Audio.PlaySound("alarm")
			end
			if (timer-40)%60 == 0 then
				a = a*-1
			end
			if a == -1 then
				if Blaster1.y < Warn.y - 28 then
					Blaster1.MoveTo(Blaster1.x,Blaster1.y+10)
					for i=1,#Beams1 do
						bullet = Beams1[i]
						bullet.MoveTo(bullet.x,bullet.y+10)
					end
				end
				if Blaster2.x < Warn.x - 28 then
					Blaster2.MoveTo(Blaster2.x+10,Blaster2.y)
					for i=1,#Beams2 do
						bullet = Beams2[i]
						bullet.MoveTo(bullet.x+10,bullet.y)
					end
				end
				if Blaster3.y > Warn.y + 28 then
					Blaster3.MoveTo(Blaster3.x,Blaster3.y-10)
					for i=1,#Beams3 do
						bullet = Beams3[i]
						bullet.MoveTo(bullet.x,bullet.y-10)
					end
				end
				if Blaster4.x > Warn.x + 28 then
					Blaster4.MoveTo(Blaster4.x-10,Blaster4.y)
					for i=1,#Beams4 do
						bullet = Beams4[i]
						bullet.MoveTo(bullet.x-10,bullet.y)
					end
				end
			end
		end
	elseif timer == 900 then
		Warn.remove()
		Arrow1 = CreateProjectile('Arrow14', 130, 130)
		Arrow2 = CreateProjectile('Arrow14', -130, 130)
		Arrow3 = CreateProjectile('Arrow15', 130, -130)
		Arrow4 = CreateProjectile('Arrow15', -130, -130)
		tim = timer
		-- indepentently rotate within 90 degrees and shoot every so frames
	elseif timer < 1501 then
		if timer > 1000 then
			for i=1,#Beams1 do
				bullet = Beams1[i]
				if bullet.isactive == true then 
					bullet.MoveTo(bullet.x-24,bullet.y)
					if bullet.x < -300 then
						bullet.remove()
					end
				end
			end
			for i=1,#Beams2 do
				bullet = Beams2[i]
				if bullet.isactive == true then 
					bullet.MoveTo(bullet.x,bullet.y+24)
					if bullet.x < -300 then
						bullet.remove()
					end
				end
			end
			for i=1,#Beams3 do
				bullet = Beams3[i]
				if bullet.isactive == true then 
					bullet.MoveTo(bullet.x+24,bullet.y)
					if bullet.x < -300 then
						bullet.remove()
					end
				end
			end
			for i=1,#Beams4 do
				bullet = Beams4[i]
				if bullet.isactive == true then 
					bullet.MoveTo(bullet.x,bullet.y-24)
					if bullet.x < -300 then
						bullet.remove()
					end
				end
			end
			if timer < 1010 then
				Blaster1.MoveTo(Blaster1.x,Blaster1.y+10)
				Blaster3.MoveTo(Blaster3.x-10,Blaster3.y)
				Blaster4.MoveTo(Blaster4.x,Blaster4.y+10)
			end
			pole1.MoveTo(Blaster1.x+240,Blaster1.y)
			pole2.MoveTo(Blaster2.x,Blaster2.y-240)
			pole3.MoveTo(Blaster3.x-240,Blaster3.y)
			pole4.MoveTo(Blaster4.x,Blaster4.y+240)
		end
		if timer < 1400 then
			if (timer-901)%90 == 0 then
				tim = timer
				c = c*-1
			end
			if c == 1 then
				Arrow1.sprite.rotation = -timer-(tim-180)
				Arrow2.sprite.rotation = -timer-(tim-270)
				Arrow3.sprite.rotation = timer-(tim-360)
				Arrow4.sprite.rotation = timer-(tim-270)
			elseif c == -1 then
				Arrow1.sprite.rotation = timer-(tim-270)
				Arrow2.sprite.rotation = timer-(tim-360)
				Arrow3.sprite.rotation = -timer-(tim-90)
				Arrow4.sprite.rotation = -timer-(tim-360)
			end
			if timer%math.random(20,30) == 0 then
				local bullet = CreateProjectile('bulletA', Arrow1.x, Arrow1.y)
				bullet.SetVar("R", -(Arrow1.sprite.rotation-90)/2)
				bullet.SetVar("x", bullet.x)
				bullet.SetVar("y", bullet.y)
				bullet.SetVar("ttim", 0)
				bullet.SetVar("Type",1)
				table.insert(bullets, bullet)
				local bullet = CreateProjectile('bulletA', Arrow2.x, Arrow2.y)
				bullet.SetVar("R", -(Arrow2.sprite.rotation-90)/2)
				bullet.SetVar("x", bullet.x)
				bullet.SetVar("y", bullet.y)
				bullet.SetVar("ttim", 0)
				bullet.SetVar("Type",1)
				table.insert(bullets, bullet)
				local bullet = CreateProjectile('bulletA', Arrow3.x, Arrow3.y)
				bullet.SetVar("R", -(Arrow3.sprite.rotation+90)/2)
				bullet.SetVar("x", bullet.x)
				bullet.SetVar("y", bullet.y)
				bullet.SetVar("ttim", 0)
				bullet.SetVar("Type",1)
				table.insert(bullets, bullet)
				local bullet = CreateProjectile('bulletA', Arrow4.x, Arrow4.y)
				bullet.SetVar("R", -(Arrow4.sprite.rotation+45)/2)
				bullet.SetVar("x", bullet.x)
				bullet.SetVar("y", bullet.y)
				bullet.SetVar("ttim", 0)
				bullet.SetVar("Type",1)
				table.insert(bullets, bullet)
			end
		end
		if timer == 1300 then
			b1 = CreateProjectile('bulletA', 100, 100)
			b1.SetVar("Type",1)
			b2 = CreateProjectile('bulletA', 100, 100)
			b2.SetVar("Type",1)
			b3 = CreateProjectile('bulletA', 100, 100)
			b3.SetVar("Type",1)
			b4 = CreateProjectile('bulletA', 100, 100)
			b4.SetVar("Type",1)
			b5 = CreateProjectile('bulletA', 100, 100)
			b5.SetVar("Type",1)
			b6 = CreateProjectile('bulletA', 100, 100)
			b6.SetVar("Type",1)
			b7 = CreateProjectile('bulletA', 100, 100)
			b7.SetVar("Type",1)
			b8 = CreateProjectile('bulletA', 100, 100)
			b8.SetVar("Type",1)
		elseif timer > 1300 then
			if timer < 1500 then
				b1.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+0) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+0) / 25) + 0))
				b2.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+20) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+20) / 25) + 0))
				b3.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+40) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+40) / 25) + 0))
				b4.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+60) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+60) / 25) + 0))
				b5.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+80) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+80) / 25) + 0))
				b6.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+100) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+100) / 25) + 0))
				b7.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+120) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+120) / 25) + 0))
				b8.MoveTo(((200-(timer-1300)) * math.cos(((timer-1300)+140) / 25) + 0),((-(200-(timer-1300))) * math.sin(((timer-1300)+140) / 25) + 0))
			end
			if timer == 1500 then
				b1.remove()
				b2.remove()
				b3.remove()
				b4.remove()
				b5.remove()
				b6.remove()
				b7.remove()
				b8.remove()
			end
		end
		if timer == 1400 then
			W1 =  CreateProjectile('!1', 60, 60)
			W2 =  CreateProjectile('!1', -60, 60)
			W3 =  CreateProjectile('!1', 60, -60)
			W4 =  CreateProjectile('!1', -60, -60)
			Warns = {W1, W2, W3, W4}
		end
		if timer > 1400 then
			Arrow1.sprite.alpha = 1/((timer-1400)/2)
			Arrow2.sprite.alpha = 1/((timer-1400)/2)
			Arrow3.sprite.alpha = 1/((timer-1400)/2)
			Arrow4.sprite.alpha = 1/((timer-1400)/2)
		end
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive then
				bullet.SetVar("ttim", bullet.GetVar("ttim") + 1)
				bullet.MoveTo(((bullet.GetVar("ttim")) * math.cos((bullet.GetVar("R")) / 25) + bullet.GetVar("x")),((-(bullet.GetVar("ttim"))) * math.sin((bullet.GetVar("R")) / 25) + bullet.GetVar("y")))
				if bullet.GetVar("ttim") > 500 then
					bullet.remove()
				end
			end
		end
	elseif timer == 1501 then
		Arena.ResizeImmediate(155, 155)
		XCountDown1 = 0
		YCountDown1 = 0
		Bullet1 = CreateProjectile('bulletB',60,60)
		Bullet1.SetVar("Type",1)
		XMove1 = (1.2*math.random()) + 0.7
		YMove1 = (2*math.random()) + 0.7

		XCountDown2 = 0
		YCountDown2 = 0
		Bullet2 = CreateProjectile('bulletB',-60,-60)
		Bullet2.SetVar("Type",1)
		XMove2 = (-1.2*math.random()) - 0.7
		YMove2 = (-2*math.random()) - 0.7

		XCountDown3 = 0
		YCountDown3 = 0
		Bullet3 = CreateProjectile('bulletB',60,-60)
		Bullet3.SetVar("Type",1)
		XMove3 = (2*math.random()) + 0.7
		YMove3 = (-1.2*math.random()) - 0.7

		XCountDown4 = 0
		YCountDown4 = 0
		Bullet4 = CreateProjectile('bulletB',-60,60)
		Bullet4.SetVar("Type",1)
		XMove4 = (-2*math.random()) - 0.7
		YMove4 = (1.2*math.random()) + 0.7
		for i=1,#Warns do
			local bullet = bullets[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
	elseif timer < 3480 then
		for i=1,#bullets do
			local bullet = bullets[i]
			if bullet.isactive == true then
				bullet.SetVar("ttim", bullet.GetVar("ttim") + 1)
				bullet.MoveTo(((bullet.GetVar("ttim")) * math.cos((bullet.GetVar("R")) / 25) + bullet.GetVar("x")),((-(bullet.GetVar("ttim"))) * math.sin((bullet.GetVar("R")) / 25) + bullet.GetVar("y")))
				if bullet.GetVar("ttim") > 500 then
					bullet.remove()
				end
			end
		end
		for i=1,#Warns do
			local bullet = Warns[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		Bullet1.MoveTo((Bullet1.x + XMove1), (Bullet1.y + YMove1))
		if ((-Arena.width) / 2 > Bullet1.x or Arena.width / 2 < Bullet1.x) and XCountDown1 == 0 then
			XMove1 = XMove1 * (-1)
			XCountDown1 = 10
		end
		if ((-Arena.height) / 2 > Bullet1.y or Arena.height / 2 < Bullet1.y) and YCountDown1 == 0 then
			YMove1 = YMove1 * (-1)
			YCountDown1 = 10
		end
		if XCountDown1 > 0 then
			XCountDown1 = XCountDown1 - 1
		end
		if YCountDown1 > 0 then
			YCountDown1 = YCountDown1 - 1
		end

		Bullet2.MoveTo((Bullet2.x + XMove2), (Bullet2.y + YMove2))
		if ((-Arena.width) / 2 > Bullet2.x or Arena.width / 2 < Bullet2.x) and XCountDown2 == 0 then
			XMove2 = XMove2 * (-1)
			XCountDown2 = 10
		end
		if ((-Arena.height) / 2 > Bullet2.y or Arena.height / 2 < Bullet2.y) and YCountDown2 == 0 then
			YMove2 = YMove2 * (-1)
			YCountDown2 = 10
		end
		if XCountDown2 > 0 then
			XCountDown2 = XCountDown2 - 1
		end
		if YCountDown2 > 0 then
			YCountDown2 = YCountDown2 - 1
		end
		
		Bullet3.MoveTo((Bullet3.x + XMove3), (Bullet3.y + YMove3))
		if ((-Arena.width) / 2 > Bullet3.x or Arena.width / 2 < Bullet3.x) and XCountDown3 == 0 then
			XMove3 = XMove3 * (-1)
			XCountDown3 = 10
		end
		if ((-Arena.height) / 2 > Bullet3.y or Arena.height / 2 < Bullet3.y) and YCountDown3 == 0 then
			YMove3 = YMove3 * (-1)
			YCountDown3 = 10
		end
		if XCountDown3 > 0 then
			XCountDown3 = XCountDown3 - 1
		end
		if YCountDown3 > 0 then
			YCountDown3 = YCountDown3 - 1
		end
		
		Bullet4.MoveTo((Bullet4.x + XMove4), (Bullet4.y + YMove4))
		if ((-Arena.width) / 2 > Bullet4.x or Arena.width / 2 < Bullet4.x) and XCountDown4 == 0 then
			XMove4 = XMove4 * (-1)
			XCountDown4 = 10
		end
		if ((-Arena.height) / 2 > Bullet4.y or Arena.height / 2 < Bullet4.y) and YCountDown4 == 0 then
			YMove4 = YMove4 * (-1)
			YCountDown4 = 10
		end
		if XCountDown4 > 0 then
			XCountDown4 = XCountDown4 - 1
		end
		if YCountDown4 > 0 then
			YCountDown4 = YCountDown4 - 1
		end
		if timer == 1650 then
			Side = math.random()*4
		elseif timer > 1650 then
			if timer2 >= 200 then
				for i=1,#bullets1 do
					bullet = bullets1[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				timer2 = 0
				Side = math.random()*4
				Side2 = math.random()*2
			end
			if Side > 0 and Side <= 1 then
				 if timer2 == 0 then
					 Knife = CreateProjectile('Knife_right',(80 * math.cos((16) / 15)),(-80 * math.sin((18) / 14) + 200))
					 Knife.sprite.alpha = 0
					 Knife.sprite.rotation = -90
				 end
				 timer2 = timer2 + 1
				 Knife.sprite.alpha = timer2/30
				 if timer2 == 35 then
					 Audio.PlaySound("slice")
				 elseif timer2 == 85 then
					 Audio.PlaySound("000029a2")
				 end
				 if timer2 < 50 and timer2 > 30 then
					 Knife.sprite.rotation = -90 - (timer2-30)
					 Knife.MoveTo((80 * math.cos((timer2-16) / 15)),(-80 * math.sin((timer2-18) / 14) + 200))
					 local bullet = CreateProjectile('bulletB',(100 * math.cos((timer2-16) / 15)),(-100 * math.sin((timer2-18) / 14) + 200))
					 bullet.sprite.color = { 1.00, 0.00, 0.00 }
					 bullet.SetVar("Type",5)
					 table.insert(bullets1, bullet)
				 elseif timer2 > 80 then
					 Knife.sprite.alpha = 1 - ((timer2-80)/30)
					 for i=1,#bullets1 do
						local bullet = bullets1[i]
						if bullet.isactive == true then
							bullet.MoveTo(bullet.x,bullet.y-6)
						end
					 end
				 end
			elseif Side > 1 and Side <= 2 then
				 if timer2 == 0 then
					 Knife = CreateProjectile('Knife_right',(-80 * math.cos((40) / 15)) + 200,(80 * math.sin((38) / 14)) - 12)
					 Knife.sprite.alpha = 0
					 Knife.sprite.rotation = 180
				 end
				 timer2 = timer2 + 1
				 Knife.sprite.alpha = timer2/30
				 if timer2 == 35 then
					 Audio.PlaySound("slice")
				 elseif timer2 == 85 then
					 Audio.PlaySound("000029a2")
				 end
				 if timer2 < 50 and timer2 > 30 then
					 Knife.sprite.rotation = 0 - (timer2-30)
					 Knife.MoveTo((-80 * math.cos((timer2-40) / 15)) + 200,(80 * math.sin((timer2-38) / 14)) - 12)
					 local bullet = CreateProjectile('bulletB',(-100 * math.cos((timer2-40) / 15)) + 200,(100 * math.sin((timer2-38) / 14)) - 12)
					 bullet.sprite.color = { 1.00, 0.00, 0.00 }
					 bullet.SetVar("Type",5)
					 table.insert(bullets1, bullet)
				 elseif timer2 > 80 then
					 Knife.sprite.alpha = 1 - ((timer2-80)/30)
					 for i=1,#bullets1 do
						local bullet = bullets1[i]
						if bullet.isactive == true then
							bullet.MoveTo(bullet.x-6,bullet.y)
						end
					 end
				 end
			elseif Side > 2 and Side <= 3 then
				 if timer2 == 0 then
					 Knife = CreateProjectile('Knife_right',(80 * math.cos((40) / 15)) - 200,(-80 * math.sin((42) / 14)) - 12)
					 Knife.sprite.alpha = 0
					 Knife.sprite.rotation = 0
				 end
				 timer2 = timer2 + 1
				 Knife.sprite.alpha = timer2/30
				 if timer2 == 35 then
					 Audio.PlaySound("slice")
				 elseif timer2 == 85 then
					 Audio.PlaySound("000029a2")
				 end
				 if timer2 < 50 and timer2 > 30 then
					 Knife.sprite.rotation = 0 - (timer2-30)
					 Knife.MoveTo((80 * math.cos((timer2-40) / 15)) - 200,(-80 * math.sin((timer2-42) / 14)) - 12)
					 local bullet = CreateProjectile('bulletB',(100 * math.cos((timer2-40) / 15)) - 200,(-100 * math.sin((timer2-42) / 14)) - 12)
					 bullet.sprite.color = { 1.00, 0.00, 0.00 }
					 bullet.SetVar("Type",5)
					 table.insert(bullets1, bullet)
				 elseif timer2 > 80 then
					 Knife.sprite.alpha = 1 - ((timer2-80)/30)
					 for i=1,#bullets1 do
						local bullet = bullets1[i]
						if bullet.isactive == true then
							bullet.MoveTo(bullet.x+6,bullet.y)
						end
					 end
				 end
			elseif Side > 3 and Side <= 4 then
				 if timer2 == 0 then
					 Knife = CreateProjectile('Knife_right',(80 * math.cos((64) / 15)),(-80 * math.sin((62) / 14) - 200))
					 Knife.sprite.alpha = 0
					 Knife.sprite.rotation = 90
				 end
				 timer2 = timer2 + 1
				 Knife.sprite.alpha = timer2/30
				 if timer2 == 35 then
					 Audio.PlaySound("slice")
				 elseif timer2 == 85 then
					 Audio.PlaySound("000029a2")
				 end
				 if timer2 < 50 and timer2 > 30 then
					 Knife.sprite.rotation = 90 - (timer2-30)
					 Knife.MoveTo((80 * math.cos((timer2-64) / 15)),(-80 * math.sin((timer2-62) / 14) - 200))
					 local bullet = CreateProjectile('bulletB',(100 * math.cos((timer2-64) / 15)),(-100 * math.sin((timer2-62) / 14) - 200))
					 bullet.sprite.color = { 1.00, 0.00, 0.00 }
					 bullet.SetVar("Type",5)
					 table.insert(bullets1, bullet)
				 elseif timer2 > 80 then
					 Knife.sprite.alpha = 1 - ((timer2-80)/30)
					 for i=1,#bullets1 do
						local bullet = bullets1[i]
						if bullet.isactive == true then
							bullet.MoveTo(bullet.x,bullet.y+6)
						end
					 end
				 end
			end
		end
		if timer == 2600 then
			b1 = CreateProjectile('bulletA', 100, 100)
			b1.SetVar("Type",1)
			b2 = CreateProjectile('bulletA', 100, 100)
			b2.SetVar("Type",1)
			b3 = CreateProjectile('bulletA', 100, 100)
			b3.SetVar("Type",1)
			b4 = CreateProjectile('bulletA', 100, 100)
			b4.SetVar("Type",1)
			b5 = CreateProjectile('bulletA', 100, 100)
			b5.SetVar("Type",1)
			b6 = CreateProjectile('bulletA', 100, 100)
			b6.SetVar("Type",1)
			b7 = CreateProjectile('bulletA', 100, 100)
			b7.SetVar("Type",1)
			b8 = CreateProjectile('bulletA', 100, 100)
			b8.SetVar("Type",1)

			b9 = CreateProjectile('bulletA', 100, 100)
			b9.SetVar("Type",1)
			b10 = CreateProjectile('bulletA', 100, 100)
			b10.SetVar("Type",1)
			b11 = CreateProjectile('bulletA', 100, 100)
			b11.SetVar("Type",1)
			b12 = CreateProjectile('bulletA', 100, 100)
			b12.SetVar("Type",1)
			b13 = CreateProjectile('bulletA', 100, 100)
			b13.SetVar("Type",1)
			b14 = CreateProjectile('bulletA', 100, 100)
			b14.SetVar("Type",1)
			b15 = CreateProjectile('bulletA', 100, 100)
			b15.SetVar("Type",1)
			b16 = CreateProjectile('bulletA', 100, 100)
			b16.SetVar("Type",1)
			
			b17 = CreateProjectile('bulletA', 100, 100)
			b17.SetVar("Type",1)
			b18 = CreateProjectile('bulletA', 100, 100)
			b18.SetVar("Type",1)
			b19 = CreateProjectile('bulletA', 100, 100)
			b19.SetVar("Type",1)
			b20 = CreateProjectile('bulletA', 100, 100)
			b20.SetVar("Type",1)
			b21 = CreateProjectile('bulletA', 100, 100)
			b21.SetVar("Type",1)
		elseif timer > 2600 then
			b1.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+0) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+0) / 25) + 0))
			b2.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+22) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+22) / 25) + 0))
			b3.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+44) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+44) / 25) + 0))
			b4.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+66) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+66) / 25) + 0))
			b5.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+88) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+88) / 25) + 0))
			b6.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+110) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+110) / 25) + 0))
			b7.MoveTo(((200-(timer-2600)) * math.cos(((timer-2600)+132) / 25) + 0),((-(200-(timer-2600))) * math.sin(((timer-2600)+132) / 25) + 0))
			
			b8.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+0) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+0) / 25) + 0))
			b9.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+22) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+22) / 25) + 0))
			b10.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+44) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+44) / 25) + 0))
			b11.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+66) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+66) / 25) + 0))
			b12.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+88) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+88) / 25) + 0))
			b13.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+110) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+110) / 25) + 0))
			b14.MoveTo(((300-(timer-2600)) * math.sin(((timer-2600)+132) / 25) + 0),(-((300-(timer-2600))) * math.cos(((timer-2600)+132) / 25) + 0))

			b15.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+0) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+0) / 25) + 0))
			b16.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+22) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+22) / 25) + 0))
			b17.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+44) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+44) / 25) + 0))
			b18.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+66) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+66) / 25) + 0))
			b19.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+88) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+88) / 25) + 0))
			b20.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+110) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+110) / 25) + 0))
			b21.MoveTo(((400-(timer-2600)) * math.cos(((timer-2600)+132) / 25) + 0),((-(400-(timer-2600))) * math.sin(((timer-2600)+132) / 25) + 0))
		end
		if timer >= 2000 then
			pole1.MoveTo(Blaster1.x+240,Blaster1.y)
			pole2.MoveTo(Blaster2.x,Blaster2.y-240)
			pole3.MoveTo(Blaster3.x-240,Blaster3.y)
			pole4.MoveTo(Blaster4.x,Blaster4.y+240)
			for i=1,#Lazer1 do
				local bullet = Lazer1[i]
				if bullet.isactive == true then
					bullet.SetVar("Type",4)
					bullet.MoveTo(bullet.x-6,bullet.y)
					if bullet.x < -360 then
						bullet.remove()
					end
				end
			end
			for i=1,#Lazer2 do
				local bullet = Lazer2[i]
				if bullet.isactive == true then
					bullet.SetVar("Type",4)
					bullet.MoveTo(bullet.x+6,bullet.y)
					if bullet.x > 360 then
						bullet.remove()
					end
				end
			end
			for i=1,#Lazer3 do
				local bullet = Lazer3[i]
				if bullet.isactive == true then
					bullet.SetVar("Type",4)
					bullet.MoveTo(bullet.x,bullet.y-6)
					if bullet.y < -360 then
						bullet.remove()
					end
				end
			end
			for i=1,#Lazer4 do
				local bullet = Lazer4[i]
				if bullet.isactive == true then
					bullet.SetVar("Type",4)
					bullet.MoveTo(bullet.x,bullet.y+6)
					if bullet.y > 360 then
						bullet.remove()
					end
				end
			end
			if (Side > 0 and Side <= 1) or (Side > 3 and Side <= 4) then
				if Side2 > 0 and Side2 <= 1 then
					if timer2 < 100 then
						if Player.y > Blaster1.y then
							Blaster1.MoveTo(Blaster1.x,Blaster1.y+1)
						elseif Player.x < Blaster1.x then
							Blaster1.MoveTo(Blaster1.x,Blaster1.y-1)
						end
					end
					if timer2 > 100 then
						Lazer = CreateProjectile('FastBeam', Blaster1.x-24, Blaster1.y)
						table.insert(Lazer1, Lazer)
					end
				elseif Side2 > 1 and Side2 <= 2 then
					if timer2 < 100 then
						if Player.y > Blaster3.y then
							Blaster3.MoveTo(Blaster3.x,Blaster3.y+1)
						elseif Player.y < Blaster3.y then
							Blaster3.MoveTo(Blaster3.x,Blaster3.y-1)
						end
					end
					if timer2 > 100 then
						Lazer = CreateProjectile('FastBeam', Blaster3.x+24, Blaster3.y)
						table.insert(Lazer2, Lazer)
					end
				end
			elseif Side > 1 and Side <= 3 then
				if Side2 > 0 and Side2 <= 1 then
					if timer2 < 100 then
						if Player.x > Blaster2.x then
							Blaster2.MoveTo(Blaster2.x+1,Blaster2.y)
						elseif Player.x < Blaster2.x then
							Blaster2.MoveTo(Blaster2.x-1,Blaster2.y)
						end
					end
					if timer2 > 100 then
						Lazer = CreateProjectile('FastBeam', Blaster2.x, Blaster2.y+24)
						table.insert(Lazer4, Lazer)
					end
				elseif Side2 > 1 and Side2 <= 2 then
					if timer2 < 100 then
						if Player.x > Blaster4.x then
							Blaster4.MoveTo(Blaster4.x+1,Blaster4.y)
						elseif Player.x < Blaster4.x then
							Blaster4.MoveTo(Blaster4.x-1,Blaster4.y)
						end
					end
					if timer2 > 100 then
						Lazer = CreateProjectile('FastBeam', Blaster4.x, Blaster4.y-24)
						table.insert(Lazer3, Lazer)
					end
				end
			end
		end
	elseif timer < 5045 then
		Arena.Resize(16, 200)
		pole1.MoveTo(Blaster1.x+240,Blaster1.y)
		pole2.MoveTo(Blaster2.x,Blaster2.y-240)
		pole3.MoveTo(Blaster3.x-240,Blaster3.y)
		pole4.MoveTo(Blaster4.x,Blaster4.y+240)
		for i=1,#Lazer1 do
			local bullet = Lazer1[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		for i=1,#Lazer2 do
			local bullet = Lazer2[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		for i=1,#Lazer3 do
			local bullet = Lazer3[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		for i=1,#Lazer4 do
			local bullet = Lazer4[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		if Bullet1.isactive == true then
			Bullet1.remove()
		elseif Bullet2.isactive == true then
			Bullet2.remove()
		elseif Bullet3.isactive == true then
			Bullet3.remove()
		elseif Bullet4.isactive == true then
			Bullet4.remove()
		elseif Knife.isactive == true then
			Knife.remove()
		end
		if (timer+50)%100 == 0 then -- 15 is how many frames it takes to create another bullet
			local posx = 0
			local posy = -120
			local bullet = CreateProjectile('bone', posx, posy)
			bullet.sprite.rotation = 90
			bullet.ppcollision = true
			bullet.SetVar('velx', 0)
			bullet.SetVar('vely', 0)
			local isOrange = math.random() >= 0.5
			if isOrange then
				bullet.sprite.color = { 1.00, 0.65, 0.00 }
				Orangebullet = bullet
				table.insert(bullets_up, Orangebullet)
				Orangebullet.SetVar("Type", 2)
			else
				bullet.sprite.color = { 0.02, 0.37, 0.97 }
				Bluebullet = bullet
				table.insert(bullets_up, Bluebullet)
				Bluebullet.SetVar("Type", 3)
			end
		end
		if (timer+50)%100 == 0 then -- 15 is how many frames it takes to create another bullet
			local posx = 0
			local posy = 120
			local bullet = CreateProjectile('bone', posx, posy)
			bullet.sprite.rotation = 90
			bullet.ppcollision = true
			bullet.SetVar('velx', 0)
			bullet.SetVar('vely', 0)
			local isOrange = math.random() >= 0.5
			if isOrange then
				bullet.sprite.color = { 1.00, 0.65, 0.00 }
				Orangebullet = bullet
				table.insert(bullets_down, Orangebullet)
				Orangebullet.SetVar("Type", 2)
			else
				bullet.sprite.color = { 0.02, 0.37, 0.97 }
				Bluebullet = bullet
				table.insert(bullets_down, Bluebullet)
				Bluebullet.SetVar("Type", 3)
			end
		end
		for i=1,#bullets_up do
			local bullet = bullets_up[i]
			if bullet.isactive == true then
			   local velx = bullet.GetVar('velx')
			   local newposy = bullet.y + 1
			   bullet.MoveTo(velx, newposy)
			   bullet.SetVar('velx', velx)
			end
			if bullet.y > (Arena.height/2)+15 and bullet.isactive == true then
			  bullet.Remove()
			end
		end
		for i=1,#bullets_down do
			local bullet = bullets_down[i]
			if bullet.isactive == true then
			   local velx = bullet.GetVar('velx')
			   local newposy = bullet.y - 1
			   bullet.MoveTo(velx, newposy)
			   bullet.SetVar('velx', velx)
			end
			if bullet.y < -(Arena.height/2)-15 and bullet.isactive == true then
			  bullet.Remove()
			end
		end
		if timer == 3720 then
			Beam1 = CreateProjectile('FastBeam', Blaster1.x-24, Blaster1.y)
			Beam1.SetVar("Type",4)
			table.insert(Beams1, Beam1)
			Audio.PlaySound("00002a30")
		elseif timer > 3720 then
			if Blaster1.y > -45 then
				Blaster1.MoveTo(Blaster1.x,Blaster1.y-0.2)
				for i=1,#Beams1 do
					bullet = Beams1[i]
					if bullet.isactive then
						bullet.MoveTo(bullet.x,bullet.y-0.2)
					end
				end
			end	
			if timer < 3740 then
				local bullet1 = CreateProjectile('FastBeam', Beam1.x-24, Beam1.y)
				bullet1.SetVar("Type",4)
				Beam1 = bullet1
				table.insert(Beams1, Beam1)
			end
		elseif timer > 3490 then
			if timer == 3650 then
				Audio.PlaySound("00002a2e")
			end
			if Blaster1.y < 120 then
				Blaster1.MoveTo(Blaster1.x,Blaster1.y+3)
			end
		end
	elseif timer == 5045 then
		Arena.ResizeImmediate(16, 180)
		Munch1 = CreateProjectile('Spikes', 100, 100)
		Munch1.sprite.xscale=2
		Munch1.sprite.yscale=2
		Munch1.SetVar("Type",5)
		Munch2 = CreateProjectile('Spikes', 100, 100)
		Munch2.sprite.rotation = 180
		Munch2.sprite.xscale=2
		Munch2.sprite.yscale=2
		Munch2.SetVar("Type",5)
	elseif timer > 5045 then
		Arena.ResizeImmediate(16, 180)
		pole1.MoveTo(Blaster1.x+240,Blaster1.y)
		pole2.MoveTo(Blaster2.x,Blaster2.y-240)
		pole3.MoveTo(Blaster3.x-240,Blaster3.y)
		pole4.MoveTo(Blaster4.x,Blaster4.y+240)

		Blaster1.MoveTo(Blaster1.x+5,Blaster1.y)
		Blaster2.MoveTo(Blaster2.x,Blaster2.y-5)
		Blaster3.MoveTo(Blaster3.x-5,Blaster3.y)
		Blaster4.MoveTo(Blaster4.x,Blaster4.y+5)
		for i=1,#Beams1 do
			local bullet = Beams1[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		for i=1,#bullets_down do
			local bullet = bullets_down[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		for i=1,#bullets_up do
			local bullet = bullets_up[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		Munch1.MoveTo((30 * math.cos((timer) / 7) - 25),(-70 * math.sin((timer+400) / 30) + 0))
		Munch2.MoveTo((30 * math.cos((timer-20) / 7) + 25),(-70 * math.sin((timer+400) / 30) + 0))
	end
	function OnHit(bullet)
		if bullet.isactive then
			if bullet.GetVar("Type") == 1 then
				Player.Hurt(3)
			elseif bullet.GetVar("Type") == 2 and not Player.isMoving then
				Player.Hurt(2)
			elseif bullet.GetVar("Type") == 3 and Player.isMoving then
				Player.Hurt(2)
			elseif bullet.GetVar("Type") == 4 then
				Player.Hurt(6)
			elseif bullet.GetVar("Type") == 5 then
				Player.Hurt(4)
			end
		end
	end
	if timer >= 5555 then
		SetGlobal("Turn",30)
		EndWave()
	end
end
