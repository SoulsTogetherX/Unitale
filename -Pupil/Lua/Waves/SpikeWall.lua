-- The bouncing bullets attack from the documentation example.
timer = 0
bullets = {}
Bullet = CreateProjectile("Spike",300,0)
Bullet.SetVar("V",0)
Bullet.SetVar("H",-2)
Bullet.SetVar("Type",1)
table.insert(bullets,Bullet)
Audio.PlaySound("Shoot2")
Bullet2 = CreateProjectile("Spike",-300,0)
Bullet2.sprite.rotation = 180
Bullet2.SetVar("V",0)
Bullet2.SetVar("H",2)
Bullet2.SetVar("Type",1)
table.insert(bullets,Bullet2)
Audio.PlaySound("Shoot2")
a = 0
b = 0
SetPPCollision(true)
function Update()
    timer = timer + 1
	if Bullet.x < Arena.width/2 + 50 and a == 0 then
		for i=1,20 do
			local bullet = CreateProjectile("Spike",Bullet.x,Bullet.y)
			bullet.SetVar("V",(math.random()*10)-5)
			bullet.SetVar("H",-2)
			bullet.SetVar("Type",1)
			table.insert(bullets,bullet)
		end
		Audio.PlaySound("Shoot4")
		Audio.PlaySound("Shoot4")
		a = 1
	end
	if Bullet2.x > -Arena.width/2 - 50 and b == 0 then
		for i=1,20 do
			local bullet = CreateProjectile("Spike",Bullet2.x,Bullet2.y)
			bullet.SetVar("V",(math.random()*10)-5)
			bullet.SetVar("H",2)
			bullet.sprite.rotation = 180
			bullet.SetVar("Type",1)
			table.insert(bullets,bullet)
		end
		Audio.PlaySound("Shoot4")
		Audio.PlaySound("Shoot4")
		b = 1
	end
	for i=1,#bullets do
		bullet = bullets[i]
		bullet.SetVar("V",bullet.GetVar("V")/1.05)
		bullet.Move(bullet.GetVar("H"),bullet.GetVar("V"))
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > 4 and bullet.isactive == true then
			Player.Hurt(4,0.2)
		elseif bullet.isactive == true and Player.isHurting == false then
			SetGlobal("Stop",true)
			SetGlobal("DEAD",true)
		end
	end
    if timer >= 300 then
        EndWave()
    end
end