-- Try to do a horizontal figure-8 in the middle
timer = 0
bullets = {}
SetGlobal("WaveTime",600)
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
Arena.MoveToAndResize(Arena.currentx, Arena.currenty + 25, 150, 100, true, false)
Gravity = 0.06

function Update()
    timer = timer + 1
	if timer%60 == 0 then
		local bullet = CreateProjectile("Star",400,Arena.height/2 + 60)
		bullet.SetVar("MType",1)
		bullet.sprite.Scale(2, 2)
		bullet.SetVar("Rotaion",(math.random()-0.5)*32)
		table.insert(bullets, bullet)
		local bullet = CreateProjectile("Star",-400,-Arena.height/2 - 60)
		bullet.SetVar("MType",2)
		bullet.sprite.Scale(2, 2)
		bullet.SetVar("Rotaion",(math.random()-0.5)*32)
		table.insert(bullets, bullet)
	end
	
	for i = 1,#bullets do
		local bullet = bullets[i]
		if bullet.GetVar("MType") == 1 then
			bullet.Move(-15,0)
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			if bullet.x <= Player.x and bullet.GetVar("C") == nil then
				bullet.SetVar("C",true)
				local B = CreateProjectile("Star",bullet.x,bullet.y)
				B.SetVar("MType",3)
				local distance = math.sqrt((Player.x - B.x)^2 + (Player.y - B.y)^2)
				B.SetVar("HSpeed", ((Player.x - B.x) / distance)*8)
				B.SetVar("VSpeed", ((Player.y - B.y) / distance)*8)
				B.SetVar("Rotaion",(math.random()-0.5)*32)
				B.SetVar("Type",1)
				bullet.sprite.Scale(1.25, 1.25)
				table.insert(bullets, B)
			end
		elseif bullet.GetVar("MType") == 2 then
			bullet.Move(15,0)
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			if bullet.x >= Player.x and bullet.GetVar("C") == nil then
				bullet.SetVar("C",true)
				local B = CreateProjectile("Star",bullet.x,bullet.y)
				B.SetVar("MType",4)
				local distance = math.sqrt((Player.x - B.x)^2 + (Player.y - B.y)^2)
				B.SetVar("HSpeed", ((Player.x - B.x) / distance)*8)
				B.SetVar("VSpeed", ((Player.y - B.y) / distance)*8)
				B.SetVar("Rotaion",(math.random()-0.5)*32)
				B.SetVar("Type",1)
				bullet.sprite.Scale(1.25, 1.25)
				table.insert(bullets, B)
			end
		elseif bullet.GetVar("MType") == 3 then
			bullet.Move(bullet.GetVar("HSpeed"),bullet.GetVar("VSpeed"))
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			if bullet.y <= -Arena.height/2 and bullet.GetVar("C") == nil then
				bullet.SetVar("C",true)
				for i=-1,1 do
					local B = CreateProjectile("Star",bullet.x,bullet.y)
					B.SetVar("MType",5)
					local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
					B.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
					B.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
					B.SetVar("HSpeed",3*math.cos(math.pi/2+((i*math.pi)/6)))
					B.SetVar("VSpeed",-3*math.sin(math.pi/2+((i*math.pi)/6)))
					B.SetVar("Rotaion",(math.random()-0.5)*16)
					B.SetVar("Tim",timer)
					B.SetVar("Type",2)
					table.insert(bullets, B)
				end
			end
		elseif bullet.GetVar("MType") == 4 then
			bullet.Move(bullet.GetVar("HSpeed"),bullet.GetVar("VSpeed"))
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			if bullet.y >= Arena.height/2 and bullet.GetVar("C") == nil then
				bullet.SetVar("C",true)
				for i=-1,1 do
					local B = CreateProjectile("Star",bullet.x,bullet.y)
					B.SetVar("MType",5)
					local distance = math.sqrt((Player.x - bullet.x)^2 + (Player.y - bullet.y)^2)
					B.SetVar("distance_x", ((Player.x - bullet.x) / distance)*5)
					B.SetVar("distance_y", ((Player.y - bullet.y) / distance)*5)
					B.SetVar("HSpeed",3*math.cos(math.pi/2+((i*math.pi)/6)))
					B.SetVar("VSpeed",3*math.sin(math.pi/2+((i*math.pi)/6)))
					B.SetVar("Rotaion",(math.random()-0.5)*16)
					B.SetVar("Tim",timer)
					B.SetVar("Type",2)
					table.insert(bullets, B)
				end
			end
		elseif bullet.GetVar("MType") == 5 then
			bullet = bullets[i]
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			bullet.SetVar("Rotaion", bullet.GetVar("Rotaion") + 0.1)
			bullet.Move(bullet.GetVar("HSpeed"), bullet.GetVar("VSpeed"))
			if bullet.GetVar("distance_x") < bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")-Gravity)
			elseif bullet.GetVar("distance_x") > bullet.GetVar("HSpeed") then
				bullet.SetVar("HSpeed",bullet.GetVar("HSpeed")+Gravity)
			end
			if bullet.GetVar("distance_y") < bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")-(2*Gravity))
			elseif bullet.GetVar("distance_y") > bullet.GetVar("VSpeed") then
				bullet.SetVar("VSpeed",bullet.GetVar("VSpeed")+(2*Gravity))
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") + 20 then
			if GetGlobal("Moving") == true then
				Player.Hurt(GetGlobal("BaseDam") + 5,0.6)
			end
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 32 then
			Player.Hurt(GetGlobal("BaseDam"),0.4)
		elseif bullet.GetVar("Type") == 3 then
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
