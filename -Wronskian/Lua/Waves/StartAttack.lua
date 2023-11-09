timer = 0
bullets = {}
bullets2 = {}

SetPPCollision(true) 
Arena.ResizeImmediate(155, 155)
Player.MoveTo(0,0,false)

B1 = CreateProjectile("Spike",0,150)
B1.SetVar("Type",1)
B1.sprite.color = { 1.00, 0.00, 0.00 }
B1.sprite.rotation  = -90
B1.sprite.Scale(2,2)

B2 = CreateProjectile("Spike",0,-150)
B2.SetVar("Type",1)
B2.sprite.color = { 1.00, 0.00, 0.00 }
B2.sprite.rotation  = 90
B2.sprite.Scale(2,2)

B3 = CreateProjectile("Spike",150,0)
B3.SetVar("Type",1)
B3.sprite.color = { 1.00, 0.00, 0.00 }
B3.sprite.rotation  = 180
B3.sprite.Scale(2,2)

B4 = CreateProjectile("Spike",-150,0)
B4.SetVar("Type",1)
B4.sprite.color = { 1.00, 0.00, 0.00 }
B4.sprite.Scale(2,2)

M = 2

function Update()
	timer = timer + 1
	if timer == 50 then
		local Cross = CreateProjectile("CrossHair",Arena.width/2 - 10,Arena.height/2 - 10)
		Cross.sprite.Scale(2,2)
		Cross.SetVar("S",2)
		Cross.SetVar("B",0)
		Cross.SetVar("Y",0)
		Cross.sprite.color = { 1.00, Cross.GetVar("Y"), Cross.GetVar("B")}
		table.insert(bullets,Cross)

		local Cross = CreateProjectile("CrossHair",-Arena.width/2 + 10,Arena.height/2 - 10)
		Cross.sprite.Scale(2,2)
		Cross.SetVar("S",2)
		Cross.SetVar("B",0)
		Cross.SetVar("Y",0)
		Cross.sprite.color = { 1.00, Cross.GetVar("Y"), Cross.GetVar("B")}
		table.insert(bullets,Cross)

		local Cross = CreateProjectile("CrossHair",Arena.width/2 - 10,-Arena.height/2 + 10)
		Cross.sprite.Scale(2,2)
		Cross.SetVar("S",2)
		Cross.SetVar("B",0)
		Cross.SetVar("Y",0)
		Cross.sprite.color = { 1.00, Cross.GetVar("Y"), Cross.GetVar("B")}
		table.insert(bullets,Cross)

		local Cross = CreateProjectile("CrossHair",-Arena.width/2 + 10,-Arena.height/2 + 10)
		Cross.sprite.Scale(2,2)
		Cross.SetVar("S",2)
		Cross.SetVar("B",0)
		Cross.SetVar("Y",0)
		Cross.sprite.color = { 1.00, Cross.GetVar("Y"), Cross.GetVar("B")}
		table.insert(bullets,Cross)
	end
	B1.Move(0,M)
	B2.Move(0,-M)
	B3.Move(M,0)
	B4.Move(-M,0)
	M = M - 0.1
	for i=1, #bullets do
		bullet = bullets[i]
		if bullet.isactive == true then
			bullet.sprite.rotation = bullet.sprite.rotation + (270 / 50)
			bullet.SetVar("S",bullet.GetVar("S") - (1/50))
			bullet.sprite.Scale(bullet.GetVar("S"),bullet.GetVar("S"))
			bullet.SetVar("B", bullet.GetVar("B") + 0.02)
			bullet.SetVar("Y", bullet.GetVar("Y") + 0.02)
			bullet.sprite.color = { 1.00, bullet.GetVar("Y"), bullet.GetVar("B")}
			if bullet.sprite.rotation >= 270 then
				local Boom = CreateProjectile("Boom",bullet.x,bullet.y)
				Boom.ppcollision = true
				Boom.sprite.Scale(0.1,0.1)
				Boom.SetVar("S",0.1)
				Boom.sprite.color = { 1.00, 0.00, 0.00 }
				Boom.SetVar("Type",1)
				table.insert(bullets2,Boom)
				bullet.remove()
			end
		end
	end
	for i=1, #bullets2 do
		bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.SetVar("S",bullet.GetVar("S") + (1/15))
			bullet.sprite.alpha = 3 - bullet.GetVar("S")
			bullet.sprite.Scale(bullet.GetVar("S"),bullet.GetVar("S"))
			if bullet.sprite.xscale >= 3 then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then 
			Player.Hurt(99)
		end
	end
    if timer >= 200 then
		SetGlobal("D1",true)
        EndWave()
    end
end