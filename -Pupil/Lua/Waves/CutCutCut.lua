-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
Arena.ResizeImmediate(200, 100)

function Update()
    timer = timer + 1
	if timer%5 == 0 and timer <= 100 then
		if timer ~= 100 then
			Audio.PlaySound("Shoot2")
			local bullet = CreateProjectile("Spike",Arena.width/2 - ((timer/5)*9),400)
			bullet.SetVar("M",1)
			bullet.SetVar("Type",1)
			bullet.sprite.rotation = -90
			table.insert(bullets,bullet)
		end
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",-400,Arena.height/2 - ((timer/5)*4))
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 180
		bullet.SetVar("M",2)
		table.insert(bullets,bullet)
	elseif timer == 150 then
		Arena.Resize(100, 100)
	elseif timer == 170 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Spike",-Arena.width/2 + 5,-400)
		bullet.SetVar("Type",1)
		bullet.SetVar("M",4)
		bullet.sprite.rotation = 90
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-400,-Arena.height/2 + 5)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 0
		bullet.SetVar("M",2)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-400,-400)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 225
		bullet.SetVar("M",3)
		table.insert(bullets,bullet)
	elseif timer == 200 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot1")
		local bullet = CreateProjectile("Spike",Arena.width/2 - 5,400)
		bullet.SetVar("Type",1)
		bullet.SetVar("M",1)
		bullet.sprite.rotation = 90
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-400,Arena.height/2 - 5)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 0
		bullet.SetVar("M",2)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400,400)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 45
		bullet.SetVar("M",6)
		table.insert(bullets,bullet)
	elseif timer >= 240 and (timer - 240)%40 == 0 and timer <= 400 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",Player.x,400)
		bullet.SetVar("Type",1)
		bullet.SetVar("M",1)
		bullet.sprite.rotation = 90
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",Player.x,-400)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = -90
		bullet.SetVar("M",4)
		table.insert(bullets,bullet)
	elseif timer >= 260 and (timer - 260)%40 == 0 and timer <= 400 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",-400,Player.y)
		bullet.SetVar("Type",1)
		bullet.SetVar("M",2)
		bullet.sprite.rotation = 0
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400,Player.y)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 180
		bullet.SetVar("M",5)
		table.insert(bullets,bullet)
	elseif timer == 420 then
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		Audio.PlaySound("Shoot2")
		local bullet = CreateProjectile("Spike",-400,-400)
		bullet.SetVar("Type",1)
		bullet.SetVar("M",3)
		bullet.sprite.rotation = 225
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400,400)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = 45
		bullet.SetVar("M",6)
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",400,-400)
		bullet.SetVar("Type",1)
		bullet.SetVar("M",7)
		bullet.sprite.rotation = -225
		table.insert(bullets,bullet)
		local bullet = CreateProjectile("Spike",-400,400)
		bullet.SetVar("Type",1)
		bullet.sprite.rotation = -45
		bullet.SetVar("M",8)
		table.insert(bullets,bullet)
	end
	
	for i=1,#bullets do
		bullet = bullets[i]
		if bullet.GetVar("M") == 1 then
			bullet.Move(0,-10)
		elseif bullet.GetVar("M") == 2 then
			bullet.Move(10,0)
		elseif bullet.GetVar("M") == 3 then
			bullet.Move(10,10)
		elseif bullet.GetVar("M") == 4 then
			bullet.Move(0,10)
		elseif bullet.GetVar("M") == 5 then
			bullet.Move(-10,0)
		elseif bullet.GetVar("M") == 6 then
			bullet.Move(-10,-10)
		elseif bullet.GetVar("M") == 7 then
			bullet.Move(-10,10)
		elseif bullet.GetVar("M") == 8 then
			bullet.Move(10,-10)
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 500 then
        EndWave()
    end
end