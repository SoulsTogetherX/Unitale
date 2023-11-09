spawntimer = 0
bullets = {}
Arrow = CreateProjectile('Arrow05',-200,0)
Arrow.sprite.xscale = 2
Arrow.sprite.yscale = 2
Arrow.sprite.color = {1.00,0.00,0.00}
Flash = 1
WAVETIMER = 0
wavetimer = 100
Speed_Up_Down = 0
Speed_Left_Right = 6

Bullet_Up_Down = Speed_Up_Down
Bullet_Left_Right = Speed_Left_Right

function Update()
    WAVETIMER = (WAVETIMER + 1)
    spawntimer = WAVETIMER
    if (spawntimer+10)%15 == 0 and spawntimer > 50 then -- 15 is how many frames it takes to create another bullet
        local posx = 300
        local posy = 50
        local bullet = CreateProjectile('Spike', posx, posy)
		bullet.SetVar('velx', 0)
        bullet.SetVar('vely', 70 - 130*math.random())
        table.insert(bullets, bullet)
		Audio.PlaySound("000029a2")
    end
    for i=1,#bullets do
        local bullet = bullets[i]
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x - Bullet_Left_Right
        bullet.MoveTo(newposx, vely)
        bullet.SetVar('vely', vely)
    end
    if spawntimer >= 50 then
	    if Arrow.isactive then
		    Arrow.Remove()
		end
    elseif spawntimer%8 == 0 then
	    Flash = Flash*(-1)
		if Flash == 1 then
		    Arrow.sprite.color = { 1.00, 0.00, 0.00 }
			Audio.PlaySound("alarm")
		elseif Flash == -1 then
		    Arrow.sprite.color = { 1.00, 1.00, 0.00 }
		end
	end
	if WAVETIMER >= 470 then -- 420 is how many frames the wave will last
	  EndWave()
	end
end
