Audio.Play()
tim = 0
timer = 0
timer2 = 0
timer3 = 200
bullets = {}
bullets2 = {}
bullets3 = {}
bullets4 = {}
bullets5 = {}
bones = {}
bones2 = {}
Corners = {}
Blasters = {}
Poles = {}
Beams = {}
Rbullets = {}
Ubullets = {}

R1 = 0
R2 = 0
Arena.ResizeImmediate(150, 150)
Player.MoveTo(0,0,false)
Warning1 = CreateProjectile('CircleWarning', Arena.width/2-30, -Arena.height/2+30)
Warning1.sprite.xscale = 2
Warning1.sprite.yscale = 2
Warning1.SetVar("Type", 0)
Ex1 = CreateProjectile('!', Arena.width/2-30, -Arena.height/2+30)

Warning2 = CreateProjectile('CircleWarning', -Arena.width/2+30, Arena.height/2-30)
Warning2.sprite.xscale = 2
Warning2.sprite.yscale = 2
Warning2.sprite.rotation = 180
Warning2.SetVar("Type", 0)
Ex2 = CreateProjectile('!', -Arena.width/2+30, Arena.height/2-30)

Warning3 = CreateProjectile('CircleWarning', -Arena.width/2+30, -Arena.height/2+30)
Warning3.sprite.xscale = 2
Warning3.sprite.yscale = 2
Warning3.sprite.rotation = -90
Warning3.SetVar("Type", 0)
Ex3 = CreateProjectile('!', -Arena.width/2+30, -Arena.height/2+30)

Warning4 = CreateProjectile('CircleWarning', Arena.width/2-30, Arena.height/2-30)
Warning4.sprite.xscale = 2
Warning4.sprite.yscale = 2
Warning4.sprite.rotation = 90
Warning4.SetVar("Type", 0)
Ex4 = CreateProjectile('!', Arena.width/2-30, Arena.height/2-30)

Warnings = {Warning1, Warning2, Warning3, Warning4, Ex1, Ex2, Ex3, Ex4}
Exs = {Ex1, Ex2, Ex3, Ex4}

Flash = 1

function Update()
    timer = timer + 1
	if timer%8 == 0 then
	    Flash = Flash*(-1)
	end
    if timer >= 100 then
	    for i=1,#Warnings do
		    local bullet = Warnings[i]
	        if bullet.isactive then
		        bullet.Remove()
		    end
		end
	else
	    for i=1,#Exs do 
		    local bullet = Exs[i]
	    	if Flash == 1 then
		        bullet.sprite.Set("!")
		    elseif Flash == -1 then
		        bullet.sprite.Set("!1")
		    end 
        end
	end
	if timer < 100 then
		if timer%16 == 0 then
			Audio.PlaySound("alarm")
		end
	end
	if timer%1 == 0 and timer <= 142 and timer > 100 then
	    local bullet1 = CreateProjectile('pixel', ((60) * math.sin((timer+15) / 25) + Arena.width/2),((-(60)) * math.cos((timer+15) / 25) + Arena.height/2))
		bullet1.SetVar('Type', 1)
		table.insert(bullets, bullet1)
		local bullet2 = CreateProjectile('pixel', (-(60) * math.cos((timer-23) / 25) - Arena.width/2), ((60)) * math.sin((timer-23) / 25) + Arena.height/2)
		bullet2.SetVar('Type', 1)
		table.insert(bullets, bullet2)
	    local bullet3 = CreateProjectile('pixel', (-(60) * math.cos((timer-102) / 25) + Arena.width/2),(((60)) * math.sin((timer-102) / 25) - Arena.height/2))
		bullet3.SetVar('Type', 1)
		table.insert(bullets, bullet3)
	    local bullet4 = CreateProjectile('pixel', (-(60) * math.cos((timer-23) / 25) - Arena.width/2),((-(60)) * math.sin((timer-23) / 25) - Arena.height/2))
		bullet4.SetVar('Type', 1)
		table.insert(bullets, bullet4)
	elseif timer == 143 then
        Corner1 = CreateProjectile('CircleQ', Arena.width/2-30, -Arena.height/2+30)
        Corner1.sprite.xscale = 2
        Corner1.sprite.yscale = 2
		Corner2 = CreateProjectile('CircleQ', -Arena.width/2+30, Arena.height/2-30)
        Corner2.sprite.xscale = 2
        Corner2.sprite.yscale = 2
        Corner2.sprite.rotation = 180
		Corner3 = CreateProjectile('CircleQ', -Arena.width/2+30, -Arena.height/2+30)
		Corner3.sprite.xscale = 2
		Corner3.sprite.yscale = 2
		Corner3.sprite.rotation = -90
		Corner4 = CreateProjectile('CircleQ', Arena.width/2-30, Arena.height/2-30)
		Corner4.sprite.xscale = 2
		Corner4.sprite.yscale = 2
		Corner4.sprite.rotation = 90
		Corners = {Corner1, Corner2, Corner3, Corner4}
	elseif timer > 143 and timer < 2000 then
	    if (timer)%60 == 0 and timer < 1000 then
	        D = (math.random()*8)
		    if D > 0 and D < 1 then
			    local Bone = CreateProjectile('bone', Arena.width/2+50, 0)
				table.insert(bones, Bone)
				Bone.SetVar("Move", 1)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 1 and D < 2 then
			    local Bone = CreateProjectile('bone', -Arena.width/2-50, 0)
				table.insert(bones, Bone)
				Bone.SetVar("Move", 2)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 2 and D < 3 then
			    local Bone = CreateProjectile('bone', 0, Arena.height/2+50)
				Bone.sprite.rotation = 90
				table.insert(bones, Bone)
				Bone.SetVar("Move", 3)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 3 and D < 4 then
			    local Bone = CreateProjectile('bone', 0, -Arena.height/2-50)
				Bone.sprite.rotation = 90
				table.insert(bones, Bone)
				Bone.SetVar("Move", 4)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 4 and D < 5 then
			    local Bone = CreateProjectile('bone', -Arena.width/2-50, -Arena.height/2-50)
				Bone.sprite.rotation = 45
				table.insert(bones, Bone)
				Bone.SetVar("Move", 5)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 5 and D < 6 then
			    local Bone = CreateProjectile('bone', -Arena.width/2-50, Arena.height/2+50)
				Bone.sprite.rotation = -45
				table.insert(bones, Bone)
				Bone.SetVar("Move", 6)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 6 and D < 7 then
			    local Bone = CreateProjectile('bone', Arena.width/2+50, -Arena.height/2-50)
				Bone.sprite.rotation = -45
				table.insert(bones, Bone)
				Bone.SetVar("Move", 7)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			elseif D > 7 and D < 8 then
			    local Bone = CreateProjectile('bone', Arena.width/2+50, Arena.height/2+50)
				Bone.sprite.rotation = 45
				table.insert(bones, Bone)
				Bone.SetVar("Move", 8)
				Bone.SetVar("Type", 1)
				Bone.ppcollision = true
			end
		end
		for i=1,#bones do 
		    bullet = bones[i]
			if bullet.GetVar("Move") == 1 then
			    bullet.MoveTo(bullet.x - 1, bullet.y)
			elseif bullet.GetVar("Move") == 2 then
			    bullet.MoveTo(bullet.x + 1, bullet.y)
			elseif bullet.GetVar("Move") == 3 then
			    bullet.MoveTo(bullet.x, bullet.y - 1)
			elseif bullet.GetVar("Move") == 4 then
			    bullet.MoveTo(bullet.x, bullet.y + 1)
			elseif bullet.GetVar("Move") == 5 then
			    bullet.MoveTo(bullet.x + 1, bullet.y + 1)
			elseif bullet.GetVar("Move") == 6 then
			    bullet.MoveTo(bullet.x + 1, bullet.y - 1)
			elseif bullet.GetVar("Move") == 7 then
			    bullet.MoveTo(bullet.x - 1, bullet.y + 1)
			elseif bullet.GetVar("Move") == 8 then
			    bullet.MoveTo(bullet.x - 1, bullet.y - 1)
			end
		end
		if timer == 1000 then
			a = CreateProjectile('Arrow05',-200,200)
			b = CreateProjectile('Arrow05',200,200)
			a.sprite.xscale = 2
			a.sprite.yscale = 2
			b.sprite.xscale = 2
			b.sprite.yscale = 2
		elseif timer > 1000 then
			if (timer)%80 == 0 and timer < 1950 then
				D = (math.random()*8)
				if D > 0 and D < 1 then
					local Bone = CreateProjectile('bone', Arena.width/2+50, 0)
					table.insert(bones, Bone)
					Bone.SetVar("Move", 1)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 1 and D < 2 then
					local Bone = CreateProjectile('bone', -Arena.width/2-50, 0)
					table.insert(bones, Bone)
					Bone.SetVar("Move", 2)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 2 and D < 3 then
					local Bone = CreateProjectile('bone', 0, Arena.height/2+50)
					Bone.sprite.rotation = 90
					table.insert(bones, Bone)
					Bone.SetVar("Move", 3)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 3 and D < 4 then
					local Bone = CreateProjectile('bone', 0, -Arena.height/2-50)
					Bone.sprite.rotation = 90
					table.insert(bones, Bone)
					Bone.SetVar("Move", 4)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 4 and D < 5 then
					local Bone = CreateProjectile('bone', -Arena.width/2-50, -Arena.height/2-50)
					Bone.sprite.rotation = 45
					table.insert(bones, Bone)
					Bone.SetVar("Move", 5)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 5 and D < 6 then
					local Bone = CreateProjectile('bone', -Arena.width/2-50, Arena.height/2+50)
					Bone.sprite.rotation = -45
					table.insert(bones, Bone)
					Bone.SetVar("Move", 6)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 6 and D < 7 then
					local Bone = CreateProjectile('bone', Arena.width/2+50, -Arena.height/2-50)
					Bone.sprite.rotation = -45
					table.insert(bones, Bone)
					Bone.SetVar("Move", 7)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				elseif D > 7 and D < 8 then
					local Bone = CreateProjectile('bone', Arena.width/2+50, Arena.height/2+50)
					Bone.sprite.rotation = 45
					table.insert(bones, Bone)
					Bone.SetVar("Move", 8)
					Bone.ppcollision = true
					local O_Or_Not = math.random()*2
					if O_Or_Not > 0 and O_Or_Not <= 1 then
						Bone.SetVar("Type", 2)
						Bone.sprite.color = { 1.00, 0.65, 0.00 }
					elseif O_Or_Not > 1 and O_Or_Not <= 2 then
						Bone.SetVar("Type", 3)
						Bone.sprite.color = { 0.02, 0.37, 0.97 }
					end
				end
			end
			for i=1,#bones2 do
				bullet = bones2[i]
				if bullet.GetVar("Move") == 1 then
					bullet.MoveTo(bullet.x - 1, bullet.y)
				elseif bullet.GetVar("Move") == 2 then
					bullet.MoveTo(bullet.x + 1, bullet.y)
				elseif bullet.GetVar("Move") == 3 then
					bullet.MoveTo(bullet.x, bullet.y - 1)
				elseif bullet.GetVar("Move") == 4 then
					bullet.MoveTo(bullet.x, bullet.y + 1)
				elseif bullet.GetVar("Move") == 5 then
					bullet.MoveTo(bullet.x + 1, bullet.y + 1)
				elseif bullet.GetVar("Move") == 6 then
					bullet.MoveTo(bullet.x + 1, bullet.y - 1)
				elseif bullet.GetVar("Move") == 7 then
					bullet.MoveTo(bullet.x - 1, bullet.y + 1)
				elseif bullet.GetVar("Move") == 8 then
					bullet.MoveTo(bullet.x - 1, bullet.y - 1)
				end
			end
			if (timer+10)%100 == 0 and timer < 1800 and timer > 1050 then 
				local bullet = CreateProjectile('bulletA', a.x, a.y)
				bullet.SetVar("btimer",0)
				bullet.SetVar("RL",(a.x-Player.x))
				bullet.SetVar("UD",(a.y-Player.y))
				bullet.SetVar("Creator",a)
				Audio.PlaySound("00002a24")
				table.insert(bullets2, bullet)
			end
			if (timer+10)%100 == 0 and timer < 1800 and timer > 1050 then 
				local bullet = CreateProjectile('bulletA', b.x, b.y)
				bullet.SetVar("btimer",0)
				bullet.SetVar("RL",(b.x-Player.x))
				bullet.SetVar("UD",(b.y-Player.y))
				bullet.SetVar("Creator",b)
				table.insert(bullets2, bullet)
			end
			if timer > 1800 then
				a.sprite.alpha = 10/(timer-1800)
				b.sprite.alpha = 10/(timer-1800)
				if a.sprite.alpha < 0.01 then
					a.sprite.alpha = 0
					b.sprite.alpha = 0
				end
			end
			a.sprite.rotation = -70*(math.atan((b.x+Player.x)/(Player.y-b.y)))-100
			b.sprite.rotation = -70*(math.atan((b.x-Player.x)/(b.y-Player.y)))-80
			for i=1,#bullets2 do
				local bullet = bullets2[i]
				bullet.SetVar("Type", 1)
				local UD = bullet.GetVar("UD")
				local RL = bullet.GetVar("RL")
				local Creator = bullet.GetVar("Creator")
				if Creator.x > Player.x then
					X = -1
				elseif Creator.x < Player.x then
					X = 1
				end
				if Creator.y > Player.y then
					Y = 1
				elseif Creator.y < Player.y then
					Y = -1
				end
				bullet.SetVar("btimer",(bullet.GetVar("btimer")+1))
				bullet.MoveTo(((Creator.x)+((bullet.GetVar("btimer")*X))),((b.y)+((bullet.GetVar("btimer"))*((UD/RL)*Y*X)))/1)
				bullet.sprite.rotation = timer
				bullet.sprite.xscale = 1.6
				bullet.sprite.yscale = 1.6
			end
		end
	elseif timer > 2000 and timer < 2680 then
	    for i=1,#bones do
		    bullet = bones[i]
			if bullet.isactive == true then
			    bullet.remove()
			end
		end
	    for i=1,#bullets do
		    bullet = bullets[i]
			if bullet.isactive == true then
			    bullet.remove()
			end
		end
	    for i=1,#bullets2 do
		    bullet = bullets2[i]
			if bullet.isactive == true then
			    bullet.remove()
			end
		end
	    for i=1,#Corners do
		    bullet = Corners[i]
			if bullet.isactive == true then
			    bullet.remove()
			end
		end
		if a.isactive == true then
			Arena.ResizeImmediate(16, 16)
		    a.remove()
		end
		if b.isactive == true then
		    Arena.ResizeImmediate(16, 16)
		    b.remove()
		end
		if (timer)%120 == 0 and timer >= 20 and timer <= 2600 then
			R1 = math.random()*2
			R2 = math.random()*2
			R3 = math.random()*4
			if R1 > 0 and R1 <= 1 then
				Arena.ResizeImmediate(52, 52)
				Player.MoveTo(0,0,false)
				local bullet = CreateProjectile('Knife_Left', 100, 0)
				bullet.SetVar("Move", 1)
				table.insert(bullets3, bullet)
				Audio.PlaySound("000029a2")
			elseif R1 > 1 and R1 <= 2 then
				Arena.ResizeImmediate(52, 52)
				Player.MoveTo(0,0,false)
				local bullet = CreateProjectile('Knife_Right', -100, 0)
				bullet.SetVar("Move", 3)
				table.insert(bullets3, bullet)
				Audio.PlaySound("000029a2")
			end
			if R2 > 0 and R2 <= 1 then
				Arena.ResizeImmediate(52, 52)
				Player.MoveTo(0,0,false)
				local bullet = CreateProjectile('Knife_Down', 0, 100)
				bullet.SetVar("Move", 2)
				table.insert(bullets3, bullet)
			elseif R2 > 1 and R2 <= 2 then
				Arena.ResizeImmediate(52, 52)
				Player.MoveTo(0,0,false)
				local bullet = CreateProjectile('Knife_Up', 0, -100)
				bullet.SetVar("Move", 4)
				table.insert(bullets3, bullet)
			end
			if R3 > 0 and R3 <= 1 then
				local bullet = CreateProjectile('Knife_Up', 100, 100)
				bullet.sprite.rotation = 135
				bullet.SetVar("Move", 5)
				table.insert(bullets3, bullet)
			elseif R3 > 1 and R3 <= 2 then
				local bullet = CreateProjectile('Knife_Up', 100, -100)
				bullet.sprite.rotation = 45
				bullet.SetVar("Move", 6)
				table.insert(bullets3, bullet)
			elseif R3 > 2 and R3 <= 3 then
				local bullet = CreateProjectile('Knife_Up', -100, 100)
				bullet.sprite.rotation = -135
				bullet.SetVar("Move", 7)
				table.insert(bullets3, bullet)
			elseif R3 > 3 and R3 <= 4 then
				local bullet = CreateProjectile('Knife_Up', -100, -100)
				bullet.sprite.rotation = -45
				bullet.SetVar("Move", 8)
				table.insert(bullets3, bullet)
			end
		end
		for i=1,#bullets3 do
			bullet = bullets3[i]
			bullet.SetVar("Type", 1)
			if bullet.GetVar("Move") == 1 then
				bullet.MoveTo(bullet.x-1.5, bullet.y)
			elseif bullet.GetVar("Move") == 2 then
				bullet.MoveTo(bullet.x, bullet.y-1.5)
			elseif bullet.GetVar("Move") == 3 then
				bullet.MoveTo(bullet.x+1.5, bullet.y)
			elseif bullet.GetVar("Move") == 4 then
				bullet.MoveTo(bullet.x, bullet.y+1.5)
			elseif bullet.GetVar("Move") == 5 then
				bullet.MoveTo(bullet.x-1.5, bullet.y-1.5)
			elseif bullet.GetVar("Move") == 6 then
				bullet.MoveTo(bullet.x-1.5, bullet.y+1.5)
			elseif bullet.GetVar("Move") == 7 then
				bullet.MoveTo(bullet.x+1.5, bullet.y-1.5)
			elseif bullet.GetVar("Move") == 8 then
				bullet.MoveTo(bullet.x+1.5, bullet.y+1.5)
			end
		end
	elseif timer > 2680 then
		Arena.Resize(300, 40)
		for i=1,#bullets3 do
			bullet = bullets3[i]
			if bullet.isactive == true then
				bullet.remove()
			end
		end
		if timer == 2800 then
			XCountDown1 = 0
			YCountDown1 = 0
			Bullet1 = CreateProjectile('bulletA',150,0)
			XMove1 = (1.65*math.random()) + 0.7
			YMove1 = (1.2*math.random()) + 0.7
			Bullet1.SetVar("Type", 1)
			
			XCountDown2 = 0
			YCountDown2 = 0
			Bullet2 = CreateProjectile('bulletA',-150,0)
			XMove2 = (-1.65*math.random()) - 0.7
			YMove2 = (-1.2*math.random()) - 0.7	
			Bullet2.SetVar("Type", 1)
		elseif timer > 2800 and timer < 5000 then
			Bullet1.MoveTo((Bullet1.x + XMove1), (Bullet1.y + YMove1))
			if ((-Arena.currentwidth) / 2 > Bullet1.x or Arena.currentwidth / 2 < Bullet1.x) and XCountDown1 == 0 then
				XMove1 = XMove1 * (-1)
				XCountDown1 = 10
			end
			if ((-Arena.currentheight ) / 2 > Bullet1.y or Arena.currentheight  / 2 < Bullet1.y) and YCountDown1 == 0 then
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
			if ((-Arena.currentwidth) / 2 > Bullet2.x or Arena.currentwidth / 2 < Bullet2.x) and XCountDown2 == 0 then
				XMove2 = XMove2 * (-1)
				XCountDown2 = 10
			end
			if ((-Arena.currentheight ) / 2 > Bullet2.y or Arena.currentheight  / 2 < Bullet2.y) and YCountDown2 == 0 then
				YMove2 = YMove2 * (-1)
				YCountDown2 = 10
			end
			if XCountDown2 > 0 then
				XCountDown2 = XCountDown2 - 1
			end
			if YCountDown2 > 0 then
				YCountDown2 = YCountDown2 - 1
			end
			if timer >= 3950 then
				Bullet3.MoveTo((Bullet3.x + XMove3), (Bullet3.y + YMove3))
				if ((-Arena.currentwidth) / 2 > Bullet3.x or Arena.currentwidth / 2 < Bullet3.x) and XCountDown3 == 0 then
					XMove3 = XMove3 * (-1)
					XCountDown3 = 10
				end
				if ((-Arena.currentheight ) / 2 > Bullet3.y or Arena.currentheight / 2 < Bullet3.y) and YCountDown3 == 0 then
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
				if ((-Arena.currentwidth) / 2 > Bullet4.x or Arena.currentwidth / 2 < Bullet4.x) and XCountDown4 == 0 then
					XMove4 = XMove4 * (-1)
					XCountDown4 = 10
				end
				if ((-Arena.currentheight ) / 2 > Bullet4.y or Arena.currentheight  / 2 < Bullet4.y) and YCountDown4 == 0 then
					YMove4 = YMove4 * (-1)
					YCountDown4 = 10
				end
				if XCountDown4 > 0 then
					XCountDown4 = XCountDown4 - 1
				end
				if YCountDown4 > 0 then
					YCountDown4 = YCountDown4 - 1
				end
			end
			if timer == 3000 then 
				Blaster = CreateProjectile('Blank', 0, 400)
				Blaster.sprite.rotation = -90
				pole = CreateProjectile('Blank',Blaster.x,Blaster.y+240)
				Blaster.sprite.SendToTop()
				table.insert(Blasters, Blaster)
				table.insert(Poles, pole)
			end
			if timer > 3000 and timer < 3900 then 
				if (timer-60)%110 == 0 then
					Blaster = CreateProjectile('Blaster', 0, 400)
					Blaster.sprite.rotation = -90
					pole = CreateProjectile('Pole1',Blaster.x,Blaster.y+240)
					Blaster.sprite.SendToTop()
					table.insert(Blasters, Blaster)
					table.insert(Poles, pole)
					Audio.PlaySound("00002a2e")
				end
				if pole.isactive then
					pole.MoveTo(Blaster.x,Blaster.y+240)
				end
				if Blaster.y >= 200 then
					Blaster.MoveTo(Player.x,Blaster.y-8)
				end
				if Blaster.y <= 200 then
					if timer%110 == 0 then 
						Beam = CreateProjectile('FastBeam', Blaster.x, Blaster.y-28)
						table.insert(Beams, Beam)
						Audio.PlaySound("00002a30")
					end
				end
				if timer >= 3110 then
					if Beam.isactive then
						X = Beam.x
						Y = Beam.y - 24
						Beam = CreateProjectile('FastBeam', X, Y)
						Beam.sprite.rotation = 90
						table.insert(Beams, Beam)
					end
				end
				for i=1,#Poles do
					local bullet = Poles[i]
					if bullet ~= pole and bullet.y <= 640 then
						bullet.MoveTo(bullet.x,bullet.y+8)
					elseif bullet ~= pole and bullet.isactive == true then
						bullet.remove()
					end
				end
				for i=1,#Blasters do
					local bullet = Blasters[i]
					if bullet ~= Blaster and bullet.y <= 400 then
						bullet.MoveTo(bullet.x,bullet.y+8)
					elseif bullet ~= Blaster and bullet.isactive == true then
						bullet.remove()
					end
				end
				for i=1,#Beams do
					local bullet = Beams[i]
					bullet.SetVar("Type", 4)
					if bullet.isactive then
						bullet.MoveTo(bullet.x,bullet.y-8)
						if bullet.y <= -350 then
							bullet.remove()
						end
					end
				end
			elseif timer == 3900 then
					Warning = CreateProjectile("WarningBoxRed3",0,131)
					Warn1 = CreateProjectile("WarningRed",69,131)
					Warn2 = CreateProjectile("WarningRed",-69,131)
					Ex = CreateProjectile("!",0,131)
			elseif timer >= 3900 and timer < 5000 then
				Arena.Resize(300, 300)
				for i=1,#Blasters do
					bullet = Blasters[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				for i=1,#Poles do
					bullet = Poles[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				if timer <= 3948 then
					if Flash == 1 then
						Warning.sprite.Set("WarningBoxRed3")
						Ex.sprite.Set("!")
						Warn1.sprite.Set("WarningRed")
						Warn2.sprite.Set("WarningRed")
						Audio.PlaySound("alarm")
					elseif Flash == -1 then
						Warning.sprite.Set("WarningBoxYellow3")
						Ex.sprite.Set("!1")
						Warn1.sprite.Set("WarningYellow")
						Warn2.sprite.Set("WarningYellow")
					end
				elseif timer == 3949 then
					if Warning.isactive then
						Warning.remove()
					end
					Bullet3 = CreateProjectile("bulletA",Warn1.x,Warn1.y)
					Warn1.remove()
					XCountDown3 = 0
					YCountDown3 = 0
					XMove3 = (-1.5*math.random()) - 0.6
					YMove3 = (-1.5*math.random()) - 0.6	
					Bullet3.SetVar("Type", 1)
					
					Bullet4 = CreateProjectile("bulletA",Warn2.x,Warn2.y)
					Warn2.remove()
					XCountDown4 = 0
					YCountDown4 = 0
					XMove4 = (2.8*math.random()) + 1
					YMove4 = (-2.8*math.random()) - 1	
					Bullet4.SetVar("Type", 1)
					for i=0,21 do
						local bullet = CreateProjectile('bulletB', 0, 0)
						bullet.SetVar('angle', 90)
						bullet.SetVar('offset', i)
						bullet.SetVar("Type", 1)
						table.insert(bullets4, bullet)
						bullet = CreateProjectile('bulletB', 0, 0)
						bullet.SetVar('angle', 90)
						bullet.SetVar('offset', -i)
						bullet.SetVar("Type", 1)
						table.insert(bullets4, bullet)
					end
				elseif timer >= 3950 then
					for i=1,#bullets4 do
						local bullet = bullets4[i]
						local angle = bullet.GetVar('angle')
						local offset = bullet.GetVar('offset')
						local accel = bullet.GetVar('accel')
						local ydiff = bullet.y-(0-offset*10)
						if (timer-3950)<20 and ydiff!=0 then
							bullet.MoveTo(bullet.x,bullet.y-ydiff/10)
						elseif (timer-3950)>=20 then
							bullet.MoveTo(math.cos(angle)*offset*10,math.sin(angle)*offset*10)
							bullet.SetVar('angle',angle-0.025)
						end
					end
					Bullet3.MoveTo((Bullet3.x + XMove3), (Bullet3.y + YMove3))
					if ((-Arena.currentwidth) / 2 > Bullet3.x or Arena.currentwidth / 2 < Bullet3.x) and XCountDown3 == 0 then
						XMove3 = XMove3 * (-1)
						XCountDown3 = 10
					end
					if ((-Arena.currentheight ) / 2 > Bullet3.y or Arena.currentheight  / 2 < Bullet3.y) and YCountDown3 == 0 then
						YMove3 = YMove3 * (-1)
						YCountDown1 = 10
					end
					if XCountDown3 > 0 then
						XCountDown3 = XCountDown3 - 1
					end
					if YCountDown3 > 0 then
						YCountDown3 = YCountDown3 - 1
					end
					
					Bullet4.MoveTo((Bullet4.x + XMove4), (Bullet4.y + YMove4))
					if ((-Arena.currentwidth) / 2 > Bullet4.x or Arena.currentwidth / 2 < Bullet4.x) and XCountDown4 == 0 then
						XMove4 = XMove4 * (-1)
						XCountDown4 = 10
					end
					if ((-Arena.currentheight ) / 2 > Bullet4.y or Arena.currentheight  / 2 < Bullet4.y) and YCountDown4 == 0 then
						YMove4 = YMove4 * (-1)
						YCountDown4 = 10
					end
					if XCountDown4 > 0 then
						XCountDown4 = XCountDown4 - 1
					end
					if YCountDown4 > 0 then
						YCountDown4 = YCountDown4 - 1
					end
				end
			end
		elseif timer == 5000 then
			Knife = CreateProjectile('Knife_right',(80 * math.cos((16) / 15))+ 200,(-80 * math.sin((18) / 14) + 100))
			Knife.sprite.rotation = 0
		elseif timer > 5000 and timer < 5900 then
				Arena.Resize(155, 130)
				if Bullet1.isactive then
					Bullet1.remove()
				end
				if Bullet2.isactive then
					Bullet2.remove()
				end
				if Bullet3.isactive then
					Bullet3.remove()
				end
				if Bullet4.isactive then
					Bullet4.remove()
				end
				for i=1,#bullets4 do
					bullet = bullets4[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				if (timer+20)%30 == 0 then
					local posx = 300
					local posy = 50
					local bullet = CreateProjectile('Spike', posx, posy)
					bullet.SetVar('velx', 0)
					bullet.SetVar('vely', 70 - 130*math.random())
					table.insert(Rbullets, bullet)
				end
    
				for i=1,#Rbullets do
					local bullet = Rbullets[i]
					local vely = bullet.GetVar('vely')
					local newposx = bullet.x - 2
					bullet.MoveTo(newposx, vely)
					bullet.SetVar('vely', vely)
					bullet.SetVar("Type",1)
				end

				if (timer+20)%30 == 0 then -- 20 is how many frames it takes to create another bullet
					local posx = 0
					local posy = -200
					local bullet = CreateProjectile('Spike_up', posx, posy)
					bullet.SetVar('vely', -140)
					bullet.SetVar('velx', 70 - 145*math.random())
					table.insert(Ubullets, bullet)
					Audio.PlaySound("000029a2")
				end
				for i=1,#Ubullets do
					local bullet = Ubullets[i]
					local vely = bullet.GetVar('vely')
					local velx = bullet.GetVar('velx')
					local newposy = bullet.y + 2
					bullet.MoveTo(velx, newposy)
					bullet.SetVar('newposy', vely)
					bullet.SetVar("Type",1)
				end
				timer2 = timer2 + 1
				if timer2 >= 251 then
					timer2 = 0
				end
				if timer2 > 30 and timer2 <= 50 then
					Knife.sprite.alpha = 1
					Knife.sprite.rotation = 180 - (timer2-30)
					Knife.MoveTo((80 * math.cos((timer2-90) / 15)) + 200,(-80 * math.sin((timer2-90) / 14)) + 100)
					local bullet = CreateProjectile('bulletB',(100 * math.cos((timer2-90) / 15)) + 200,(-100 * math.sin((timer2-90) / 14)) + 100)
					bullet.sprite.color = { 1.00, 0.00, 0.00 }
					table.insert(bullets, bullet)
					if timer2 == 35 then
						Audio.PlaySound("slice")
					end
				elseif timer2 >= 60 and timer2 <= 140 then
					Knife.sprite.alpha = 1
					for i=1,#bullets do
						local bullet = bullets[i]
						if bullet.isactive then
							bullet.SetVar("Type",4)
							bullet.MoveTo(bullet.x-8,bullet.y)
						end 
					end
					if timer2 == 60 then
						Audio.PlaySound("000029a2")
					end
				elseif timer2 > 140 and timer2 <= 160 then
					Knife.sprite.rotation = 0 - (timer2-170)
					Knife.MoveTo((80 * math.cos((timer2-156) / 15)) - 200,(-80 * math.sin((timer2-158) / 14)) - 100)
					local bullet = CreateProjectile('bulletB',(100 * math.cos((timer2-156) / 15)) - 200,(-100 * math.sin((timer2-158) / 14) - 100))
					bullet.sprite.color = { 1.00, 0.00, 0.00 }
					table.insert(bullets2, bullet)
					if timer2 == 145 then
						Audio.PlaySound("slice")
					end
				elseif timer2 > 170 then
					for i=1,#bullets2 do
						local bullet = bullets2[i]
						if bullet.isactive then
							bullet.SetVar("Type",4)
							bullet.MoveTo(bullet.x+8,bullet.y)
						end
					end
					if timer2 == 60 then
						Audio.PlaySound("000029a2")
					end
				end
			elseif timer == 5900 then
				timer2 = 0
				for i=1,#bullets2 do
					local bullet = bullets2[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				for i=1,#Ubullets do
					local bullet = Ubullets[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				for i=1,#Rbullets do
					local bullet = Rbullets[i]
					if bullet.isactive == true then
						bullet.remove()
					end
				end
				if Knife.isactive then
					Knife.remove()
				end
			elseif timer > 5900 then
			    timer2 = timer2 + 1
				Arena.Resize(30, 30)
				if timer2%2 == 0 and timer < 6065 and timer > 6000 then
					local bullet = CreateProjectile("bulletA",(200 * math.cos((timer2)/10)),(-200 * math.sin((timer2)/10)))
					bullet.SetVar("tim", timer2)
					table.insert(bullets5, bullet)
				end
				if timer > 6200 then
					for i=1,#bullets5 do
						local bullet = bullets5[i]
						timer3 = timer3 - 0.5
						local tim = bullet.GetVar("tim")
						bullet.MoveTo((timer3 * math.cos((tim)/10)),(-timer3 * math.sin((tim)/10)))
					end
				end
				if timer == 6201 then 
					Audio.PlaySound("000029a2")
				end
			end
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
					Player.Hurt(5)
				end
			end
		end
		if timer >= 6211 then
			SetGlobal("Y",0)
			SetGlobal("Finished",true)
			SetGlobal("Turn",26)
			if GetGlobal("attack") >= 20 then
				SetGlobal("Death",1)
			end
			if GetGlobal("attack") <= 1 then
				SetGlobal("Live",1)
			end
			EndWave()
		end
	end
