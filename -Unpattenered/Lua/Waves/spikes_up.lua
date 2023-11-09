spawntimer = 0
bullets = {}
WAVETIMER = 0
Arrow = CreateProjectile('Arrow06',0,150)
Arrow.sprite.xscale = 2
Arrow.sprite.yscale = 2
Arrow.sprite.color = {1.00,0.00,0.00}
Flash = 1
Speed_Up_Down = 5
Speed_Left_Right = 0

Bullet_Up_Down = Speed_Up_Down
Bullet_Left_Right = Speed_Left_Right

function Update()
    WAVETIMER = (WAVETIMER + 1)
	spawntimer = WAVETIMER
    if (spawntimer)%15 == 0 and spawntimer >= 50 then -- 15 is how many frames it takes to create another bullet
        local posx = 0
        local posy = -200
        local bullet = CreateProjectile('Spike_up', posx, posy)
		bullet.SetVar('vely', -140)
        bullet.SetVar('velx', 70 - 145*math.random())
		bullet.SetVar("Type", 1)
        table.insert(bullets, bullet)
		Audio.PlaySound("000029a2")
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
    for i=1,#bullets do
        local bullet = bullets[i]
        local vely = bullet.GetVar('vely')
		local velx = bullet.GetVar('velx')
        local newposy = bullet.y + Bullet_Up_Down
        bullet.MoveTo(velx, newposy)
        bullet.SetVar('newposy', vely)
    end
	if WAVETIMER >= 470 then -- 470 is how many frames the wave will last
	  EndWave()
	end
    function OnHit(bullet)
        if bullet.isactive then
		    if bullet.GetVar("Type") == 1 then
			    Player.Hurt(2)
    	    end
        end
    end
end
