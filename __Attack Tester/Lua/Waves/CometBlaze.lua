
-- Try and make the comets hit close to the top of the arena's sides.
timer = 0
bullets = {}
bullets2 = {}
SetGlobal("WaveTime",980)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
Fire = CreateProjectile("Fire1",0,400)
Fire.sprite.xscale = 2
Fire.sprite.yscale = 2
Fire.SetVar("Type",2)
Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
Rock = CreateProjectile("Rock1",0,400)
Rock.sprite.xscale = 1.5
Rock.sprite.yscale = 1.5
Rock.SetVar("Type",2)
local distance = math.sqrt((Player.x - Rock.x)^2 + (Player.y - Rock.y)^2)
Rock.SetVar("distance_x", ((Player.x - Rock.x) / distance)*10)
Rock.SetVar("distance_y", ((Player.y - Rock.y) / distance)*10)
I = 0
function Update()
    timer = timer + 1
	if Rock.isactive == true and Fire.isactive == true then
		Rock.sprite.rotation = timer*5
		Rock.Move(Rock.GetVar("distance_x"), Rock.GetVar("distance_y"))
		Fire.MoveTo(Rock.x - Rock.GetVar("distance_x")*4, Rock.y - Rock.GetVar("distance_y")*4)
		if (Rock.x > -GetGlobal("width")/2 and Rock.x < GetGlobal("width")/2 and Rock.y > -GetGlobal("height")/2 and Rock.y < GetGlobal("height")/2) then
			Rock.SetVar("In",true)
		end
		if Rock.GetVar("In") == true and (Rock.x < -GetGlobal("width")/2 or Rock.x > GetGlobal("width")/2 or Rock.y < -GetGlobal("height")/2 or Rock.y > GetGlobal("height")/2) then
			for i = 0,6 do
				local Random = math.abs(math.random()*4)
				if Random > 0 and Random <= 1 then
					local bullet = CreateProjectile("Rock1",Rock.x,Rock.y)
					bullet.SetVar("V",math.random()*2)
					bullet.SetVar("H",(math.random()*6)-3)
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.sprite.Scale(0.7,0.7)
					bullet.SetVar("Type",3)
					if bullet.GetVar("H") == 0 and bullet.GetVar("V") == 0 then
						bullet.SetVar("V",1)
					end
					table.insert(bullets2, bullet)
				elseif Random > 1 and Random <= 2 then
					local bullet = CreateProjectile("Rock2",Rock.x,Rock.y)
					bullet.SetVar("V",math.random()*2)
					bullet.SetVar("H",(math.random()*6)-3)
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.sprite.Scale(0.7,0.7)
					bullet.SetVar("Type",3)
					if bullet.GetVar("H") == 0 and bullet.GetVar("V") == 0 then
						bullet.SetVar("V",1)
					end
					table.insert(bullets2, bullet)
				elseif Random > 2 and Random <= 3 then
					local bullet = CreateProjectile("Rock3",Rock.x,Rock.y)
					bullet.SetVar("V",math.random()*2)
					bullet.SetVar("H",(math.random()*6)-3)
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.sprite.Scale(0.7,0.7)
					bullet.SetVar("Type",3)
					if bullet.GetVar("H") == 0 and bullet.GetVar("V") == 0 then
						bullet.SetVar("V",1)
					end
					table.insert(bullets2, bullet)
				elseif Random > 3 and Random <= 4 then
					local bullet = CreateProjectile("Rock4",Rock.x,Rock.y)
					bullet.SetVar("V",math.random()*2)
					bullet.SetVar("H",(math.random()*6)-3)
					bullet.SetVar("Rotaion",math.random()*25)
					bullet.sprite.Scale(0.7,0.7)
					bullet.SetVar("Type",3)
					if bullet.GetVar("H") < 0.2 and bullet.GetVar("V") < 0.2 then
						bullet.SetVar("V",2)
					end
					table.insert(bullets2, bullet)
				end
			end
			Rock.remove()
			Fire.remove()
		end
		if Rock.y < Arena.height/2 and Rock.y > -Arena.height/2 and Rock.x < Arena.width/2 and Rock.x > -Arena.width/2 then
			if timer%3 == 0 then
				for i = 0,4 do
					local bullet = CreateProjectile("pixel",Rock.x+(math.random()*50)-25,Rock.y+(math.random()*50)-25)
					bullet.sprite.xscale = 2
					bullet.sprite.yscale = 2
					bullet.SetVar("Type",1)
					bullet.SetVar("timer",0)
					bullet.SetVar("R1",math.random(-1,1))
					bullet.SetVar("R2",math.random(-1,1))
					bullet.SetVar("distance_x", ((math.random(-Arena.width/2, Arena.width/2) - bullet.x) / distance)*4)
					bullet.SetVar("distance_y", ((math.random(-Arena.height/2, Arena.height/2) - bullet.y) / distance)*4)
					table.insert(bullets, bullet)
				end
			end
		end
		if Rock.x < -450 or Rock.x > 450 or Rock.y < -450 or Rock.y > 450 then
			Fire.remove()
			Rock.remove()
		end
	else
		I = #bullets
	end
	if timer%200 == 0 then
		Fire = CreateProjectile("Fire1",0,400)
		Fire.sprite.xscale = 2
		Fire.sprite.yscale = 2
		Fire.SetVar("Type",2)
		Fire.sprite.SetAnimation({"Fire1","Fire2","Fire3","Fire4"},1/4)
		Rock = CreateProjectile("Rock1",0,400)
		Rock.sprite.xscale = 1.5
		Rock.sprite.yscale = 1.5
		Rock.SetVar("Type",2)
		local distance = math.sqrt((Player.x - Rock.x)^2 + (Player.y - Rock.y)^2)
		Rock.SetVar("distance_x", ((Player.x - Rock.x) / distance)*10)
		Rock.SetVar("distance_y", ((Player.y - Rock.y) / distance)*10)
		bullet.SetVar("In",false)
	end
	for i=1, #bullets2 do
		bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.Move(bullet.GetVar("H"),bullet.GetVar("V"))
			bullet.sprite.rotation = bullet.GetVar("Rotaion")*timer
			if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
				if bullet.isactive == true then
					bullet.remove()
				end
			end
		end
	end
	for i=1, #bullets do
		if i <= I then
			bullet = bullets[i]
			if bullet.isactive == true then
				bullet.SetVar("timer",bullet.GetVar("timer") + 1)
				bullet.Move(bullet.GetVar("distance_x"),bullet.GetVar("distance_y"))
				bullet.Move(bullet.GetVar("R1")*math.cos((bullet.GetVar("timer")*bullet.GetVar("distance_x"))/20), bullet.GetVar("R2")*math.sin((bullet.GetVar("timer")*bullet.GetVar("distance_y"))/20))
				if bullet.x < -320 or bullet.x > 420 or bullet.y < -250 or bullet.y > 250 then
					if bullet.isactive == true then
						bullet.remove()
					end
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") then
			Player.Hurt(GetGlobal("BaseDam"),0.4)
		elseif bullet.GetVar("Type") == 2 and Player.hp > GetGlobal("BaseDam") + 12 then
			Player.Hurt(GetGlobal("BaseDam") + 12,0.5)
		elseif bullet.GetVar("Type") == 3 and Player.hp > GetGlobal("BaseDam") + 4 then
			Player.Hurt(GetGlobal("BaseDam") + 4,0.5)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end