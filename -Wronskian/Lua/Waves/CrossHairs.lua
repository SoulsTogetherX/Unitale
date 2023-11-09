timer = 0
bullets = {}
bullets2 = {}

function Update()
	timer = timer + 1
	if timer%25 == 0 then
		local Cross = CreateProjectile("CrossHair",Player.x,Player.y)
		Cross.sprite.Scale(2,2)
		Cross.SetVar("S",2)
		Cross.SetVar("B",0)
		Cross.SetVar("Y",0)
		Cross.sprite.color = { 1.00, Cross.GetVar("Y"), Cross.GetVar("B")}
		table.insert(bullets,Cross)
	end
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
				Audio.PlaySound("Break2")
				local Boom = CreateProjectile("Boom",bullet.x,bullet.y)
				Boom.ppcollision = true
				Boom.sprite.Scale(0.1,0.1)
				Boom.SetVar("S",0.1)
				Boom.SetVar("Type",1)
				table.insert(bullets2,Boom)
				bullet.remove()
			end
		end
	end
	for i=1, #bullets2 do
		bullet = bullets2[i]
		if bullet.isactive == true then
			bullet.SetVar("S",bullet.GetVar("S") + (1/25))
			bullet.sprite.alpha = 2 - bullet.GetVar("S")
			bullet.sprite.Scale(bullet.GetVar("S"),bullet.GetVar("S"))
			if bullet.sprite.xscale >= 2 then
				bullet.remove()
			end
		end
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
			Player.Hurt(7)
		end
	end
    if timer >= 550 then
        EndWave()
    end
end