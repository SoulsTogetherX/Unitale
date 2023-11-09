-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
bullets2 = {}

function Update()
    timer = timer + 1
	if timer == 100 then
		local bullet = CreateProjectile("Spike",Player.x + 400,Player.y)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y + 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y - 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 150 then
		local bullet = CreateProjectile("Spike",Player.x + 400,Player.y)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y + 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y - 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 400,Player.y)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 390,Player.y + 10)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 390,Player.y - 10)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 220 then
		local bullet = CreateProjectile("Spike",Player.x,Player.y + 400)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x -10,Player.y - 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 220 then
		local bullet = CreateProjectile("Spike",Player.x,Player.y + 400)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x -10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 240 then
		local bullet = CreateProjectile("Spike",Player.x,Player.y - 400)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 10,Player.y - 390)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 10,Player.y - 390)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 280 then
		local bullet = CreateProjectile("Spike",Player.x,Player.y + 400)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 340 then
		local bullet = CreateProjectile("Spike",Player.x + 400,Player.y)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y + 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y - 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x,Player.y + 400)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer%5 == 0 and timer >= 340 and timer <= 400 then
		local bullet = CreateProjectile("Spike",Player.x + 400,Player.y)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		Audio.PlaySound("Shoot1")
	end
	if timer == 500 then
		local bullet = CreateProjectile("Spike",Player.x,Player.y + 400)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetY",Player.y)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 10,Player.y + 390)
		bullet.SetVar("TargetY",Player.y - 10)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x -10,Player.y + 390)
		bullet.SetVar("TargetY",Player.y - 10)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		table.insert(bullets2,bullet)
		Y = Player.y
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 510 then
		local bullet = CreateProjectile("Spike",Player.x + 400,Y)
		bullet.sprite.alpha = 0
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Y + 10)
		bullet.sprite.alpha = 0
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Y - 10)
		bullet.sprite.alpha = 0
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		table.insert(bullets,bullet)
	end
	if timer == 560 then
		local bullet = CreateProjectile("Spike",Player.x + 400,Player.y)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetX",Player.x)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y + 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetX",Player.x)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x + 390,Player.y - 10)
		bullet.SetVar("M",1)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetX",Player.x)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 400,Player.y)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetX",Player.x)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 390,Player.y + 10)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetX",Player.x)
		table.insert(bullets2,bullet)
		local bullet = CreateProjectile("Spike",Player.x - 390,Player.y - 10)
		bullet.SetVar("M",2)
		bullet.SetVar("Type",1)
		bullet.SetVar("TargetX",Player.x)
		table.insert(bullets2,bullet)
		X = Player.x
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
	end
	if timer == 570 then
		local bullet = CreateProjectile("Spike",X,Player.y + 400)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.sprite.alpha = 0
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",X + 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.sprite.alpha = 0
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",X - 10,Player.y + 390)
		bullet.SetVar("M",3)
		bullet.SetVar("Type",1)
		bullet.sprite.alpha = 0
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",X,Player.y - 400)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		bullet.sprite.alpha = 0
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",X + 10,Player.y - 390)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		bullet.sprite.alpha = 0
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",X - 10,Player.y - 390)
		bullet.SetVar("M",4)
		bullet.SetVar("Type",1)
		bullet.sprite.alpha = 0
		table.insert(bullets,bullet)
	end
	
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("M") == 1 then
			bullet.Move(-12,0)
		elseif bullet.GetVar("M") == 2 then
			bullet.Move(12,0)
			bullet.sprite.rotation = 180
		elseif bullet.GetVar("M") == 3 then
			bullet.Move(0,-12)
			bullet.sprite.rotation = 270
		elseif bullet.GetVar("M") == 4 then
			bullet.Move(0,12)
			bullet.sprite.rotation = 90
		end
	end
	for i=1,#bullets2 do
		bullet = bullets2[i]
		if bullet.GetVar("M") == 1 then
			bullet.Move(-12,0)
			if bullet.GetVar("TargetX") + 20 >= bullet.x then
				bullet.sprite.alpha = 0
				for i=1,#bullets do
					bullet = bullets[i]
					bullet.sprite.alpha = 1
				end
			end
		elseif bullet.GetVar("M") == 2 then
			bullet.Move(12,0)
			bullet.sprite.rotation = 180
			if bullet.GetVar("TargetX") - 20 <= bullet.x then
				bullet.sprite.alpha = 0
				for i=1,#bullets do
					bullet = bullets[i]
					bullet.sprite.alpha = 1
				end
			end
		elseif bullet.GetVar("M") == 3 then
			bullet.Move(0,-12)
			bullet.sprite.rotation = 270
			if bullet.GetVar("TargetY") + 20 >= bullet.y then
				bullet.sprite.alpha = 0
				for i=1,#bullets do
					bullet = bullets[i]
					bullet.sprite.alpha = 1
				end
			end
		elseif bullet.GetVar("M") == 4 then
			bullet.Move(0,12)
			bullet.sprite.rotation = 90
			if bullet.GetVar("TargetY") - 20 <= bullet.y then
				bullet.sprite.alpha = 0
				for i=1,#bullets do
					bullet = bullets[i]
					bullet.sprite.alpha = 1
				end
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false and bullet.GetVar("Type") == 1 then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 700 then
        EndWave()
    end
end