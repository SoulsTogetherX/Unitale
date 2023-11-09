-- You need reflexes, lots of reflexes. I suggest the game Touhou. :P
timer = 0
timer2 = 0
bullets = {}
SetGlobal("WaveTime",725)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
Arena.Move(0, 100, true, false) 
Shoot = CreateProjectile("Spaceship",150,100)
Shoot.SetVar("R",0)

Inv1 = CreateProjectile("Pixel",100,50)
Inv1.sprite.alpha = 0
Inv2 = CreateProjectile("Pixel",100,150)
Inv2.sprite.alpha = 0
Inv3 = CreateProjectile("Pixel",100,100)
Inv3.sprite.alpha = 0
Inv4 = CreateProjectile("Pixel",100,200)
Inv4.sprite.alpha = 0
Inv5 = CreateProjectile("Pixel",100,100)
Inv5.sprite.alpha = 0
Inv6 = CreateProjectile("Pixel",100,200)
Inv6.sprite.alpha = 0

A = 1
B = math.random(40,250)
Wait = false

function Update()
    timer = timer + 1
	Shoot.sprite.rotation = math.deg(math.atan2(Player.y - Shoot.y, Player.x - Shoot.x))
	if timer > 25 then
		Shoot.SetVar("R",Shoot.GetVar("R") + (1*A))
		Shoot.MoveTo(200*math.cos(Shoot.GetVar("R")/50),150*math.sin(Shoot.GetVar("R")/50))
		Inv1.MoveTo(50*math.cos((Shoot.GetVar("R")-25)/50) + Player.x,50*math.sin((Shoot.GetVar("R")-25)/50) + Player.y)
		Inv2.MoveTo(50*math.cos((Shoot.GetVar("R")+25)/50) + Player.x,50*math.sin((Shoot.GetVar("R")+25)/50) + Player.y)
		Inv3.MoveTo(100*math.cos((Shoot.GetVar("R")-50)/50) + Player.x,100*math.sin((Shoot.GetVar("R")-50)/50) + Player.y)
		Inv4.MoveTo(100*math.cos((Shoot.GetVar("R")+50)/50) + Player.x,100*math.sin((Shoot.GetVar("R")+50)/50) + Player.y)
		Inv5.MoveTo(75*math.cos((Shoot.GetVar("R")-37.5)/50) + Player.x,75*math.sin((Shoot.GetVar("R")-37.5)/50) + Player.y)
		Inv6.MoveTo(75*math.cos((Shoot.GetVar("R")+37.5)/50) + Player.x,75*math.sin((Shoot.GetVar("R")+37.5)/50) + Player.y)
		if timer%B == 0 then
			A = A * (-1)
			B = math.random(40,250)
		end
		if (timer+50)%60 == 0 then
			for i=1,2 do
				local distance = math.sqrt((Player.x - Shoot.x)^2 + (Player.y - Shoot.y)^2)
				local distance_x = ((Player.x - Shoot.x) / distance)*2.5
				local distance_y = ((Player.y - Shoot.y) / distance)*2.5
				local bullet = CreateProjectile("Pixel",Shoot.x + (15*(distance_x/math.abs(distance_x))),Shoot.y + (15*(distance_y/math.abs(distance_y))))
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(4,4)
				bullet.SetVar("Boom",false)
				bullet.SetVar("In",false)
				bullet.SetVar("S",4)
				bullet.SetVar("B",0)
				table.insert(bullets,bullet)
				
				local distance = math.sqrt((Inv1.x - Shoot.x)^2 + (Inv1.y - Shoot.y)^2)
				local distance_x = ((Inv1.x - Shoot.x) / distance)*2.5
				local distance_y = ((Inv1.y - Shoot.y) / distance)*2.5
				local bullet = CreateProjectile("Pixel",Shoot.x + (15*(distance_x/math.abs(distance_x))),Shoot.y + (15*(distance_y/math.abs(distance_y))))
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(4,4)
				bullet.SetVar("Boom",false)
				bullet.SetVar("In",false)
				bullet.SetVar("S",4)
				bullet.SetVar("B",0)
				table.insert(bullets,bullet)
				
				local distance = math.sqrt((Inv2.x - Shoot.x)^2 + (Inv2.y - Shoot.y)^2)
				local distance_x = ((Inv2.x - Shoot.x) / distance)*2.5
				local distance_y = ((Inv2.y - Shoot.y) / distance)*2.5
				local bullet = CreateProjectile("Pixel",Shoot.x + (15*(distance_x/math.abs(distance_x))),Shoot.y + (15*(distance_y/math.abs(distance_y))))
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(4,4)
				bullet.SetVar("Boom",false)
				bullet.SetVar("In",false)
				bullet.SetVar("S",4)
				bullet.SetVar("B",0)
				table.insert(bullets,bullet)
				
				local distance = math.sqrt((Inv3.x - Shoot.x)^2 + (Inv3.y - Shoot.y)^2)
				local distance_x = ((Inv3.x - Shoot.x) / distance)*2.5
				local distance_y = ((Inv3.y - Shoot.y) / distance)*2.5
				local bullet = CreateProjectile("Pixel",Shoot.x + (15*(distance_x/math.abs(distance_x))),Shoot.y + (15*(distance_y/math.abs(distance_y))))
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(4,4)
				bullet.SetVar("Boom",false)
				bullet.SetVar("In",false)
				bullet.SetVar("S",4)
				bullet.SetVar("B",0)
				table.insert(bullets,bullet)
				
				local distance = math.sqrt((Inv4.x - Shoot.x)^2 + (Inv4.y - Shoot.y)^2)
				local distance_x = ((Inv4.x - Shoot.x) / distance)*2.5
				local distance_y = ((Inv4.y - Shoot.y) / distance)*2.5
				local bullet = CreateProjectile("Pixel",Shoot.x + (15*(distance_x/math.abs(distance_x))),Shoot.y + (15*(distance_y/math.abs(distance_y))))
				bullet.SetVar("distance_x", distance_x)
				bullet.SetVar("distance_y", distance_y)
				bullet.SetVar("Type",1)
				bullet.sprite.Scale(4,4)
				bullet.SetVar("Boom",false)
				bullet.SetVar("In",false)
				bullet.SetVar("S",4)
				bullet.SetVar("B",0)
				table.insert(bullets,bullet)
			end
		end
	end
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			if bullet.GetVar("Boom") == false then
				bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
			elseif bullet.GetVar("Boom") == true then
				bullet.SetVar("S",bullet.GetVar("S") + 0.5)
				bullet.sprite.Scale(bullet.GetVar("S"),bullet.GetVar("S"))
				bullet.sprite.alpha = (14 - bullet.GetVar("S"))/10
				if bullet.GetVar("S") >= 14 then
					bullet.remove()
				end
			end
			if (bullet.x > -Arena.width/2 and bullet.x < Arena.width/2 and bullet.y > -Arena.height/2 and bullet.y < Arena.height/2) then
				bullet.SetVar("In",true)
			end
			if bullet.GetVar("In") == true then
				if bullet.x < -Arena.width/2 then
					bullet.SetVar("distance_x",math.abs(bullet.GetVar("distance_x")))
					bullet.SetVar("B",bullet.GetVar("B") + 1)
				end
				if bullet.x > Arena.width/2 then
					bullet.SetVar("distance_x",-math.abs(bullet.GetVar("distance_x")))
					bullet.SetVar("B",bullet.GetVar("B") + 1)
				end 
				if bullet.y < -Arena.height/2 then
					bullet.SetVar("distance_y",math.abs(bullet.GetVar("distance_y")))
					bullet.SetVar("B",bullet.GetVar("B") + 1)
				end
				if bullet.y > Arena.height/2 then
					bullet.SetVar("distance_y",-math.abs(bullet.GetVar("distance_y")))
					bullet.SetVar("B",bullet.GetVar("B") + 1)
				end
			end
			if bullet.GetVar("B") >= 3 then
				bullet.SetVar("Boom",true)
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 5 then
			Player.Hurt(GetGlobal("BaseDam") + 5,0.5)
			bullet.SetVar("Boom",true)
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 10 then
			Player.Hurt(GetGlobal("BaseDam") + 10,0.5)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
