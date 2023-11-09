spawntimer = 0
Rbullets = {}
Ubullets = {}
Arrow = CreateProjectile('Arrow00',-150,150)
Arrow.sprite.xscale = 2
Arrow.sprite.yscale = 2
Arrow.sprite.color = {1.00,0.00,0.00}
Flash = 1
WAVETIMER = 0
wavetimer = 100
Speed_Up_Down = 2
Speed_Left_Right = 2

Bullet_Up_Down = Speed_Up_Down
Bullet_Left_Right = Speed_Left_Right

function Update()
    WAVETIMER = (WAVETIMER + 1)
    spawntimer = WAVETIMER
    if (spawntimer+10)%20 == 0 and spawntimer > 50 then -- 20 is how many frames it takes to create another bullet
        local posx = 300
        local posy = 50
        local bullet = CreateProjectile('Spike', posx, posy)
		bullet.SetVar('velx', 0)
        bullet.SetVar('vely', 70 - 130*math.random())
        table.insert(Rbullets, bullet)
		Audio.PlaySound("000029a2")
    end
    
    for i=1,#Rbullets do
        local bullet = Rbullets[i]
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x - Bullet_Left_Right
        bullet.MoveTo(newposx, vely)
        bullet.SetVar('vely', vely)
    end
    if (spawntimer+10)%20 == 0 and spawntimer > 50 then -- 20 is how many frames it takes to create another bullet
        local posx = 0
        local posy = -200
        local bullet = CreateProjectile('Spike_up', posx, posy)
		bullet.SetVar('vely', -140)
        bullet.SetVar('velx', 70 - 145*math.random())
        table.insert(Ubullets, bullet)
    end
	if spawntimer >= 50 then
	    if Arrow.isactive then
		    Arrow.Remove()
		end
    elseif spawntimer%8 == 0 then
	    Flash = Flash*(-1)
		if Flash == 1 then
			Audio.PlaySound("alarm")
		    Arrow.sprite.color = { 1.00, 0.00, 0.00 }
		elseif Flash == -1 then
		    Arrow.sprite.color = { 1.00, 1.00, 0.00 }
		end
	end
    for i=1,#Ubullets do
        local bullet = Ubullets[i]
        local vely = bullet.GetVar('vely')
		local velx = bullet.GetVar('velx')
        local newposy = bullet.y + Bullet_Up_Down
        bullet.MoveTo(velx, newposy)
        bullet.SetVar('newposy', vely)
    end
	
	if WAVETIMER >= 470 then -- 470 is how many frames the wave will last
	  EndWave()
    end
end