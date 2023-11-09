bullets = {}
bullets_up = {}
Arena.Resize(16, 200)
timer = 0
newposx = 0

function Update()
    timer = timer + 1
    if (timer+10)%30 == 0 then -- 15 is how many frames it takes to create another bullet
        local posx = 50
        local posy = (70 - 130*math.random())
        local bullet = CreateProjectile('bulletA', posx, posy)
		bullet.SetVar('velx', 0)
        bullet.SetVar('vely', 95 - 200*math.random())
        table.insert(bullets, bullet)
	    bullet.SetVar("Type", -1)
    end
	if (timer+10)%100 == 0 then -- 15 is how many frames it takes to create another bullet
        local posx = 0
        local posy = -100
        local bullet = CreateProjectile('Spike_up', posx, posy)
		bullet.SetVar('velx', 0)
        bullet.SetVar('vely', 0)
		local isOrange = math.random() >= 0.5
    	if isOrange then
    		bullet.sprite.color = { 1.00, 0.65, 0.00 }
			table.insert(bullets_up, bullet)
			bullet.SetVar("Type", 0)
    	else
    		bullet.sprite.color = { 0.02, 0.37, 0.97 }
			table.insert(bullets_up, bullet)
			bullet.SetVar("Type", 1)
    	end
    end
    for i=1,#bullets do
        local bullet = bullets[i]
		if bullet.isactive == true then
		   local vely = bullet.GetVar('vely')
           local newposx = bullet.x - 1
           bullet.MoveTo(newposx, vely)
           bullet.SetVar('vely', vely)
		end
		if bullet.x < (Arena.width/2)-15 then
			if bullet.isactive == true then
				bullet.Remove()
			end
        end
    end
	for i=1,#bullets_up do
        local bullet = bullets_up[i]
		if bullet.isactive == true then
		   local velx = bullet.GetVar('velx')
           local newposy = bullet.y + 1
           bullet.MoveTo(velx, newposy)
           bullet.SetVar('velx', velx)
		end
		if bullet.y > (Arena.height/2)+15 and bullet.isactive == true then
          bullet.Remove()
        end
    end
    function OnHit(bullet)
        if bullet.isactive then
		    if bullet.GetVar("Type") == -1 then
			    Player.Hurt(2)
        	elseif bullet.GetVar("Type") == 0 and not Player.isMoving then
    	    	Player.Hurt(4)
    	    elseif bullet.GetVar("Type") == 1 and Player.isMoving then
    		    Player.Hurt(4)
    	    end
        end
    end
    if timer >= 500 then
        EndWave() 
    end
end